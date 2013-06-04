#Factorial Problem
#
#!/usr/bin/perl
use strict;
use warnings;
my $number = $ARGV[0];
if($number =~ /\d+/) {
   print "The factorial is ". factorial($number)."\n";
}   
sub factorial {
   my($num) = @_;
   if($num == 0) {
      return 1;
   }    
   else {
      return $num*factorial($num-1);
   }
}
