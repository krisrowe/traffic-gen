#!/bin/bash
rm -rf output/ 

# Warm-up the Apigee demo env service.
curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "http://amer-demo22-prod.apigee.net/testgetapi"  --header "x-apikey: NIjCAEZCKgclx5qxVyY60WRggM6v0Cb7"

# Warm-up the Apigee prod env service.
curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "http://geico-prod.apigee.net/testgetapi"  --header "x-apikey: upYgIDoREuHk3XGXeH8DweIN3J4ZfDQ5"

# Warm-up the Azure APIM env.
curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "http://apim-test-instance-001.azure-api.net/api/employee/getpoliciesAWS" --header "Ocp-Apim-Subscription-Key:  314f53c3f66340ca912cdcba567364a9"

jmeter -n -t apigee.jmx -o output/apigee -l output/apigee.jtl -j output/apigee.log -e

cat output/apigee/statistics.json

jmeter -n -t azure-apim.jmx -o output/azure-apim -l output/azure-apim.jtl -j output/azure-apim.log -e

cat output/azure-apim/statistics.json
