if status is-interactive
    # Commands to run in interactive sessions can go here
end

set -gx PATH \
      /bin \
      /opt/homebrew/bin \
      /opt/homebrew/sbin \
      /usr/bin \
      /usr/local/bin \
      /sbin \
      /usr/sbin \
      /Users/geo/.cargo/bin \
      /Users/geo/Library/Python/3.9/bin \
      $HOME/.local/share/nvm/$nvm_current_version/bin

set -gx PYTHONPATH \
  $HOME/Library/Python/3.9/lib/python/site-packages
