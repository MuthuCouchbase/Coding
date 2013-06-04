#!/usr/bin/perl
use strict;
use warnings;
my $number = $ARGV[0];
if($number =~ /\d+/) {
   print "The fibonacci number is ".fibonacci($number)."\n";
}
sub fibonacci {
   my($num) = @_;
   if($num == 0) {
      return 0;
   }
   elsif($num == 1) {
      return 1;
   }
   else {
      return fibonacci($num-1)+fibonacci($num-2);
   }
}
