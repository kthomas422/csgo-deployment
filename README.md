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

### Helpful Links:
- https://developer.valvesoftware.com/wiki/SteamCMD#Linux
- https://developer.valvesoftware.com/wiki/Counter-Strike:_Global_Offensive_Dedicated_Servers#Advanced_Configuration
- https://medium.com/alterway/deploying-a-steam-dedicated-server-on-kubernetes-645099d063e0

#### TODO:
- Add maps
- Add config
- Add password
