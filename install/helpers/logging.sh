collie_log_to_stdout() {
  [[ ${COLLIE_LOG_TO_STDOUT:-} == "1" || -z ${COLLIE_INSTALL_LOG_FILE:-} ]]
}

collie_log_line() {
  if collie_log_to_stdout; then
    echo "$1"
  else
    echo "$1" >>"$COLLIE_INSTALL_LOG_FILE"
  fi
}

start_install_log() {
  if ! collie_log_to_stdout; then
    mkdir -p "$(dirname "$COLLIE_INSTALL_LOG_FILE")"
    touch "$COLLIE_INSTALL_LOG_FILE"
    chmod 666 "$COLLIE_INSTALL_LOG_FILE" 2>/dev/null || true
  fi

  export COLLIE_START_TIME="${COLLIE_START_TIME:-$(date '+%Y-%m-%d %H:%M:%S')}"
  export COLLIE_START_EPOCH="${COLLIE_START_EPOCH:-$(date +%s)}"

  collie_log_line "=== Collie Setup Started: $COLLIE_START_TIME ==="
}

stop_install_log() {
  local end_time end_epoch duration mins secs
  end_time=$(date '+%Y-%m-%d %H:%M:%S')
  end_epoch=$(date +%s)

  collie_log_line "=== Collie Setup Completed: $end_time ==="

  if [[ -n ${COLLIE_START_EPOCH:-} ]]; then
    duration=$((end_epoch - COLLIE_START_EPOCH))
    mins=$((duration / 60))
    secs=$((duration % 60))
    collie_log_line "Collie setup: ${mins}m ${secs}s"
  fi
}

run_logged() {
  local script="$1"
  local exit_code errexit_was_set=0

  collie_log_line "[$(date '+%Y-%m-%d %H:%M:%S')] Starting: $script"

  case $- in
    *e*)
      errexit_was_set=1
      set +e
      ;;
  esac

  local runner=(bash -eE)
  if [[ ${COLLIE_INSTALL_DEBUG:-} == "1" ]]; then
    runner=(bash -x -eE)
  fi

  if collie_log_to_stdout; then
    PS4='+ ${BASH_SOURCE[0]##*/}:${LINENO}:${FUNCNAME[0]:-main}: ' \
      "${runner[@]}" -c 'source "$1"' bash "$script" </dev/null 2>&1
  else
    PS4='+ ${BASH_SOURCE[0]##*/}:${LINENO}:${FUNCNAME[0]:-main}: ' \
      "${runner[@]}" -c 'source "$1"' bash "$script" </dev/null >>"$COLLIE_INSTALL_LOG_FILE" 2>&1
  fi

  exit_code=$?
  (( errexit_was_set )) && set -e

  if (( exit_code == 0 )); then
    collie_log_line "[$(date '+%Y-%m-%d %H:%M:%S')] Completed: $script"
  else
    collie_log_line "[$(date '+%Y-%m-%d %H:%M:%S')] Failed: $script (exit code: $exit_code)"
  fi

  return $exit_code
}
