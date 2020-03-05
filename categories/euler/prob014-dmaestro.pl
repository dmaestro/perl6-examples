use v6;

=begin pod

=TITLE Longest Collatz sequence

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=14>

The following iterative sequence is defined for the set of positive integers:

  n → n/2 (n is even)
  n → 3n + 1 (n is odd)

  Using the rule above and starting with 13, we generate the following sequence:
  13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1

  It can be seen that this sequence (starting at 13 and finishing at 1) contains
  10 terms. Although it has not been proved yet (Collatz Problem), it is thought
  that all starting numbers finish at 1.

  Which starting number, under one million, produces the longest chain?

  NOTE: Once the chain starts the terms are allowed to go above one million.

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e14.pl6|Solution>

=end pod

# perl6 code solving the given problem

use experimental :cached;

subset Nat of Int where * > 0;

sub prefix:<cz>(Nat $n) { $n %% 2 ?? $n div 2 !! $n * 3 + 1 }

# proto sub cz_length(Nat) is cached { * }
multi sub cz_length(1) { 1 }
multi sub cz_length(Nat $start) {
    state %length;
    %length{$start} //= 1 + cz_length(cz $start);
}

sub MAIN(Nat :$limit = 1_000_000 - 1) {
    say $limit, { cz $_ } ... 1;
    say (1..$limit).map({ ( $_ => .&cz_length ).antipair }).max.value;
}
