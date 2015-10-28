'use strict';

var DateFactory = {
    getDates: function(from, to) {
        var dates = [from],
            current = from;
        
        while(current < to) {
            current.setDate(current.getDate() + 1);
            dates.push(current);
        }

        return dates;
    }
};

module.exports = DateFactory;
