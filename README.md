# Repository Branch for Stubs

Given:
`WORKSPACE=~/workspace`
`GIT_REPO=git@github.com:msathe-tech/s1p-hello-service.git`
`REPO_NAME=s1p-hello-service`
`GROUP_ID=spring.k8s`
`ARTIFACT_ID=s1p-hello-service`
`VERSION=0.0.1-SNAPSHOT`

Run:
```
cd $WORKSPACE
git clone $GIT_REPO $REPO_NAME
cd $REPO_NAME
./mvnw clean package

cd $WORKSPACE
git clone $GIT_REPO $REPO_NAME-repository
cd $REPO_NAME-repository
git checkout repository
./mvnw install:install-file -DgroupId=$GROUP_ID -DartifactId=$ARTIFACT_ID -Dversion=$VERSION -Dfile=$WORKSPACE/$REPO_NAME/target/$ARTIFACT_ID-$VERSION-stubs.jar -Dpackaging=jar -DgeneratePom=true -DlocalRepositoryPath=. -DcreateChecksum=true -Dclassifier=stubs
git add .
git commit -m "stubs for version $VERSION"
git push
```

###
Idea borrowed from:
https://gist.github.com/fernandezpablo85/03cf8b0cd2e7d8527063

Also useful:
https://dzone.com/articles/using-github-as-maven-repository
