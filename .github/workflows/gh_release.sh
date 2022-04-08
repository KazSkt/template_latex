# create release
res=`curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://api.github.com/repos/$GITHUB_REPOSITORY/releases \
-d "
{
  \"tag_name\": \"$(echo ${GITHUB_REF:10})\",
  \"target_commitish\": \"$GITHUB_SHA\",
  \"name\": \"$(echo ${GITHUB_REF:10})\",
  \"draft\": false,
  \"prerelease\": false
}"`
# extract release id
rel_id=`echo ${res} | jq  -r .id`

if [ $rel_id = "null" ]; then
  echo "Already exist."
  res=`curl -H "Authorization: token $GITHUB_TOKEN" "https://api.github.com/repos/$GITHUB_REPOSITORY/releases/tags/${GITHUB_REF:10}"`
  # extract release id
  rel_id=`echo ${res} | jq  -r .id`
else
  echo "Created a new release."
fi
# upload built pdf
uploaded=`curl -H "Authorization: token $GITHUB_TOKEN" -X POST https://uploads.github.com/repos/$GITHUB_REPOSITORY/releases/${rel_id}/assets?name=${PDF_NAME}\
  --header 'Content-Type: application/pdf'\
  --upload-file ${SOURCE_FOLDER_PATH}${PDF_NAME}`
