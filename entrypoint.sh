#!/bin/bash
set -e

mkdir -p /data/private

if [ ! -d "/data/Heroku/.git" ]; then
    echo "🆕 No existing installation found on volume, cloning Heroku..."
    git clone https://github.com/absolute-christian/Heroku /data/Heroku
    cd /data/Heroku
    pip install --no-warn-script-location --no-cache-dir -U -r requirements.txt
else
    echo "✅ Existing installation found on volume, session preserved"
fi

cd /data/Heroku
exec python -m heroku --root
