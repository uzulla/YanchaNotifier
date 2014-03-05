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

my $ur = Unruly->new(url => $config->{yancha_url}, tags => {PUBLIC => 1});
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
        if($config->{display_log}){
            my $t = localtime;
            print $t->hms.":"."${text}\n";
        }

        $text = substr($text,0,80); 

        my @sound = ();
        if($config->{sound}){
            @sound = ('-sound', 'Submarine');
        }

        my @exe = ('terminal-notifier', '-title', 'yancha', '-message', $text, '-open', $config->{yancha_url}, @sound);
        system(@exe);
        
        if($config->{yomiage}){
            my $yomiage_text = yomiage_replace($post->{nickname}, $post->{text}); 
            my @exe = ('say', '-v', 'kyoko', '-r', $config->{yomiage_rate}, $yomiage_text);
            system(@exe);
        }
    });
});

sub yomiage_replace{
    my $nick = shift;
    my $text = shift;
    
    $nick =~ s/ytnobody/わいとんぼーい/g;
    $text =~ s/#[A-Z]+//g;

    return "$nick さん。 $text";
}

$cv->wait;
