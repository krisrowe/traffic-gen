#!/bin/bash
rm -rf output/ 

# Warm-up the Apigee demo env service.
curl -o /dev/null -s -w 'Total: %{time_total}s\n' "http://amer-demo22-prod.apigee.net/testgetapi"  --header "x-apikey: NIjCAEZCKgclx5qxVyY60WRggM6v0Cb7"

# Warm-up the Apigee prod env service.
curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "http://{orgName}-prod.apigee.net/testgetapi"  --header "x-apikey: upYgIDoREuHk3XGXeH8DweIN3J4ZfDQ5"

# Warm-up the Azure APIM env.
curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "http://apim-test-instance-001.azure-api.net/api/employee/getpoliciesAWS" --header "Ocp-Apim-Subscription-Key:  314f53c3f66340ca912cdcba567364a9"



jmeter -n -t apigee.jmx -o output/out -l output/apigee.jtl -j output/jmeter.log -e

cat output/out/statistics.json
