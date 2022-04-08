# get access token
access_token=`curl \
    --data "refresh_token=$REFRESH_TOKEN" \
    --data "client_id=$CLIENT_ID" \
    --data "client_secret=$CLIENT_SECRET" \
    --data "grant_type=refresh_token" \
    https://www.googleapis.com/oauth2/v4/token -s | jq  -r .access_token`
export VERSION=$(echo ${GITHUB_REF:10})
# upload file
gduploaded=`curl -X POST -L \
    -H "Authorization: Bearer ${access_token}" \
    -F "metadata={name :'${PDF_NAME}', parents: ['${GDRIVE_FOLDER_ID}']};type=application/json;charset=UTF-8" \
    -F "file=@${SOURCE_FOLDER_PATH}${PDF_NAME};type=application/pdf" \
    "https://www.googleapis.com/upload/drive/v3/files?uploadType=multipart"`
export FILE_ID=`echo $gduploaded | jq  -r .id`
export FILE_URL="https://drive.google.com/file/d/${FILE_ID}"
trasfer=`curl -X POST -L \
    -H "Content-Type:application/json" \
    -H "Authorization: Bearer ${access_token}" \
    -d "{\"role\":\"owner\",\"type\":\"user\",\"emailAddress\":\"${EMAIL_ADDRESS}\"}" \
    "https://www.googleapis.com/drive/v3/files/${FILE_ID}/permissions?transferOwnership=true"`
# set environment variable
echo "::set-env name=VERSION::$VERSION"
echo "::set-env name=FILE_ID::$FILE_ID"
echo "::set-env name=FILE_URL::$FILE_URL"
echo "Uploaded ${PDF_NAME} to ${FILE_URL}"
