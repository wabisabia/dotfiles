#!/opt/homebrew/bin/fish

set focused_window (yabai -m query --windows --window)

set northern_window_exists (echo "$focused_window" | jq '."split-type" == "horizontal" and ."split-child" == "second_child"')

if test "$northern_window_exists" = "true"
  yabai -m window --swap north
else
  # Assume displays are vertically stacked, higher index means physically lower
  set display_idx (echo "$focused_window" | jq '.display')
  yabai -m window --display (math "$display_idx - 1") --focus
end
