# Ubuntu Perl with lots of libraries


## Run the container

```
docker run -it --rm -w /opt -v$(pwd):/opt --user ubuntu szabgab/perl bash
```




## Notes

cpanm --installdeps .
