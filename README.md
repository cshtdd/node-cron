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
docker run -e TASK_SCHEDULE='* * * * *' -it <YOUR_IMAGE_NAME>
```

### Custom `npm` command  

The image also supports the execution of a custom `npm` command through the `NPM_COMMAND` environment variable.

The following command will execute `npm run dev` every minute

```
docker run \
    -e TASK_SCHEDULE='* * * * *' \
    -e NPM_COMMAND='dev' \
    -it <YOUR_IMAGE_NAME>
```
