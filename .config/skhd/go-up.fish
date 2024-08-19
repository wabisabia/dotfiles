#!/opt/homebrew/bin/fish

set focused_window (yabai -m query --windows --window)

set focused_display_idx (yabai -m query --displays --display | jq '.index')
set win_display_idx (echo "$focused_window" | jq '.display')

# Focused display can be different from display of focused window
if test focused_display_idx -neq win_display_idx
  # Override behaviour
  yabai -m display --focus (math "$focused_display_idx - 1")
end

set northern_window_exists (echo "$focused_window" | jq '."split-type" == "horizontal" and ."split-child" == "second_child"')

if test "$northern_window_exists" = "true"
  yabai -m window --focus north
else
  # Assume displays are vertically stacked, higher index means physically lower
  yabai -m display --focus (math "$win_display_idx - 1")
end
