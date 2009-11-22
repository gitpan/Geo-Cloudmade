# Before `make install' is performed this script should be runnable with
# `make test'. After `make install' it should work as `perl Geo-Cloudmade.t'

#########################

# change 'tests => 1' to 'tests => last_test_to_print';

use Test;
BEGIN { plan tests => 3 };
use Geo::Cloudmade;
use utf8;

my $geo = Geo::Cloudmade->new('BC9A493B41014CAABB98F0471D759707');
ok (defined $geo);

my ($res) = $geo->find("Potsdamer Platz,Berlin,Germany", {results=>5, skip=>0});
ok ($res->name.": ".$res->centroid->lat."/".$res->centroid->long eq 'Potsdamer Platz: 52.50939/13.37638');

my ($reverse)  = $geo->find_closest('address', [52.4870,13.4248]);
ok (join (' ', $reverse->properties('addr:housenumber', 'addr:street', 'addr:postcode', 'addr:city')) eq '10 Wissmannstraße 12049 Berlin');
