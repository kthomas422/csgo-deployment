## CSGO Deployment

Dockerfile and scripts to build an image with CSGO installed.

### Building:
`docker build -t csgo:latest .`

### Using:
```
docker run -d \
  --restart always \
  -p 27015:27015 \
  -e SRCDS_TOKEN=<YOUR_TOKEN> \
  --name csgo
  csgo:latest
```

#### TODO:
- Add maps
- Add config
- Add password
