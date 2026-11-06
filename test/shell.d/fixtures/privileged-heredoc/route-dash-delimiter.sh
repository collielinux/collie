if true; then
  cat <<-EOF | sudo tee /etc/collie/indented.conf >/dev/null
	helper=$HOME/.local/share/collie/bin/collie-agent
	EOF
fi
