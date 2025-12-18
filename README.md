# Ubuntu Perl with lots of libraries


## Run the container

```
docker run -it --rm -w /opt -v$(pwd):/opt --user ubuntu szabgab/perl bash
```



## Publish


### Build the image

```
$ docker build . -t szabgab/perl
```

### Tag

```
$ docker tag mydocker:latest szabgab/perl:25.10.01
$ docker tag mydocker:latest szabgab/perl:latest
```

### Push

```
$ docker push szabgab/perl:25.10.01
$ docker push szabgab/perl:latest
```


## Notes

cpanm --installdeps .
