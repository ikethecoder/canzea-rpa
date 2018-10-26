
# Build

docker build -t rpa-speech-2-text-bridge .

# Run

export INPUT_SOURCE=http://intg.184924.xyz:4022

export FORWARD=http://localhost:8080/tracks

docker run -d -e INPUT_SOURCE -e FORWARD -p 4050:4050 --name s2t-bridge rpa-speech-2-text-bridge

curl -v http://localhost:4050/bridge -X POST -d text="I want to order a pizza" -d voiceId=Salli
