#!/opt/homebrew/bin/fish

# TODO: Where to move windows in destroyed space? Currently moves to first space
set destroyed_space_idx (yabai -m query --spaces --space | jq '.index')
yabai -m space --destroy
yabai -m space --focus $destroyed_space_idx; or yabai -m space --focus (math "$destroyed_space_idx - 1")
