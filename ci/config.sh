########## Configure CI pipeline options #####
prodUrl="http://hello-service.spin.beirut.cf-app.com/actuator/info"
stubProviderProdUrl=

# Get info for compatibility testing
if [[ ! -z "${prodUrl}" ]]; then
  prodVersion=`curl ${prodUrl} | jq '.app["version"]'`
  prodSha=`curl ${prodUrl} | jq '.app["git-sha"]'`
fi

if [[ ! -z "${stubProviderProdUrl}" ]]; then
  stubProviderProdCoordinates=`curl ${stubProviderProdUrl} | jq '.app["stub-coordinates"]'`
fi

# Comment out variables to disable tests
export PROD_VERSION_FOR_API_PRODUCER_TEST="${prodVersion}"
export PROD_SHA_FOR_DB_TEST="${prodSha}"
export STUB_FOR_API_CONSUMER_TEST="${stubProviderProdCoordinates}"

# Provide baseline info for canary deployment
BASELINE_VERSION_FOR_CANARY_DEPLOY="${prodVersion}"
BASELINE_SHA_FOR_CANARY_DEPLOY="${prodSha}"