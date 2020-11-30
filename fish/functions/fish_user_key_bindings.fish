function fish_user_key_bindings
  # Still enable ctrl+f in Vim mode
  for mode in insert default visual
    bind -M $mode \cf forward-char
  end

  # Get fzf functions and set normal mode bindings
  fzf_key_bindings

  # Set fzf bindings for insert mode
  if bind -M insert > /dev/null 2>&1
    bind -M insert \cr fzf-history-widget
    bind -M insert \ct fzf-file-widget
    bind -M insert \ch fzf-cd-widget
  end
end
