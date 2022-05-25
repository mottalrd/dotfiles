if ! is-executable pip3; then
  echo "Skipped: pip packages (missing: pip)"
  return
fi

pip3 install git-sweep
pip3 install neovim-remote
