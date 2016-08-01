# docker-openfalcon-portal

## Build

Enter the following command in the repo directory.

```
$ docker build -t openfalcon-portal -f docker/ubuntu/Dockerfile .
```

## Run

### Basic Run

Use default configuration, and falcon-portal package.

```
$ docker run -d --name portal -p 5050:5050 openfalcon-portal
```

### Advanced Run

+ Self-defined configuration

    Replace file **config.py** and **gunicorn.conf** in the volume */config*.  
    For more details about **config.py** and **gunicorn.conf**, see [Portal](http://book.open-falcon.com/zh/install/portal.html).

For example, **config.py** and **gunicorn.conf** in /tmp/config,

```
$ docker run -d --name portal -v /tmp/config/config.py:/config/config.py -v /tmp/config/gunicorn.conf:/config/gunicorn.conf -p 5050:5050 openfalcon-portal
```
