use strict;
use warnings;
use inc::Module::Install;

name 'Object-Enum';
author 'Hans Dieter Pearcey <hdp@cpan.org>';
all_from;

build_requires 'Test::More' => 0;

requires 'Sub::Install'             => 0;
requires 'Sub::Exporter'            => 0;
requires 'Class::Data::Inheritable' => 0;
requires 'Class::Accessor::Fast'    => 0;

auto_install;
WriteAll;
