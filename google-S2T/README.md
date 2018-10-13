



# Export token created from google

export GOOGLE_APPLICATION_CREDENTIALS=canzea-text-to-speech-8fba9cceae11.json


# Docker Setup

docker build -t rpa-speach-2-text .

docker run -p 49160:8080 -d rpa-speach-2-text

# AWS input
http://intg.186527.xyz:4022/read?voiceId=Salli&text=Hackathon%20Day&outputFormat=ogg_vorbis
