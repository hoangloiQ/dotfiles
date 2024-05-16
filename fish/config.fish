# custom greeting
set KERNEL (uname -r)
set fish_greeting (set_color --bold efcf40)">"(set_color ef9540)"<"(set_color ea3838)">" \
  (set_color normal)"fish $FISH_VERSION" \
  (set_color normal)"| $KERNEL
"

uptime | awk -F'( |,|:)+' '{print "Uptime: " $6 " days, " $8 " hours"}'


function fish_user_key_bindings
  fish_vi_key_bindings

  # set kj to <Esc>
  bind -M insert -m default kj backward-char force-repaint
end

# remove default clock
function fish_right_prompt
  echo (set_color 71717a)"$USER"@(prompt_hostname)
end

# ace1af

# indicator for vi
function fish_mode_prompt
  switch "$fish_bind_mode"
    case "default"
      echo -n (set_color  9AC8CD)">"(set_color A0DEFF)"<"(set_color 5AB2FF)">"
    case "insert"
      echo -n (set_color  ace1af)">"(set_color B0EBB4)"<"(set_color BFF6C3)">"
    case "visual"
      echo -n (set_color  ffcbcb)"><>"
    case "*"
      echo -n (set_color )"?"
   end

  echo -n " "
end
