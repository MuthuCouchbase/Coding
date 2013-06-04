#!/usr/bin/perl
use strict;
use warnings;
my @array = (12,34,56,78,90,21,3,45);
my $smallest = $array[0];
my $largest = $array[0];
foreach(@array) {
   if($_ <= $smallest) {
      $smallest = $_;
   }
   if($_ >= $largest) {
      $largest = $_;
   }
}
print "The smallest and largest are $smallest and $largest\n";
