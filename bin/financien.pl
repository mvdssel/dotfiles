#!/usr/bin/env perl

use strict;
use warnings;

# Reads data in the format:
#   2 x 12.0 product
#   2,16 other poduct 
#   23x1234 yet another product
#
# Prints a total in price and count.
#
# Skips empty lines and prints an error if a line can't be read.

my $total_price = 0;
my $total_count = 0;
while(<DATA>) {
    chomp;
    #           a price/count     times   a price/count      the product
    #      1     2                  3    4   5                6
    if (m/^(-?\d+([\.,]\d{1,2})?)\s+(x\s+(\d+([\.,]\d+)?)\s+)?(.*)$/) {
        # extract values
        my $count = $1 || 1;
        my $price = $4 || 1;
        my $product = $6 || "NO PRODUCT FOUND";

        # create correct numeric presentation (must come after, because resets the $-values)
        $price =~ s/,/./;
        $count =~ s/,/./;

        # $count should be the integer value (instead of $price)
        if(($price =~ m/^\d+$/ && !($count =~ /^\d+$/)) || 
           ($price < $count)
        ) {
            # print "swapping $price and $count\n";
            ($count, $price) = ($price, $count);
        }

        my $total = $price * $count;
        printf "% 6.2f = %d x% 6.2f %s\n", $total, $count, $price, $product;

        $total_price += $total;
        $total_count += $count;
    }
    elsif (! m/^\s*$/) {
        print "FOUT <<$_>>\n";
    }
}

print "Ik heb $total_price EUR uitgegeven aan $total_count producten.\n";

__DATA__
