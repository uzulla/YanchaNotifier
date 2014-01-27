#!perl
use strict;
use warnings;

use FindBin qw($Bin);
use AnyEvent;
use Unruly;
use utf8;
binmode STDOUT, ":utf8";
use Encode;
use Time::Piece;

use Data::Dumper;

my $config = do "$Bin/../config.pl";

my $ur = Unruly->new(url => 'http://yancha.hachiojipm.org', tags => {PUBLIC => 1});
$ur->twitter_login($config->{twitter_id}, $config->{twitter_pass});

my $cv = AnyEvent->condvar;

$ur->run(sub {
    my ( $client, $socket ) = @_;
    $socket->on('user message', sub {
        my $post = $_[1];
        my @tags = @{$post->{tags}};
        my $nick = $post->{nickname};
        my $text = $post->{text};
        if($post->{is_message_log}){ # PlusPlus and other.
            return;
        }

        $text = $nick.">".$text;
        if($ENV{PRINT_LOG}){
            my $t = localtime;
            print $t->hms.":"."${text}\n";
        }

        $text = substr($text,0,80); 
        $text =~ s/\\/\\\\/g;
        $text =~ s/"/\\"/g;

        my $as = 'display notification "'.$text.'" with title "Yancha"';
        system('osascript', "-e", $as);
    });
});

$cv->wait;
