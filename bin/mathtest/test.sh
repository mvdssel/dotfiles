#!/usr/local/bin/bash

cd $( echo "$0"|sed -E "s@`basename $0`@@" )

echo -e "C++\n\t\c"
./test
echo -e "nodejs\n\t\c"
node test.js
echo -e "php\n\t\c"
php test.php
echo -e "perl\n\t\c"
perl test.pl
echo -e "python\n\t\c"
python3 test.py
