use v6;

=begin pod

=TITLE Lexicographic permutations

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=24>

A permutation is an ordered arrangement of objects. For example, 3124 is one
possible permutation of the digits 1, 2, 3 and 4. If all of the permutations
are listed numerically or alphabetically, we call it lexicographic order.
The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the
digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?


L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e24.pl6|Solution>

=end pod

# perl6 code solving the given problem

subset Nat of Int where * > 0;

# simple factorial
multi sub prefix:<f!>(0) { 1 }
multi sub prefix:<f!>(Nat $n) { [*] 1..$n }

sub MAIN(Nat :$nth = 1_000_000, Nat :$n = 10, *@symbols) {
    if (!@symbols) {
        @symbols = ^$n;
    }
    $nth.say;
    @symbols.say;
    my @output;
    my $rem = $nth - 1;
    my $count = @symbols.elems;
    return if $nth > f! $count;
    for ^$count {
        $count--;
        my $index = $rem div (f! $count);
        $rem = $rem % (f! $count);
        push @output, |@symbols.splice($index,1);
    }
    say [~] @output;
}
