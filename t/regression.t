#!perl

use strict;
use warnings;

use Test::More tests => 1;

use Object::Enum (
  Enum => { -as => 'foo', values => ['a', 'b'] },
);

{ 
  my $warn;
  local $SIG{__WARN__} = sub { $warn = shift };
  foo();
  foo();
  is($warn, undef, "no redefine warning");
}
