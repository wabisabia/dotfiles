#!/opt/homebrew/bin/fish

set focused_space_mc_idx (yabai -m query --spaces --space | jq '.index')
set display_spaces (yabai -m query --spaces --display)
set focused_space_idx (echo "$display_spaces" | jq "map(.index == $focused_space_mc_idx) | index(true)")
set prev_space_idx (math "$focused_space_idx - 1")
set prev_space_mc_idx (echo "$display_spaces" | jq ".[$prev_space_idx].index // $focused_space_mc_idx")

yabai -m space --focus $prev_space_mc_idx
