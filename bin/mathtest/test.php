<?php

$a = 1.;
$b = $a / 10.;

for ($i = 0; $i < 9; $i++) {
    $a = $a - $b;
}

$delta = 1. - $a*10.;
echo "$delta\n";

