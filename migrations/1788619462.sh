echo "Hand Hermes Desktop the Collie theme as a skin"

# Only the app Collie installed under Install > AI follows the theme by itself.
# A Hermes the user set up some other way keeps whatever skin they chose.
collie-pkg-present hermes-desktop || exit 0

# The same hand-over a fresh install does. A Hermes that is not ready or refuses
# the write is reported and done with there; only Collie's own failures return.
collie-theme-set-hermes --activate
