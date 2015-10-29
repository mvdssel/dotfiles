'use strict';

var PlaylistFactory = require('./PlaylistFactory'),
    Serializer = require('./Serializer');

var filename = './playlists.csv';
var stopDate = new Date();
var startDate = new Date(stopDate.getFullYear(), stopDate.getMonth(), 1);

PlaylistFactory.getPlaylists(startDate, stopDate, handlePlaylists);

function handlePlaylists(error, playlists) {
    if(error) {
        console.error('Error while fetching playlists: ', error);
    }
    else {
        var csvData = Serializer.serialize(playlists);
        var fs = require('fs');
        fs.writeFile(filename, csvData, function(error) {
            if(error) {
                return console.error('Error while writing to filesystem: ', error);
            }

            console.log('The file was saved at ' + filename);
        }); 
    }
}
