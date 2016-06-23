#!/usr/bin/perl

use PetrGorbunovFindIndex;
use Data::Dumper::Simple;


my @data = ( 1,13,19,40,100,157,220,224,456,1000,1001  );
my @empty;

my $obj = new PetrGorbunovFindIndex();
print Dumper( $obj );

my @res =  $obj->find( 15, \@data );
print Dumper( @res );
