use v6;

=begin pod

=TITLE Factorial digit sum

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=20>

n! means n × (n − 1) × ... × 3 × 2 × 1

For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.

Find the sum of the digits in the number 100!


L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e20.pl6|Solution>

=end pod

# perl6 code solving the given problem

subset Nat of Int where * > 0;

sub MAIN(Nat :$n = 100) {
    my $nfact = [*] 1 .. $n;
    say $nfact;
    say [+] $nfact.comb.flat;
}
