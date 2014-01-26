#!perl
use strict;
use warnings;

use FindBin qw($Bin);
use AnyEvent;
use Unruly;
use utf8;
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

        $text =~ s/"//g;// 雑
        $text = substr($text,0,40); 
        `echo 'display notification "${text}" with title "Yancha" ' |osascript`;//ありえないsystem()に書き換えるべき
    });
});

$cv->wait;
