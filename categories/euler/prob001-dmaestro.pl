use v6;

=begin pod

=TITLE Multiples of 3 and 5

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=1>

If we list all the natural numbers below 10 that are multiples of 3 or 5, 
we get 3, 5, 6 and 9. The sum of these multiples is 23.

Find the sum of all the multiples of 3 or 5 below 1000.

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e1.pl6|Solution>

=end pod

# perl6 code solving the given problem

say [+] grep { $_ %% (3|5) }, ^1000
