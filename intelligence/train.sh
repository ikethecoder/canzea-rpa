docker run \
   --mount type=bind,source=/rasa/stories.md,target=/app/stories.md \
   --mount type=bind,source=/rasa/domain.yml,target=/app/domain.yml \
   --mount type=bind,source=/rasa/dialogue,target=/app/out \
   rasa/rasa_core train
