export APIHOST="geico-prod.apigee.net"
export APIPATH="/testgetapi"
export APIHEADERNAME="x-apikey"
export APIHEADERVALUE="upYgIDoREuHk3XGXeH8DweIN3J4ZfDQ5"

sh -x ./curl-one.sh

sh -x ./jmeter-one.sh
