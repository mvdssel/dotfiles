'use strict';

var async = require('async'),
    util = require('util'),
    StationFactory = require('./StationFactory'),
    SongFactory = require('./SongFactory'),
    DateFactory = require('./DateFactory');

var PlaylistFactory = {
    getPlaylists: function(startDate, endDate, callback) {
        var playlists = {};

        var dates = DateFactory.getDates(startDate, endDate);

        async.waterfall([
                StationFactory.getStations,
                function(stations, callback) {
                    async.each(stations, function(station, stationCallback) {
                        async.each(dates, function(date, dateCallback) {
                            SongFactory.getSongs(station, date, function(error, songs) {
                                if(error) {
                                    console.error(util.format('Error while fetching songs from %s (%s):', station, date), error);
                                    dateCallback(error);
                                }
                                else {
                                    console.log(util.format('Fetched songs for %s (%s)', station, formatDate(date)));
                                    handleSongs(playlists, station, date, songs);
                                    dateCallback();
                                }
                            });
                        }, stationCallback);
                    }, callback);
                },
        ], function(error) {
            if(error) {
                console.error('Error while fetching playlists:', error);
                callback(error);
            }
            else {
                console.log('Successfully fetched all playlists!');
                callback(null, playlists);
            }
        });
    }
};

function handleSongs(playlists, station, date, songs) {
    playlists[station] = playlists[station] || {};
    playlists[station][date] = playlists[station][date] || {};
    playlists[station][date] = songs;
}

function formatDate(date) {
    return util.format('%s-%s-%s', date.getDate(), date.getMonth(), date.getFullYear());
}

module.exports = PlaylistFactory;
