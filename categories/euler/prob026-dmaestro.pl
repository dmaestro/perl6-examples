use v6;

=begin pod

=TITLE Reciprocal cycles

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=26>

A unit fraction contains 1 in the numerator. The decimal representation of
the unit fractions with denominators 2 to 10 are given:

      1/2	= 	0.5
      1/3	= 	0.(3)
      1/4	= 	0.25
      1/5	= 	0.2
      1/6	= 	0.1(6)
      1/7	= 	0.(142857)
      1/8	= 	0.125
      1/9	= 	0.(1)
      1/10	= 	0.1 

  Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle. It can
  be seen that 1/7 has a 6-digit recurring cycle.

  Find the value of d &lt; 1000 for which 1/d contains the longest recurring
  cycle in its decimal fraction part.

L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e26.pl6|Solution>

=end pod

# perl6 code solving the given problem

subset Nat of Int where * > 0;

multi sub repeats(Nat $d where * %% (2|5)) {
    0;
}
multi sub repeats(Nat $d) {
    (1 ... ('9' x *) %% $d).tail;
}

sub MAIN (:$max = 1000) {
    my @repeating_fractions = (2 .. $max).grep({ .&repeats }).map: { $_ => .&repeats };
#   .say for @repeating_fractions;
    @repeating_fractions.first({
        state $max = @repeating_fractions».value.max;
        .value == $max;
    }).key.say;
}
