# build pdf (change if necessary)
cd ${SOURCE_FOLDER_PATH}
texfilename=$(echo "${FILE_NAME}" | cut -f 1 -d '.')
docker run -v $PWD:/working -w /working ghcr.io/ukitomato/latex:latest latexmk ${texfilename}
docker run -v $PWD:/working -w /working ghcr.io/ukitomato/latex:latest latexmk ${texfilename}
# rename pdf (e.g. [texfilename]-v1.0.0.pdf)
export PDF_NAME="${texfilename}-$(echo ${GITHUB_REF:10}).pdf"
mv "${texfilename}.pdf" ${PDF_NAME}
cd ..
echo "::set-env name=PDF_NAME::$PDF_NAME"
