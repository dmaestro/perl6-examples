use v6;

=begin pod

=TITLE 10001st prime

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=7>

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13,
we can see that the 6th prime is 13.

What is the 10 001st prime number?

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e7.pl6|Solution>

=end pod

# perl6 code solving the given problem

sub MAIN(:$nth = 10001) {
    say (2,3, (* + 2) ... *).grep( { .is-prime } )[$nth - 1];
}
