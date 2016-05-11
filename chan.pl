#!/usr/bin/perl
use strict;
use warnings;
use WWW::Mechanize::Sleepy;

die "Usage: $0 <url> <dir>\n" unless @ARGV == 2;
my ($url, $dir) = @ARGV;

unless (-d $dir) {
    mkdir $dir or die "Error: Cannot create directory '$dir': $!\n";
}
chdir $dir;

my $mech = WWW::Mechanize::Sleepy->new(show_progress => 1, sleep => 1);
$mech->get($url);

foreach my $link ($mech->find_all_links(class => "fileThumb")) {
    my ($file) = $link->url =~ m{([^/]+)$};
    next if -e $file;

    $mech->get($link->url);
    $mech->save_content($file);
}

