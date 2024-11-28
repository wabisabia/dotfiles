#!/opt/homebrew/bin/fish

yabai -m space --create
set created_space_idx (yabai -m query --spaces --display | jq '.[-1].index')
yabai -m window --space $created_space_idx
yabai -m space --focus $created_space_idx
