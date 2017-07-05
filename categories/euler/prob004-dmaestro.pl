use v6;

=begin pod

=TITLE Largest palindrome product

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=4>

A palindromic number reads the same both ways. The largest palindrome made
from the product of two 2-digit numbers is 9009 = 91 × 99.

Find the largest palindrome made from the product of two 3-digit numbers.

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e4.pl6|Solution>

=end pod

# perl6 code solving the given problem

sub MAIN( Int :$digits where * > 0  = 3) {
    my $start = (1~(0 x ($digits - 1))).Int;
    my $end   = (9 x $digits).Int;
    my $allowed_factor = ($start..$end); # all <$digit>-digit numbers
    my $candidate = $end * $end;
    until $candidate.&is-palindrome
        and is-product-of-two-acceptable-factors($candidate, $allowed_factor)
    {
        $candidate--;
        return if $candidate < $start * $start;
    }
    say $candidate;
}

my &word_regex = v2017.04 > $*VM.version >= v2017.01
    ?? / ^ <:Numeric(<Decimal>)+:Letter>+ $ /
    !! / ^ <:Numeric(<Numeric>)+:Letter>+ $ /;
subset Word of Cool where &word_regex;

multi sub is-palindrome( Word $word ) {
#   $word.comb eqv $word.comb.reverse
    $word eq $word.flip  # 25% faster
}

sub is-product-of-two-acceptable-factors(Int $c, Range $r) {
    for $r.grep: $c %% * {
        if ($c div $_) ~~ $r {
        #   say "Factors: $_ and {$c div $_}";
            return True;
        }
    }
    return False;
}
