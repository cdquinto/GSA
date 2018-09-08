#!/usr/bin/perl

use warnings;

open(LIST,"GSA-24v2-0_A1_b150_rsids.txt") || die "Can't open file\n";
open(OUT,">GSA-24v2-0_A1_b150_rsids_v2.txt");
open(EXT,">remap_gsa.txt");
while(<LIST>){
  chomp;
  @split=split(/\t/,$_);
  if ($split[1] =~ /^\./ || $split[1] =~ /,/){
    print EXT "$_\n";
  }
  else{
  	print OUT "$_\n";
  }
}
close(LIST);
close(OUT);
close(EXT);
