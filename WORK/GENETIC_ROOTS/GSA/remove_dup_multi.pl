#!/usr/bin/perl

use warnings;

%duplicates=();
open(DUP,"duplicates");
while(<DUP>){
  chomp;
  $duplicates{$_}=1;
}
close(DUP);

open(BED,"GSA-24v2-0_A1.bed");
readline(BED);
open(NEW,">GSA-24v2-0_A1_nodup.bed");
while(<BED>){
  chomp;
  @split=split(/\t/,$_);
  if (exists $duplicates{$split[3]}){
    next;
  }
  else{
    print NEW "$_\n";
  }
}
close(NEW);
close(BED);

%multi=();
open(MULTI,"multiallelic_sites_gsa.txt") || die "Can't open multiallelic_sites_gsa.txt\n";
while(<MULTI>){
  chomp;
  $multi{$_}=1;
}
close(MULTI);

open(NEW2,">GSA-24v2-0_A1_nodup_nomulti.bed");
open(NEW,"GSA-24v2-0_A1_nodup.bed");
while(<NEW>){
  chomp;
  @split2=split(/\t/,$_);
  if (exists $multi{$split2[3]}){
    next;
  }
  else{
    print NEW2 "$_\n";
  }
}
close(NEW);
close(NEW2);
