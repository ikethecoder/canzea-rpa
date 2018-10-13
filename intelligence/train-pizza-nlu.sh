docker run \
   -v `pwd`:/tmp \
   --mount type=bind,source=/rasa/models,target=/app/models \
   rasa/rasa_nlu:latest-full run python -m rasa_nlu.train -c /tmp/nlu_config.yml --data /tmp/pizza-nlu.md -o /app/models --fixed_model_name nlu --project current --verbose
