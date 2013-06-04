#!/usr/bin/perl
use strict;
use warnings;
my @array = (15,17,56,78,98,789,987,9876);
my $number_to_search = $ARGV[0];
my $length = scalar(@array);
foreach(@array) {
   print $_.",";
}
print "Number present is ".binary_search(0,$length)."\n";
sub binary_search {
   my($start_index, $end_index) = @_;
   if($start_index <= $end_index) {
      my $median = int (($start_index+$end_index)/2);
      if($number_to_search == $array[$median]) {
         return 1;
      }
      elsif($number_to_search < $array[$median]) {
         $end_index = $median-1;
         return binary_search($start_index, $end_index);
      }
      elsif($number_to_search > $array[$median]) {
         $start_index = $median+1;
         return binary_search($start_index, $end_index);                                                                                                                
 
      }
   }
   return 0;
}
