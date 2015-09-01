#!/usr/bin/env perl

use strict;
use warnings;
use Getopt::Long;
use Cwd qw( getcwd realpath );
use File::Basename;
use DBI;
use FindBin;
use POSIX qw( strftime );
use Data::Dumper;
use MongoDB;

chdir $FindBin::Bin;
$| = 1;

use constant TRUE   => 1;
use constant FALSE  => 0;

my $host_os = '192.168.0.2';

# Connect to MySQL
my $dsn = "DBI:mysql:database=todo;host=$host_os";

my $dbh = DBI->connect($dsn, 'root', undef)
  or die "! Unable to connect to Mysql\n";

# Connect To MongoDB
my $mongodb    = MongoDB::MongoClient->new(host => $host_os, port => 27017);
my $database   = $mongodb->get_database( 'todo' );

# get a list of tables available in the database
my @tables = ();
my $tables_sql = "SHOW TABLES FROM todo";
my $tables_sth = $dbh->prepare($tables_sql) or die "sql prepare error: [$tables_sql]";
$tables_sth->execute()
  or die "sql execute error: [$tables_sql]";
while (my $row = $tables_sth->fetchrow_hashref) {
  push(@tables, $row->{'Tables_in_todo'});
}

foreach my $table (@tables) {
  print ("Processing table: [$table]\n");
  my $count = 0;
  
  my $sql = "select * from $table";
  my $sth = $dbh->prepare($sql) or die "sql prepare error: [$sql]";
  my $collection = $database->get_collection( $table );
  $collection->remove() or die "failed to drop collection: [$table]";
  
  $sth->execute() or die "sql execute error: [$sql]";
  while (my $row = $sth->fetchrow_hashref) {
    my $id = $collection->insert($row);
    $count++;
  }
  print ("Loaded: [$count] records\n\n");
}

exit;
__END__
