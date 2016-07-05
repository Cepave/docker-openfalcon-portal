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

    Replace file **config.py** in the volume */config*.  
    For more detail about **config.py**, see [Portal](http://book.open-falcon.com/zh/install/portal.html).

For example, **config.py** in /tmp/config,

```
$ docker run -d --name portal -v /tmp/config/config.py:/config/config.py -p 5050:5050 openfalcon-portal
```
