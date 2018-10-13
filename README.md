# canzea-rpa

## Speaking

- containerize

```
cd speaking
docker build --tag polly-python .
docker run -ti polly-python python speaking/server.py
```

- register secrets on Vault: https://vault.186527.xyz/ui/vault/secrets/secret/show/providers/aws/live
- deploy: voice/aws_polly to intg-app (Canzea Helper - Building Block Install page)
- configure resources for Consul and for creating the endpoints that appear on the Canzea Launcher page
- Go to: http://intg.186527.xyz:4022/

Testing: http://intg.186527.xyz:4022/read?voiceId=Salli&text=Hackathon%20Day&outputFormat=ogg_vorbis

```
resources:
- service_discovery_service:
      aws_polly:
        Name: aws_polly
        Address: "${d}{var.compute_instance.${instance.name}.privateIp}"
        Port: 4022
        Tags: [ "${instance.id}", "${environment.id}", "text_to_speech" ]
        Check:
          http: "http://${d}{var.compute_instance.${instance.name}.privateIp}:4022"
          interval: 10s
          timeout: 1s

- service_endpoint:
      ${instance.id}-aws-polly:
        service: aws_polly
        instance: ${instance.id}
        environment: ${environment.id}
        segment: ${segment.id}
        type: console
        secure: "http://${environment.id}.${es.fqdn}:4022"

```

## Listening

## Intelligence
``` bash
$ cd intelligence
$ ./train-pizza.sh
$ ./train-pizza-nlu.sh
$ ./run.sh
$ curl -XPOST http://intg.186527.xyz:5005/conversations/default/respond -d '{"query":"hello"}'
[{"recipient_id":"default","text":"Hello, what can I get you?"}]
$ curl http://intg.186527.xyz:5005/conversations/default/tracker
{"events":[{"confidence":null,"event":"action","name":"action_listen","policy":null,"timestamp":1539468714.278097},{"event":"user","input_channel":null,"parse_data":{"entities":[],"intent":{"confidence":1.0,"name":"greet"},"text":"hello"},"text":"hello","timestamp":1539468714.278663},{"confidence":1.0,"event":"action","name":"utter_greet","policy":"policy_1_MemoizationPolicy","timestamp":1539468714.595871},{"data":{"attachment":null,"buttons":null,"elements":null},"event":"bot","text":"Hello, what can I get you?","timestamp":1539468714.595915},{"confidence":1.0,"event":"action","name":"action_listen","policy":"policy_1_MemoizationPolicy","timestamp":1539468714.599927},{"event":"user","input_channel":null,"parse_data":{"entities":[],"intent":{"confidence":1.0,"name":null},"text":"Can I get 1 pepperoni pizza?"},"text":"Can I get 1 pepperoni pizza?","timestamp":1539468741.096052},{"confidence":1.0,"event":"action","name":"action_default_fallback","policy":"policy_0_FallbackPolicy","timestamp":1539468741.103831},{"event":"rewind","timestamp":1539468741.103843},{"confidence":1.0,"event":"action","name":"action_listen","policy":"policy_1_MemoizationPolicy","timestamp":1539468741.108185},{"event":"user","input_channel":null,"parse_data":{"entities":[],"intent":{"confidence":1.0,"name":null},"text":"Can I get 1 pepperoni pizza?"},"text":"Can I get 1 pepperoni pizza?","timestamp":1539468774.311154},{"confidence":1.0,"event":"action","name":"action_default_fallback","policy":"policy_0_FallbackPolicy","timestamp":1539468774.316469},{"event":"rewind","timestamp":1539468774.31648},{"confidence":1.0,"event":"action","name":"action_listen","policy":"policy_1_MemoizationPolicy","timestamp":1539468774.320105}],"followup_action":null,"latest_event_time":1539468774.320105,"latest_input_channel":null,"latest_message":{"entities":[],"intent":{"confidence":1.0,"name":"greet"},"text":"hello"},"paused":false,"sender_id":"default","slots":{}}
```
