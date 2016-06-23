#!/usr/bin/perl

package PetrGorbunovFindIndex;
use strict;
use warnings;

sub new {
    my $class   = shift;
    my $self    = {};

    bless $self, $class;
    return $self;
}

sub find {
    my ( $self, $x, $array ) = @_;
    my $index = -1;
    my $count = 0;
    my @result;

    my $first   = 0;
    my $last    = ( defined $array ) ? @$array - 1 : -1;

    #print "first=$first last=$last\n";

    if (( defined $x )&&( $last >=0 )) {

        my $middle = 0;
        while ( $first < $last ) {
            $middle = $first + int(( $last - $first )/2);

            if ( $x <= @$array[$middle] ) {
                $last = $middle;
            }
            else {
                $first = $middle + 1;
            }

            $count++;

            #print "middle=$middle first=$first last=$last count=$count index=$index\n";
        }

        if ( ($middle > 0) && ( $middle == $first ) ){
            $middle--;
        }

        my $left    = $x - @$array[$middle];
        my $right   = @$array[$first] - $x;

        if ( $right > $left ){
            $index = $middle
        }
        else {
            $index = $first;
        }
    }

    push @result, $index;
    push @result, $count; 
    return @result;
}

1;

