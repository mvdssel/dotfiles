'use strict';

var $ = require('jquery');
var picker = require('../../node_modules/pickadate/lib/compressed/picker.js');
var pickerdate = require('../../node_modules/pickadate/lib/compressed/picker.date.js');
var PlaylistFactory = require('./PlaylistFactory');
var Serializer = require('./Serializer');

$(document).ready(function() {

/**
 * Initialize pickers
 */
var maxDate = new Date(),
    minDate = new Date(maxDate.getFullYear(), maxDate.getMonth(), 1);

var pickerOptions = {
    monthsFull: ['Januari', 'Februari', 'Maart', 'April', 'Mei', 'Juni', 'Juli', 'Augustus', 'September', 'Oktober', 'November', 'December'],
    monthsShort: ['Jan', 'Feb', 'Mrt', 'Apr', 'Mei', 'Jun', 'Jul', 'Aug', 'Sep', 'Okt', 'Nov', 'Dec'],
    weekdaysFull: ['Zondag', 'Maandag', 'Dinsdag', 'Woensdag', 'Donderdag', 'Vrijdag', 'Zaterdag'],
    weekdaysShort: ['Zon', 'Ma', 'Di', 'Woe', 'Do', 'Vr', 'Zat'],
    format: 'yyyy-mm-dd',
    firstDay: 1,
    min: minDate,
    max: maxDate,
};

var $startDate = $('#start-date').pickadate(pickerOptions);
var $endDate = $('#end-date').pickadate(pickerOptions);

var startDatePicker = $startDate.pickadate('picker');
var endDatePicker = $endDate.pickadate('picker');

/**
 * Initalize button
 */
var button = $("#download-button"); 
button.click(function() {
    var startDate = new Date(startDatePicker.get());
    var endDate = new Date(endDatePicker.get());

    if(startDate instanceof Date && endDate instanceof Date &&
       !isNaN(startDate.getTime()) && !isNaN(endDate.getTime()) &&
       startDate <= endDate
    ) {
        console.log('Valid dates selected...');
        PlaylistFactory.getPlaylists(startDate, endDate, handlePlaylists);
        $(document.body).append($('<p>').text("Downloading playlists, this may take a while..."));
    }
    else {
        console.log("Invalid dates selected...");
        alert('Invalid dates selected...');
    }
});

/**
 * Finalize method
 */
function handlePlaylists(error, playlists) {
    if(error) {
        console.error('Error while fetching playlists: ', error);
        alert('Error while fetching playlists: ' + error.message);
    }
    else {
        var csvData = Serializer.serialize(playlists);
        document.location = 'data:text/csv;charset=utf-8,' + 
                            encodeURIComponent(csvData);
    }
}

}); // end of file
