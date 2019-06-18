#!/bin/bash
rm -rf output/ 

# Warm-up the service.
curl -o /dev/null -s -w 'Total: %{time_total}s\n' "http://amer-demo22-prod.apigee.net/testgetapi"  --header "x-apikey: NIjCAEZCKgclx5qxVyY60WRggM6v0Cb7"

jmeter -n -t apigee.jmx -o output/out -l output/apigee.jtl -j output/jmeter.log -e

cat output/out/statistics.json
