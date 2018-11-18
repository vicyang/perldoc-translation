use warnings "all";
use Modern::Perl;
use Encode;
use Cwd;
use File::Slurp;
use File::Find;
use IO::Handle;
STDOUT->autoflush(1);

my $cwd = getcwd();
find(\&wanted, "./");

sub wanted 
{
    my $f = $cwd . substr( $File::Find::name, 1 );
    if ( -f $f and $f =~/.md$/ ) {
        say $f;
        handle_eol( $f );
    }
}

sub handle_eol
{
    my $text;
    my @codes = ();
    my $NUM = 0;
    $text = read_file( $_[0] );

    while ( $text =~s/(```.*?```\s*)(\r?\n)/[CODE_FLAG_${NUM}]$2/s )
    {
        push @codes, $1;
        $NUM++;
    }

    $text =~s/([^ ])(\r?\n)/$1  $2/g;      # 末尾无空格
    $text =~s/([^ ]) (\r?\n)/$1  $2/g;     # 单个空格
    $text =~s/([^ ]) {3,}(\r?\n)/$1  $2/g; # 超过3个空格

    for my $n ( 0 .. $NUM-1 )
    {
        $text =~s/\[CODE_FLAG_${n}\]/$codes[$n]/s;
    }

    write_file($_[0], $text);
}
