use v6;

=begin pod

=TITLE Sum square difference

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=6>

The sum of the squares of the first ten natural numbers is,
1² + 2² + ... + 10² = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)² = 55² = 3025

Hence the difference between the sum of the squares of the first ten
natural numbers and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one
hundred natural numbers and the square of the sum.

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e6.pl6|Solution>

=end pod

# perl6 code solving the given problem

sub MAIN(:$first-n = 100) {
    say 2 * [+] map { [*] $_ }, (1..$first-n).combinations(2)
}
