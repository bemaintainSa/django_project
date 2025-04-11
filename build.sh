#!/usr/bin/env bash
# exit on error
set -o errexit

# Set Python path explicitly
export PYTHONPATH=$PYTHONPATH:$PWD

# Install python dependencies
pip install -r requirements.txt

# Apply database migrations
python manage.py migrate

# Collect static files
python manage.py collectstatic --no-input 