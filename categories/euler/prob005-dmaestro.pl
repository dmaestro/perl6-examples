use v6;

=begin pod

=TITLE Smallest multiple

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=5>

2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all
of the numbers from 1 to 20?

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e5.pl6|Solution>

=end pod

# perl6 code solving the given problem

sub MAIN (Int :$range = 20) {
    say [lcm] 1..$range;
}
