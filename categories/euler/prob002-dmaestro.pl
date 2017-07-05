use v6;

=begin pod

=TITLE Even Fibonacci numbers

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=2>

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e2.pl6|Solution>

=end pod

# perl6 code solving the given problem

say [+] ( 1,2,*+* ...^  * > 4_000_000 ).grep( * %% 2)
