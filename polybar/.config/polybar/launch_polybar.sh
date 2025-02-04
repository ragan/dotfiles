#!/usr/bin/env sh

# See: https://www.reddit.com/r/i3wm/comments/6lo0z0/how_to_use_polybar/
# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -x polybar >/dev/null; do sleep 1; done

PRIMARY = $(polybar -m | grep "primary" | cut -d":" -f1)

MONITOR=$PRIMARY polybar --reload primary &

for m in $(polybar -m | grep -v "primary" | cut -d":" -f1); do
	MONITOR=$m polybar --reload toph &
done
