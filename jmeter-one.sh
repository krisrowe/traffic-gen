#!/bin/bash
rm -rf output/ 
rm results-tree


jmeter -JURLHOST=$APIHOST -JURLPATH=$APIPATH \
  -JHEADERNAME="${APIHEADERNAME}" -JHEADERVALUE="${APIHEADERVALUE}" \
  -n -t webtestplan.jmx -o output/jmeter -l output/webtestout.jtl \
  -j output/webtest.log -e

cat output/jmeter/statistics.json
