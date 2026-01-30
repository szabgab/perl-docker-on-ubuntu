# Ubuntu Perl with lots of libraries

Based on the [perl-tester](https://github.com/Perl/docker-perl-tester/) Docker image.

## Run the container

```
docker run -it --rm -v$(pwd):/opt --user ubuntu szabgab/perl bash
```

## Notes

```
cpanm --installdeps .
cpanm --installdeps --notest .
```
