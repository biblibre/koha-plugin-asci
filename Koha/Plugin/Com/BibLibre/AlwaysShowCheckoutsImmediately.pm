package Koha::Plugin::Com::BibLibre::AlwaysShowCheckoutsImmediately;

use Modern::Perl;

use base qw(Koha::Plugins::Base);

use C4::Context;

our $VERSION = '1.2';

our $metadata = {
    name   => 'Always Show Checkouts Immediately',
    author => 'BibLibre',
    description => 'Always show checkouts immediately in staff interface',
    date_authored   => '2020-07-22',
    date_updated    => '2022-09-28',
    minimum_version => '18.11',
    maximum_version => undef,
    version         => $VERSION,
};

sub new {
    my ( $class, $args ) = @_;

    $args->{'metadata'} = $metadata;
    $args->{'metadata'}->{'class'} = $class;

    my $self = $class->SUPER::new($args);

    return $self;
}

# Mandatory even if does nothing
sub install {
    my ( $self, $args ) = @_;

    return 1;
}

# Mandatory even if does nothing
sub upgrade {
    my ( $self, $args ) = @_;

    return 1;
}

# Mandatory even if does nothing
sub uninstall {
    my ( $self, $args ) = @_;

    return 1;
}

sub intranet_js {
    my ( $self ) = @_;

    return q%
<script>
/*
 * Always Show Checkouts Immediately
 */
if ( typeof script !== 'undefined' && ! $.cookie("issues-table-load-immediately-" + script) ) {
    $.cookie("issues-table-load-immediately-" + script, true, { expires: 365, path: '/' });
}
</script>
%;
}

sub intranet_head {
    my ( $self ) = @_;

    return q|
<style>
/*
 * Always Show Checkouts Immediately
 */
label[for='issues-table-load-immediately'], input#issues-table-load-immediately {
    display:none;
}
</style>
|;
}



1;
