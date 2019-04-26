#!/bin/perl

#Andrew Pirelli
#SID#861223915
#HW1 Perl Implementation

foreach my $file (@ARGV) {
    if (open(my $fh, $file)) {
        while (my $row = <$fh>) {
            chomp $row;
            print "$row\n";
        } 
    }
}
