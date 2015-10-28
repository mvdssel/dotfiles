'use strict';

var StationFactory = require('./StationFactory'),
    SongFactory = require('./SongFactory'),
    DateFactory = require('./DateFactory');

var now = new Date(),
    begin = new Date(now.getFullYear(), now.getMonth(), 1),
    dates = DateFactory.getDates(begin, now);

var database = {};

StationFactory.getStations(handleStations);

console.log(database);

function handleStations(error, stations) {
    if(error) {
        throw new Error('cannot get stations');
    }

    stations.forEach(function(station) {
        dates.forEach(function(date) {
            SongFactory.getSongs(station, date, handleSongs);
        });
    });
}

function handleSongs(error, station, date, songs) {
    database[station] = database[station] || {};
    database[station][date] = database[station][date] || {};
    database[station][date] = songs;
}
