#!/usr/bin/perl

use warnings;

open(OUT,">remap_gsa_named.txt");
open(FILE,"remap_gsa_unknown.txt");
while(<FILE>){
  chomp;
  if($_ =~ /^GSA\-(\d+)\:(\d+)/){
    $command=`grep -w $2 /data/reference_panels/ChrReportsb147/chr$1.cprs.txt`;
    if ($command ne ""){
      chomp($command);
      print OUT "$_ $command\n";
    }
  }
  elsif($_ =~ /^GSA\-(rs\d+)/){
    $command=`grep -w $1 /data/reference_panels/ChrReportsb147/chr*.cprs.txt`;
    if ($command ne ""){
      chomp($command);
      @split=split(/\t/,$command);
      @split2=split(/\:/,$split[0]);
      print OUT "$_ $split2[1]\t$split[1]\t$split[2]\n";
    }
  }
}
close(FILE);
close(OUT);
