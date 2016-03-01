#!/bin/bash -el

npm install rally-appsdk@${APPSDK_SRC_VERSION} --save --save-exact

git add package.json
git config user.name Hudson
git config user.email hudson@rallydev.com
git commit -F appsdk.bump --author="${JOB_NAME} <bogus@rallydev.com>"

branch_name_only=`echo $GIT_BRANCH | sed -e "s/origin\///g"`

if [ "$SHOULD_PUSH" == "true" ]; then
    git push -f origin $branch_name_only
else
    echo "NOT COMMITING!!"
    git reset --hard
fi

rm appsdk.bump
rm appsdk.tags
