use v5.22;
use warnings;

use Test::More;

use lib qw< tlib t/tlib >;
use Data::Checks::TestUtils 'INT';

sub GOOD_VALUES {
    -1e99,    -0.9e99, -10, -1,  0,   1, 7, 99,
      -10.0,  -1.0,    0.0, 1.0, 7.0, 99.0,
      q{-10}, q{0},    q{1},
      0.9e99, 1e99,
      Class::WithOverload->new(),;
}

sub BAD_VALUES {
    100000000000.1, -10.1, -1.1, 0.1, 1.1, 7.1, 99.9,
      q{}, q{string},
      v1, v1.2, v1.2.3,
      undef, [], {}, *STDIN, qr{}, \1, sub { },
      Class::Base->new(),
      Class::NoOverload->new(),;
}

use Data::Checks;

my ( $scalar, @array, %hash ) :of(INT) = 0;

# Assignments must pass the INT check...
for my $good_value (GOOD_VALUES) {
    my $good_value_str = Data::Checks::Parser::pp($good_value);
    OKAY { $scalar    = $good_value } "scalar = $good_value_str";
    OKAY { $array[0]  = $good_value } "array  = $good_value_str";
    OKAY { $hash{key} = $good_value } "hash   = $good_value_str";
}

for my $bad_value (BAD_VALUES) {
    my $bad_value_str = Data::Checks::Parser::pp($bad_value);
    FAIL_ON_ASSIGN { $scalar    = $bad_value } "scalar = $bad_value_str";
    FAIL_ON_ASSIGN { $array[0]  = $bad_value } "array  = $bad_value_str";
    FAIL_ON_ASSIGN { $hash{key} = $bad_value } "hash   = $bad_value_str";
}

done_testing();

