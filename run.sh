#!/bin/bash
rm -rf output/ 

#{__P(VariableName)}{__P(VariableName)}{__P(VariableName)}{__P(VariableName)}{__P(VariableName)}{__P(VariableName)}sdfsdf Warm-up the Apigee demo env service.
#curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "http://amer-demo22-prod.apigee.net/testgetapi"  --header "x-apikey: NIjCAEZCKgclx5qxVyY60WRggM6v0Cb7"

# Warm-up the Apigee prod env service.
#curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "http://geico-prod.apigee.net/testgetapi"  --header "x-apikey: upYgIDoREuHk3XGXeH8DweIN3J4ZfDQ5"

# Warm-up the Azure APIM env.
#curl -o /dev/null -s -w '%{http_code} in %{time_total}s\n' "http://apim-test-instance-001.azure-api.net/api/employee/getpoliciesAWS" --header "Ocp-Apim-Subscription-Key:  314f53c3f66340ca912cdcba567364a9"

#cp apigee.jmx azure-apim.jmx

#sed 's/amer-demo22-prod.apigee.net/perf-poc-eastus2-01.regional.azure-api.net/g' azure-apim.jmx > azure-apim.jmx
#sed 's/\/testgetapi/\/test\//g' azure-apim.jmx > azure-apim.jmx
#sed 's/a9fecf7d693641ccb57211f2720405c6/g' > azure-apim.jmx

jmeter -n -t apigee.jmx -o output/apigee -l output/apigee.jtl -j output/apigee.log -e -Jhost=perf-poc-eastus2-01.regional.azure-api.net -Jpath=/test/ -Jheader=Ocp-Apim-Subscription-Key -Jkey=a9fecf7d693641ccb57211f2720405c6 

#cat output/apigee/statistics.json

#jmeter -n -t azure-apim.jmx -o output/azure-apim -l output/azure-apim.jtl -j output/azure-apim.log -e

#cat output/azure-apim/statistics.json
