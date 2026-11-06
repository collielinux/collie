echo "Give the ASUS Zenbook A16 (UX3607OA) working speakers, microphones and ASUS's speaker voicing"

# See install/hardware/asus/fix-asus-zenbook-a16-speakers.sh and the
# asus-zenbook-a16-ux3607oa speaker tuning.
if ! collie-hw-aarch64-qualcomm || ! collie-hw-match "UX3607OA"; then
  exit 0
fi

collie-pkg-add asus-zenbook-a16-audio

# Without the package's topology the sound card failed to probe at boot and is
# not retried, so probe it again now that the topology is there. Its SoundWire
# and software-volume rules only take full effect from the next boot.
card_driver=/sys/bus/platform/drivers/snd-x1e80100
if [[ -d $card_driver && -e /sys/bus/platform/devices/sound && ! -e $card_driver/sound ]]; then
  echo sound | sudo tee "$card_driver/bind" >/dev/null || true
fi
collie-state set reboot-required

if collie-audio-tuning match >/dev/null 2>&1; then
  collie-pkg-add lsp-plugins-lv2
  # The tuning needs the speaker sink. If the card is still not up, a missing
  # tuning must not stop the remaining migrations; it can be applied after the
  # reboot.
  collie-audio-tuning on ||
    echo "Speaker tuning not applied yet. After rebooting, run: collie audio tuning on"
fi
