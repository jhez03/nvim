<?php

function test()
{
  $a = 1;
  $b = 2;
  $c = 3;

  if ($a < $b) {
    echo "a is less than b\n";
  } elseif ($b < $c) {
    echo "b is less than c\n";
  } else {
    echo "Neither condition met\n";
  }
}
