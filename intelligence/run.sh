docker run \
   --mount type=bind,source=/rasa/dialogue,target=/app/dialogue \
   --mount type=bind,source=/rasa/models/current/nlu,target=/app/nlu \
   -p 5005:5005 \
   rasa/rasa_core run python -m rasa_core.run --enable_api -d /app/dialogue -u /app/nlu
