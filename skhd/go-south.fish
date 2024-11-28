#!/opt/homebrew/bin/fish

function go_to_southern_display
  # Assume displays are vertically stacked, higher index means physically lower
  set display_idx (yabai -m query --windows --window | jq '.display')
  yabai -m display --focus (math "$display_idx + 1")
end

yabai -m window --focus south 2>/dev/null; or go_to_southern_display
