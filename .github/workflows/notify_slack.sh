data=`cat << EOF
payload={
    "channel": "#${SLACK_CHANNEL}",
    "link_names": 1 ,
    "attachments": [
    {
        "fallback": "",
        "title": "Released PDF on Google Drive",
        "thumb_url": "https://user-images.githubusercontent.com/20383656/101183051-496df480-3692-11eb-89ab-1f9f09ddce3b.png",
        "fields": [
        {
            "title": "repo",
            "value": "<https://github.com/${GITHUB_REPOSITORY}|${GITHUB_REPOSITORY}>",
            "short": "true"
        },
        {
            "title": "version",
            "value": "<https://github.com/${GITHUB_REPOSITORY}/releases/tag/${VERSION}|${VERSION}>",
            "short": "true"
        },
        {
            "title": "Google Drive URL",
            "value": "<${FILE_URL}|${PDF_NAME}>",
            "short": "true"
        },
        ]
    }
    ]
}
EOF`
notify=`curl -X POST --data-urlencode "$data" "${SLACK_WEBHOOK_URL}"`
