#!/opt/homebrew/bin/fish

function move_to_northern_display
  # Assume displays are vertically stacked, higher index means physically lower
  set display_idx (yabai -m query --windows --window | jq '.display')
  yabai -m display --focus (math "$display_idx - 1"); or yabai -m display --focus 1
end

yabai -m window --focus north 2>/dev/null; or move_to_northern_display
