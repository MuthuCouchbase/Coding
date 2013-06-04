#!/usr/bin/perl
# Bubble Sort
use strict;
use warnings;
my @array = (12,45,56,1,2,4,67);
print "Before Sorting\n";                                                                                                                                               
 
foreach(@array) {
   print $_.",";
}
print "\n";                                                                                                                                                             
my $length = scalar(@array);                                                                                                                                            
print "The length of the array is $length\n";                                                                                                                           
for(my $i=0;$i < $length;$i++) {                                                                                                                                        
   for(my $j=0;$j < $length;$j++) {
      if($array[$j] >= $array[$i]) {                                                                                                                                    
         my $temp = $array[$j];
         $array[$j] = $array[$i];                                                                                                                                       
         $array[$i] = $temp;                                                                                                                                            
      }                                                                                                                                                                 
   }
}                                                                                                                                                                       
print "After Sorting\n";                                  
foreach(@array) {                                            
   print $_.",";                   
}
print "\n"; 
