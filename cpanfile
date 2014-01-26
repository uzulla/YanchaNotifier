requires 'perl', '5.008001';
requires 'Net::Twitter::Lite::API::V1_1';
requires 'Net::OAuth';
requires 'Unruly';

on 'test' => sub {
    requires 'Test::More', '0.98';
};

