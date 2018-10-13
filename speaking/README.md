

# Getting Started

```
docker build --tag rpa-speaking .

docker run -ti -v `pwd`:/home/aws/.aws -e AWS_DEFAULT_REGION=us-west-1 -p 8000:8000 polly-python --host=0.0.0.0

```

A file 'config' in local directory:

```
[profile adminuser]
aws_access_key_id = xxx
aws_secret_access_key = xxx
```

