#!/usr/bin/perl

#perl script to create notes (append them to a file)
#from the command line

$flag = shift;
$checkMe = shift;
$restOfTextBody = "";
if(!($checkMe eq "")) {
	while(!($checkMe eq "")) {
		$restOfTextBody = "$restOfTextBody $checkMe";
		$checkMe = shift;
	}
	$textBody = "${flag}$restOfTextBody";
}
else {
	$textBody = $flag;
}
#print"$textBody\n";
$timestamp = localtime();

system">> /Users/cotyembry/Desktop/Notes.md"; #create the file

$client = "Chickasaws";

if($flag eq "-d") { #-d == default
	$textBody =~ s/[ ]*-d[ ]*//g; #remove the -d with a space in front
	#$textBody =~ s/-d//g;
	system"echo '`$timestamp $client`\n\t>$textBody' >> /Users/cotyembry/Desktop/Notes.md";
}
else {
	system"echo '`$timestamp $client`\n\t>$textBody' >> /Users/cotyembry/Desktop/Notes.md";
}


#open NOTES, '>>', '/Users/cotyembry/Desktop/Notes.md' or die "Cannot open Notes.md: $!";
#	if(!($flag eq "flag")) {
#		print NOTES "\n\n```````\n$textBody";
#	}
#close NOTES;

#if(!($textBody eq "flag")) {
#	print"wrote the following to ~/Desktop/Notes.md:\n$textBody\n";
#}
#else {
#	print"Nothing to save.., stay blessed and have a good one ^_^\n";
#}