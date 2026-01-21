# Ubuntu Perl with lots of libraries


## Run the container

```
docker run -it --rm -v$(pwd):/opt --user ubuntu szabgab/perl bash
```




## Notes

cpanm --installdeps .




## Other  New

docker build . -f New -t szabgab/perlx

docker run -it --rm -v$(pwd):/opt  --user ubuntu szabgab/perlx bash
