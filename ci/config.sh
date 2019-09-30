# HARD-CODE TO TEST:
# 0.0.1-SNAPSHOT-20190928.135943Z.bd26e35

########## Configure CI pipeline options #####
prodUrl="http://hello-service.spin.beirut.cf-app.com/actuator/info"
stubProviderProdUrl=

# Get info for compatibility testing
if [[ ! -z "${prodUrl}" ]]; then
  echo -e "\nGetting version from ${prodUrl}"
  #prodVersion="$(curl ${prodUrl} | jq '.app["version"]')"
  prodVersion=0.0.1-SNAPSHOT-20190928.135943Z.bd26e35
  echo "Getting git-sha from ${prodUrl}"
  prodSha="$(curl ${prodUrl} | jq '.app["git-sha"]')"
  prodSha=bd26e35
fi

if [[ ! -z "${stubProviderProdUrl}" ]]; then
  echo -e "\n\nGetting stub-coordinates from ${stubProviderProdUrl}"
  stubProviderProdCoordinates="$(curl ${stubProviderProdUrl} | jq '.app["stub-coordinates"]')"
fi

# Comment out variables to disable tests
#export PROD_VERSION_FOR_API_PRODUCER_TEST=${prodVersion}
#export PROD_SHA_FOR_DB_TEST=${prodSha}
#export STUB_FOR_API_CONSUMER_TEST=${stubProviderProdCoordinates}

# Provide baseline info for canary deployment
BASELINE_VERSION_FOR_CANARY_DEPLOY=${prodVersion}
BASELINE_SHA_FOR_CANARY_DEPLOY=${prodSha}

echo -e "\nApp-driven configuration of CI:"
echo "PROD_VERSION_FOR_API_PRODUCER_TEST=${PROD_VERSION_FOR_API_PRODUCER_TEST}"
echo "PROD_SHA_FOR_DB_TEST=${PROD_SHA_FOR_DB_TEST}"
echo "STUB_FOR_API_CONSUMER_TEST=${STUB_FOR_API_CONSUMER_TEST}"
echo "BASELINE_VERSION_FOR_CANARY_DEPLOY=${BASELINE_VERSION_FOR_CANARY_DEPLOY}"
echo "BASELINE_SHA_FOR_CANARY_DEPLOY=${BASELINE_SHA_FOR_CANARY_DEPLOY}"