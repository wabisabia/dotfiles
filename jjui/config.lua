function setup(config)
  -- register actions and bindings here
end

---@param command string[]
---@return string|false
function sh(command)
  local err_path = os.tmpname()
  local p = assert(io.popen("{ " .. table.concat(command, " ") .. "\n} 2>" .. err_path))
  local out = p:read("*a")
  local code = p:close() -- gopher-lua returns the exit status here

  local f = assert(io.open(err_path))
  local stderr = f:read("*a")
  f:close()
  os.remove(err_path)

  if code ~= 0 then
    flash({ text = stderr ~= "" and stderr:gsub("\n$", "") or ("exit " .. code), error = true })
    return false
  end
  return (out:gsub("\n+$", ""))
end

function open_files()
  local files = context.checked_files()
  if #files == 0 then
    local current = context.file()
    if current then
      files = { current }
    end
  end

  local quoted = {}
  for i, f in ipairs(files) do
    quoted[i] = "'" .. f:gsub("'", "'\\''") .. "'"
  end

  exec_shell("nvim " .. table.concat(quoted, " "))
end

---@param cmd string[]
---@return string|false
function jj_out(cmd)
  local out, err = jj(cmd)

  if err then
    flash({ text = err, error = true })
    return false
  end

  assert(type(out) == "string")

  return out
end

---@param revset string
---@param template string
---@return string|false
function jj_log(revset, template)
  return jj_out({ "log", "-r", revset, "--no-graph", "-T", template })
end

--- Repeatedly `choose` from `options` until "done" is picked or none remain.
---@param options string[]
---@param title string
---@return string[]|nil picked nil if cancelled
function choose_many(options, title)
  local DONE = "done"
  local remaining = { DONE }
  for _, o in ipairs(options) do table.insert(remaining, o) end

  local picked = {}
  while #remaining > 1 do
    local choice = choose({ options = remaining, title = title .. " (" .. #picked .. " picked)" })
    if choice == nil then return nil end
    if choice == DONE then break end
    table.insert(picked, choice)
    for i, o in ipairs(remaining) do
      if o == choice then
        table.remove(remaining, i)
        break
      end
    end
  end
  return picked
end

function github_pr_create()
  local cid = context.change_id() or "@"
  local earliest_bms = "roots(" .. cid .. ":: & bookmarks())"

  local raw_bms = jj_log(earliest_bms, "self.bookmarks().map(|bm| bm.name()).join(\"\n\")")
  if raw_bms == false then return end

  if raw_bms == "" then
    flash({ text = "No bookmarks found from revision `" .. cid .. "`", error = true })
    return
  end

  local bms = split_lines(raw_bms)

  local bm
  if #bms > 1 then
    bm = choose({ options = bms, title = "PR bookmark:", ordered = true })
    if bm == nil then return end
  else
    bm = bms[1]
  end

  local synced = jj_log(bm, "self.bookmarks().filter(|bm| bm.name() == '" .. bm .. "').first().synced()")
  if synced == false then return end

  if synced == "false" then
    local result = choose({
      options = { "Y", "N" },
      title = "Bookmark `" .. bm .. "` is not synced. Push `" .. bm .. "`?",
      ordered = false,
    })
    if result == nil then return end

    if result ~= "Y" then
      flash({ text = "Cancelled PR creation", error = false })
      return
    end

    if not jj_out({ "git", "push", "-b", bm }) then return end

    revisions.refresh()
  end

  local out = sh({ "gh", "api", "repos/{owner}/{repo}/collaborators", "--jq", "'.[].login'" })
  if not out then return end

  local reviewers = split_lines(out)

  reviewers = choose_many(reviewers, "Reviewers")
  if reviewers == nil then return end

  sh({ "gh", "pr", "create", "-H", bm, "--fill", "--reviewer", table.concat(reviewers, ",") })

  --
  -- local out, err = jj({ "log", "-r" })
  --
  -- flash("Pushing bookmark `" .. bookmark .. "`...")
  --
  -- local out, err = jj({ "git", "push", "-b", bookmark })
  --
  -- if err then
  --   flash({ text = err, error = true })
  --   return
  -- end
  --
  -- if out ~= nil then
  --   flash(out)
  -- end
end
