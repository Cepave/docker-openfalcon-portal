# docker-openfalcon-portal

## Build

Enter the following command in the repo directory.

```
$sudo docker build --force-rm=true -t openfalcon-portal .
```

## Run

### Basic Run

Use default configuration, and falcon-portal package.

```
$sudo docker run -dti --name portal -p 5050:5050 openfalcon-portal
```

### Advanced Run

+ Self-defined configuration

    Replace file **config.py** in the volume */config*.  
    For more detail about **config.py**, see [Portal](http://book.open-falcon.com/zh/install/portal.html).

+ New falcon-portal package

    Replace file **falcon-portal.tar.gz** in the volume */package*.
  
For example, **config.py** in /tmp/config and **falcon-portal.tar.gz** in /tmp/pack,

```
$sudo docker run -dti --name portal -v /tmp/pack:/package -v /tmp/config/config.py:/config/config.py -p 5050:5050 openfalcon-portal
```
