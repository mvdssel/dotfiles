#!/usr/bin/env perl

open(FILE, ">>", "test.sql");

for (my $var = 100; $var < 112; $var++) {
    print FILE "INSERT INTO `jos_poppoll_section_question_map` (`section_id`,`question_id`) VALUES (8,$var);\n"
}
print "\n";
for (my $var = 112; $var < 133; $var++) {
    print FILE "INSERT INTO `jos_poppoll_section_question_map` (`section_id`,`question_id`) VALUES (9,$var);\n"
}

