cd src
docker run -v $PWD:/working -w /working texlive/texlive latexmk paper.tex