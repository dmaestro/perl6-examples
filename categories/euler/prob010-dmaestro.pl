use v6;

=begin pod

=TITLE Summation of primes

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=10>

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e10.pl6|Solution>

=end pod

# perl6 code solving the given problem

subset Nat of Int where * > 0;

sub MAIN(Nat :$limit = 2_000_000) {
    say [+] (2, (3,5 ...^ * > $limit)).flat.grep: { .is-prime };
}
