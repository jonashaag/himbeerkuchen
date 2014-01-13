#!/bin/sh

. ./stations

volume() {
echo "$1"
  amixer -M sset PCM playback $1% >/dev/null
}

# Give the loudspeakers a chance to wake up
volume 30
play_random_station()
sleep 5

# Continuously increase volume
for vol in $(seq 0 65); do
  volume $vol
  sleep 10
done

sleep 60

# If I haven't woken up at this point, I never will.
mocp --exit
