#!/usr/bin/perl
use strict;
use warnings;

##
# Elke lijn in het CSV-bestand moet eindigen met ';'
# Bijvoorbeeld:
# Lift TBP 00;BP;BP02;V;3/24/14;7:20:46;
##

my $SOURCE_FILE = "./badge-registraties.csv";
my $OUTPUT_FILE = "result";

open(SOURCE, "<", $SOURCE_FILE) or die "cannot open file: $!";

# Read the column-names
chomp(my $line = <SOURCE>);
my @col_names = split ";", $line;
pop @col_names;

# Create array with hashes for each column
my @values;
push @values, {} for (0..$#col_names);

# Read the file
while(<SOURCE>) {
    chomp;
    my @row_vals = split ';';
    pop @row_vals;
    for my $i (0..$#row_vals) {
        $values[$i]->{$row_vals[$i]}++;
    }
}
close SOURCE;

# Create result-hash
my %result = map { ($col_names[$_], $values[$_]) } 0..$#col_names;

# Output as text
open(TXT_OUTPUT, ">", "$OUTPUT_FILE.txt");
while( (my $col_name, my $col_vals) = each %result) {
    print TXT_OUTPUT "$col_name\n";
    while( (my $col_value, my $count) = each %{$col_vals}) {
        printf TXT_OUTPUT "\t%-15s%5s\n", $col_value, $count;
    }
}
close TXT_OUTPUT;

# Output as csv
open(CSV_OUTPUT, ">", "$OUTPUT_FILE.csv");
while( (my $col_name, my $col_vals) = each %result) {
    print CSV_OUTPUT "$col_name;";
    while( (my $col_value, my $count) = each %{$col_vals}) {
        printf CSV_OUTPUT "$col_value;$count\n;", $col_value, $count;
    }
    print CSV_OUTPUT "\n";
}
close CSV_OUTPUT;
