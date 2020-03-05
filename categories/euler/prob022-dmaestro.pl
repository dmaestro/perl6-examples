use v6;

=begin pod

=TITLE Names scores

=AUTHOR Doug Schrag

L<https://projecteuler.net/problem=22>

Using names.txt (right click and &#39;Save Link/Target As...&#39;), a 46K text file
containing over five-thousand first names, begin by sorting it into alpha-
betical order. Then working out the alphabetical value for each name, multiply
this value by its alphabetical position in the list to obtain a name score.

For example, when the list is sorted into alphabetical order, COLIN, which is
worth 3 + 15 + 12 + 9 + 14 = 53, is the 938th name in the list. So, COLIN
would obtain a score of 938 × 53 = 49714.

What is the total of all the name scores in the file?
L<https://github.com/dmaestro/project-euler-play/blob/master/perl6_solutions/e22.pl6|Solution>

=end pod

# perl6 code solving the given problem

my @letters = ('A'..'Z');
my %letter_value := :{ (Any) => 0, @letters.clone.unshift(Nil).antipairs.flat };

my $base_path = $*PROGRAM.resolve.parent.parent;
sub MAIN(Cool :$head = Inf, *@file) {
    if ( ! @file ) {
        push @file, $base_path.child(<p022_names.txt>);
    }
    for @file -> $filename {
        say [+] $filename.IO.open(:nl-in(",")).lines\
            .head($head).sort».&{
                ++$ * [+] .comb.map({ %letter_value{$_} // 0 });
            }
    }
}
