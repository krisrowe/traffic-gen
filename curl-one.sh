#!/bin/bash
rm -rf output/ 



curl "https://${APIHOST}${APIPATH}" --header "${APIHEADERNAME}: ${APIHEADERVALUE}"
# Repeat and show response time.
curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "${APIHOST}${APIPATH}" --header "${APIHEADERNAME}: ${APIHEADERVALUE}"

exit

#jmeter -JURLHOST=geico-prod.apigee.net -JURLPATH=/test-gcp-vm \
#  -JHEADERNAME=x-apikey -JHEADERVALUE=upYgIDoREuHk3XGXeH8DweIN3J4ZfDQ5 \
#  -n -t webtestplan.jmx -o output/apigee-gcp -l output/apigee-gcp.jtl \
#  -j output/apigee-gcp.log -e

# Test the Azure APIM API that points to Google Cloud Functions
jmeter -JURLHOST=perf-poc-eastus2-01.regional.azure-api.net -JURLPATH=/gcp-vm \
  -JHEADERNAME=Ocp-Apim-Subscription-Key -JHEADERVALUE=a9fecf7d693641ccb57211f2720405c6 \
  -n -t webtestplan.jmx -o output/azure-apim-gcp -l output/azure-apim-gcp.jtl \
  -j output/azure-apim-gcp.log -e

# Test the Apigee prod env service pointing to Azure Containers
#jmeter -JURLHOST=geico-prod.apigee.net -JURLPATH=/hello-from-gates \
#  -JHEADERNAME=x-apikey -JHEADERVALUE=upYgIDoREuHk3XGXeH8DweIN3J4ZfDQ5 \
#  -n -t webtestplan.jmx -o output/apigee-ms -l output/apigee-ms.jtl \
#  -j output/apigee-ms.log -e

# Test the Azure APIM API that points to Azure Containers
#jmeter -JURLHOST=perf-poc-eastus2-01.regional.azure-api.net -JURLPATH=/local/ \
#  -JHEADERNAME=Ocp-Apim-Subscription-Key -JHEADERVALUE=a9fecf7d693641ccb57211f2720405c6 \
#  -n -t webtestplan.jmx -o output/azure-apim-ms -l output/azure-apim-ms.jtl \
#  -j output/azure-apim-ms.log -e


echo "*** Apigee to GCP ***"
cat output/apigee-gcp/statistics.json

echo "*** Azure APIM to GCP ***"
cat output/azure-apim-gcp/statistics.json


echo "*** Apigee to Azure Containers ***"
cat output/apigee-ms/statistics.json

echo "*** Azure APIM to Azure Containers ***"
cat output/azure-apim-ms/statistics.json
