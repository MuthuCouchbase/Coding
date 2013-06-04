#!/usr/bin/perl
use strict;
use warnings;
my $range = $ARGV[0];
my $is_prime=1;
my @array;
for(my $i=2;$i<=$range;$i++) {                                                                                                                                          
   for(my $j=2;$j<=sqrt($i);$j++) {
      if($i%$j == 0) {
         $is_prime = 0;
      }
   }
   if($is_prime == 1) {
      push(@array, $i);
   }
   $is_prime = 1;
}
foreach(@array) {
   print $_.",";
}
print "\n";
