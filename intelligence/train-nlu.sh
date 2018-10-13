docker run \
   -v `pwd`:/tmp \
   --mount type=bind,source=/rasa/stories.md,target=/app/stories.md \
   --mount type=bind,source=/rasa/domain.yml,target=/app/domain.yml \
   --mount type=bind,source=/rasa/dialogue,target=/app/out \
   --mount type=bind,source=/rasa/models,target=/app/models \
   rasa/rasa_nlu:latest-full run python -m rasa_nlu.train -c /tmp/nlu_config.yml --data /tmp/nlu.md -o /app/models --fixed_model_name nlu --project current --verbose
