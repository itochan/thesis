docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja:latest platex thesis.tex
docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja:latest platex thesis.tex
docker run --rm -v $PWD:/workdir paperist/alpine-texlive-ja:latest dvipdfmx thesis.dvi
