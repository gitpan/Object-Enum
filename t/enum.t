#!perl

use strict;
use warnings;

use Test::More tests => 10;

BEGIN { use_ok("Object::Enum") }

Object::Enum->import('Enum');

sub ok_eval_fail (&$$) {
  my ($code, $text, $expect) = @_;
  eval { $code->() };
  like($@, $expect, $text);
}

ok_eval_fail { Enum() }
  no_args => qr/at least one possible/;

ok_eval_fail { Enum({ values => [1], unset => 0 }) }
  no_default => qr/must supply a defined default/;

ok_eval_fail { Enum({ values => [1], default => 2 }) }
  no_val_default => qr/must be listed/;

my $e = Enum({
  values => [qw(foo bar)],
  default => 'foo',
});

isa_ok($e, 'Object::Enum');

is $e->value, 'foo', 'default value';
ok $e->is_foo, 'default value (is_)';
ok !$e->set_bar->is_foo, '(chained) set flipped';

ok_eval_fail { $e->value('baz') }
  bad_val => qr/cannot be set to 'baz'/;

Object::Enum->import(Enum => { 
  values => [qw(red blue)], default => 'red',
  -as => 'color',
});

is(color()->value, 'red', "curried default");
