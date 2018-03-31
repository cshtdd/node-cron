# ARM build instructions  

## Clone the repo  

```bash
git clone https://github.com/camilin87/node-cron.git
```

## Get the latest source  

```bash
git pull --rebase
```

## Login to the Docker registry  

```bash
docker login
```

## Build the image  

```bash
docker build -f Dockerfile -t camilin87/node-cron-arm32v6 .
```

## Publish the image  

```bash
docker push camilin87/node-cron-arm32v6
```

## Cleanup  

```bash
docker rmi camilin87/node-cron-arm32v6
docker system prune -f
```
