use v6;

=begin pod

=TITLE Power digit sum

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=16>

2¹⁵ = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2¹⁰⁰⁰?

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e16.pl6|Solution>

=end pod

# perl6 code solving the given problem

say (2¹⁰⁰⁰);
say [+] (2¹⁰⁰⁰).comb.elems;
say [+] (2¹⁰⁰⁰).comb;
