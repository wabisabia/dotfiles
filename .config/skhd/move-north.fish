#!/opt/homebrew/bin/fish

function move_to_northern_display
  # Assume displays are vertically stacked, higher index means physically lower
  set display_idx (yabai -m query --windows --window | jq '.display')
  yabai -m window --display (math "$display_idx - 1") --focus
end

yabai -m window --swap north; or move_to_northern_display
