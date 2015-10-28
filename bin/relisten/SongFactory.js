'use strict';

var request = require('request'),
    util    = require('util'),
    Song    = require('./Song');

var baseUrl = 'https://relisten.be/playlists/';

var nameRegexp = new RegExp('itemprop="name">([^<]+)</span>', 'g'),
    artistRegexp = new RegExp('itemprop="byArtist">([^<]+)</span>', 'g'),
    timeRegexp = new RegExp('class="pull-right">(\\d\\d:\\d\\d)</small>', 'g');

var SongFactory = {
    getSongs: function(station, date, callback) {
        var formattedDate = util.format('%s-%s-%s', date.getDate(), date.getMonth(), date.getFullYear());
        var url = util.format('%s/%s/%s.html', baseUrl, station, formattedDate);
        request(url, function(error, request, body) {
            if(error) {
                callback(error);
            }
            else {
                var songs = extractSongs(body);
                callback(null, station, date, songs);
            }
        });
    },
};

function extractSongs(body) {
    var songs = [],
        nameMatch, artistMatch, timeMatch;

    while( (nameMatch = nameRegexp.exec(body)) !== null &&
           (artistMatch = artistRegexp.exec(body)) !== null &&
           (timeMatch = timeRegexp.exec(body)) !== null
    ) {
        songs.push(new Song(nameMatch[1], artistMatch[1], timeMatch[1]));
    }
}

module.exports = SongFactory;
