use v6;

=begin pod

=TITLE Largest prime factor

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=3>

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e3a.pl6|Solution>

=end pod

# perl6 code solving the given problem

my $n := 600851475143;
my $factors = flat(2, (3,5 ...^ * > sqrt($n) ), $n ).grep( { $n %% $_ && .is-prime } );
my $rem = $n;
for $factors.lazy -> $factor {
    while ( $rem %% $factor ) {
        $rem div= $factor;
    #   say "$factor : $rem";
    }
    if $rem == 1 {
        $factor.say;
        last;
    }
}
