'use strict';

var request = require('request'),
    util    = require('util');

var baseUrl = 'https://relisten.be/playlists';

var titleRegexp = new RegExp('itemprop="name">([^<]+)</span>', 'g'),
    artistRegexp = new RegExp('itemprop="byArtist">([^<]+)</span>', 'g'),
    playtimeRegexp = new RegExp('class="pull-right">(\\d\\d:\\d\\d)</small>', 'g');

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
                callback(null, songs);
            }
        });
    },
};

function extractSongs(body) {
    var songs = [],
        titleMatch, artistMatch, playtimeMatch;

    while( (titleMatch = titleRegexp.exec(body)) !== null &&
           (artistMatch = artistRegexp.exec(body)) !== null &&
           (playtimeMatch = playtimeRegexp.exec(body)) !== null
    ) {
        songs.push({
            title: titleMatch[1],
            artist: artistMatch[1],
            playtime: playtimeMatch[1]
        });
    }

    return songs;
}

module.exports = SongFactory;