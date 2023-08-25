# PeK
POC fastapi microservice architecture using Kafka

## Architecture
![pek (1)](https://github.com/JBRonaldHandiwinata/pek/assets/49512477/4c1e730d-c552-4901-ad8d-f9f72ce30ec2)

## Tech Stack
```
Mobile App: Dart/Flutter
Web App: ReactJS
Backend: 
  * Python 3.8 (FastAPI Framework)
  * Apache Kafka
```

## Installation
#### Install Kafka
```
cd kafka/
docker compose up
```

#### Run mobile_api
```commandline
python3 mobile_api/mobile_api.py
```

#### Run websocket
```commandline
python3 web_api/web_api.py
```

#### Run web-app:
```commandline
cd web-app/
npm run
```
