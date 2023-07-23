# Do not edit this file directly. To change prereqs, edit the `dist.ini` file.

requires "Data::Dump" => "0.25";
requires "Filter::Simple" => "0";
requires "Import::Into" => "1.002005";
requires "PPR" => "0.001008";
requires "PPR::X" => "0";
requires "Scalar::Util" => "0";
requires "Sub::Uplevel" => "0.2800";
requires "Variable::Magic" => "0.63";
requires "attributes" => "0";
requires "experimental" => "0";
requires "perl" => "v5.22.0";

on 'test' => sub {
  requires "ExtUtils::MakeMaker" => "0";
  requires "File::Spec" => "0";
  requires "Hash::Ordered" => "0";
  requires "Test::More" => "0";
  requires "Test::Most" => "0";
  requires "experimentals" => "0";
};

on 'test' => sub {
  recommends "CPAN::Meta" => "2.120900";
};

on 'configure' => sub {
  requires "ExtUtils::MakeMaker" => "0";
};

on 'develop' => sub {
  requires "File::Spec" => "0";
  requires "Hash::Ordered" => "0.014";
  requires "IO::Handle" => "0";
  requires "IPC::Open3" => "0";
  requires "Test::More" => "0";
  requires "Test::Most" => "0.38";
  requires "Test::Pod" => "1.41";
};
