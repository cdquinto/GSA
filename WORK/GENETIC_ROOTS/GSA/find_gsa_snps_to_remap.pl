#!/usr/bin/perl
## find the SNPs that have a name . in the manifest
## GSA-24v2-0_A1_b150_rsids.txt and that are not duplicates
use warnings;

%remove=();
open(LIST,"snps_to_remove.txt") || die "Can't open file\n";
while(<LIST>){
  chomp;
  $remove{$_}=1;
}
close(LIST);

open(FILE,"GSA-24v2-0_A1_b150_rsids.txt");
open(OUT,">GSA-24v2-0_A1_b150_rsids_nodup_nomulti.txt");
open(EXT,">remap_gsa_unknown.txt");
open(EXT2,">remap_gsa_repeats.txt");

while(<FILE>){
  chomp;
  @split=split(/\t/,$_);
  #print "$split[1]\n";
  if (!exists $remove{$split[0]}){
    if ($split[1] =~ /\./){
      print EXT "$_\n";
    }
    elsif ($split[1] =~ /,/){
      print EXT2 "$_\n";
    }
    else {
      print OUT "$_\n";
    }
  }
}
close(FILE);
close(OUT);
close(EXT);
close(EXT2);
