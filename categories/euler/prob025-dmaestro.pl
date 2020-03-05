use v6;

=begin pod

=TITLE 1000-digit Fibonacci number

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=25>

The Fibonacci sequence is defined by the recurrence relation:

    Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.

Hence the first 12 terms will be:

    F1 = 1
    F2 = 1
    F3 = 2
    F4 = 3
    F5 = 5
    F6 = 8
    F7 = 13
    F8 = 21
    F9 = 34
    F10 = 55
    F11 = 89
    F12 = 144

The 12th term, F12, is the first term to contain three digits.

What is the index of the first term in the Fibonacci sequence to contain
1000 digits?

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e25.pl6|Solution>

=end pod

# perl6 code solving the given problem

subset Nat of Int where * > 0;

sub MAIN (Nat :$digits = 1000) {
    my @fib = 1,1,{$^a + $^b} ... {.comb.elems == $digits};
    say @fib.elems;
}
