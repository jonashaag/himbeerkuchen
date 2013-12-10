#!/bin/sh

volume() {
  amixer sset PCM playback $1%
}

# Reset volume
volume 75

# Start moc server
mocp -S

# Start playback
mocp --playit "http://pm-srv.de:29000"

# Continuously increase volume
for vol in $(seq 76 92); do
  sleep 120
  volume $vol
done

# If I haven't woken up at this point, I never will.
mocp --exit
