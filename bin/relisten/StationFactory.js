'use strict';

var request = require('request');

var homePage = 'https://relisten.be';
var regexp = new RegExp('data-stationurl="([^"]+)"', 'g');

var StationFactory = {
    getStations: function(callback) {
        request(homePage, function(error, request, body) {
            if(error) {
                callback(error);
            }
            else {
                extractStations(body, callback);
            }
        });
    },
};

function extractStations(body, callback) {
    var stations = [],
        match;

    while ((match = regexp.exec(body)) !== null) {
        stations.push(match[1]);
    }
    callback(null, stations);
}

module.exports = StationFactory;
