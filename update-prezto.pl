#!/usr/bin/perl
use strict;
use warnings;
use feature ':5.10';
use Cwd;

chdir or die $!;
chdir '.zprezto' or die $!;

my $remotes = `git remote -v | grep upstream | wc -l`;
chomp($remotes);

say "Updating prezto from upstream..";

unless ($remotes > 0) {
	say "Adding upstream remote..";
	system('git remote add upstream git@github.com:sorin-ionescu/prezto.git');
}
say "Fetching upstream..";
system('git fetch upstream');
say "Merging upstream using strategy 'ours'...";
system('git merge -Xours upstream/master');
