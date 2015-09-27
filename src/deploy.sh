#!/bin/bash

echo "=================================================================================="
echo "			maven-svn-wagon Tomcat 7 Parallel Deployment			"
echo "=================================================================================="

REPO="https://mayloom.svn.cvsdude.com/toolsuite/repository/com/mayloom/vouchertool/"

echo ">> Release REPO: $REPO"

svn list $REPO

echo ">> Type the release version you want to deploy as the latest ROOT war, followed by [ENTER]:"

read VERSION

echo ">> You selected version $VERSION"

svn checkout "$REPO$VERSION"

cd $VERSION

FILE=`ls vouchertool*.war`

COMPACT_VERSION=$(echo $VERSION | sed 's/\.//g')

mv $FILE ROOT##0$COMPACT_VERSION.war

DEPLOY_DIR="/var/lib/tomcat7/webapps/"

echo ">> Deploying to $DEPLOY_DIR"

chown tomcat7:tomcat7 ROOT##00$COMPACT_VERSION.war

mv ROOT##00$COMPACT_VERSION.war $DEPLOY_DIR

ls .

echo ">> Cleaning up..."

cd ..

rm -rf $VERSION

echo ">> Done cleaning up."

ls $DEPLOY_DIR
