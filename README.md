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
