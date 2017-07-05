use v6;

=begin pod

=TITLE Special Pythagorean triplet

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=9>

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a² + b² = c²

For example, 3² + 4² = 9 + 16 = 25 = 5².

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.


L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e9.pl6|Solution>

=end pod

# perl6 code solving the given problem

sub MAIN(Int :$sum = 1000) {
    my @squares = (1 ...^ * >= $sum / 2)».&(* ** 2);
    my @pythagorean_triples = @squares.combinations(3)\
        .grep( { ([+] .cache) == .cache.max * 2 } )\  # sum of lesser squares equal to greatest
        .map( { .map( { .sqrt.Int } ) } );  # map to original root integers
    say @pythagorean_triples\
        .grep( { ([+] .cache) == $sum } )\
        .map( { [*] .cache });
}

