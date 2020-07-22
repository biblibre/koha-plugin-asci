package Koha::Plugin::Com::BibLibre::AlwaysShowCheckoutsImmediately;

use Modern::Perl;

use base qw(Koha::Plugins::Base);

use C4::Context;

our $VERSION = '1.0';

our $metadata = {
    name   => 'Always Show Checkouts Immediately',
    author => 'BibLibre',
    description => 'Always show checkouts immediately in staff interface',
    date_authored   => '2020-07-22',
    date_updated    => '2020-07-22',
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
$(document).ready(function(){

});

</script>
%;
}

1;
