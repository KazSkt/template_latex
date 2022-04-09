cd src
texfilename=$(echo "${FILE_NAME}" | cut -f 1 -d '.')
docker run -v $PWD:/working -w /working texlive/texlive latexmk ${texfilename}
export PDF_NAME="${texfilename}-$(echo ${GITHUB_REF:10}).pdf"
mv "${texfilename}.pdf" ${PDF_NAME}
cd ..
echo "::set-env name=PDF_NAME::$PDF_NAME"
