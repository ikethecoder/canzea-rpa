docker run \
   --mount type=bind,source=/rasa/dialogue,target=/app/dialogue \
   --mount type=bind,source=/rasa/models/current/nlu,target=/app/nlu \
   rasa/rasa_core run python -m rasa_core.run -d /app/dialogue -u /app/nlu
