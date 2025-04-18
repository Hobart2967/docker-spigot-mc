# Spigot Minecraft Server Dockerization

Spins up a Spigot Minecraft Server.

## Usage

```sh
docker run Hobart2967/docker-spigot-mc:<MC_VERSION>-latest
```

## Versions supported:

These are the minecraft versions published - if you need another one don't hesitate to open an issue!

- 1.20.1
- 1.20.2
- 1.20.4
- 1.20.6
- 1.21.1
- 1.21.3
- 1.21.4
- 1.21.5

## Docker Compose

```yaml
services:
  minecraft:
    image: hobart2967/docker-spigot-mc-<mc-version>:latest
    ports:
      - 25565:25565
    volumes:
      - ./config/banned-ips.json:/minecraft/server/banned-ips.json
      - ./config/banned-players.json:/minecraft/server/banned-players.json
      - ./config/bukkit.yml:/minecraft/server/bukkit.yml
      - ./config/commands.yml:/minecraft/server/commands.yml
      - ./config/ops.json:/minecraft/server/ops.json
      - ./config/permissions.yml:/minecraft/server/permissions.yml
      - ./config/spigot.yml:/minecraft/server/spigot.yml
      - ./config/server.properties:/minecraft/server/server.properties
      - ./config/whitelist.json:/minecraft/server/whitelist.json
      - ./usr/share/mc/worlds:/minecraft/server/worlds