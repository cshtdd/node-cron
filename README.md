# node-cron  
Docker image that runs node scheduled tasks

## Usage  
Create your own `Dockerfile` with the following contents.

```
FROM camilin87/node-cron:latest

COPY . /usr/src/app
```

Make sure to have a `package.json` with a `start` script in it.

When executing your own image pass the `TASK_SCHEDULE` environment variable in the following fashion:

```
docker run --env-file=.env -e TASK_SCHEDULE='* * * * *' -it <YOUR_IMAGE_NAME>
```


## Development  

Building the image

```
docker build --no-cache=true -t camilin87/node-cron .
```

Building the dev image

```
docker build --no-cache=true -t camilin87/node-cron-dev .
```

[Tag and Push](https://docs.docker.com/mac/step_six/)
