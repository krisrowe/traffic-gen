var request = require('request');
var fs = require('fs');

var minutes = 0.1, the_interval = minutes * 60 * 1000;
var config = JSON.parse(fs.readFileSync('config.json', 'utf8'));

setInterval(function() { makeRequests(); }, the_interval);

function makeRequests() {
	var host = config.host;
        if (!host) {
		console.log('No host specified.');
	} else {
		console.log('Making call to host: ' + host);
	}

	for (var index in config.resources) {
		var resource = config.resources[index];
		var url = 'https://' + host + resource.path;
		request(url, function (error, response, body) {
			console.log('error:', error);
	  		console.log('statusCode:', response && response.statusCode); 
	  		console.log('body:', body);
		});
	}
}
