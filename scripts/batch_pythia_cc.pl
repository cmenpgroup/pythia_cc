#!/opt/local/bin/perl -w

$startNum = $ARGV[0];
$jobsNum = $ARGV[1];
$maxNum = $ARGV[2];

$homeDir = $ENV{HOME};
$workDir = "$homeDir/jlab/clas6/DMS/eg2/omega/pythia_cc";
$template = "param_pythia_5gev_template";
$prefix = "PipPim2Gammas_cut";

$i = $startNum;

while ($i < $startNum+$jobsNum) {

    
    if($i<10){
        $index = "00$i";
    }
    elsif($i<100){
        $index = "0$i";
    }
    else{
        $index = $i;
    }
    
    $randNum = int(rand(90000000));
    print "$randNum\n";
    
    open(TEMPLATE, "$workDir/$template") || die "Can't open $template";
    $paramFile = "$workDir/param_pythia_5gev_$index";
    open(PARAMETERS, "> $paramFile") || die "Can't write into $paramFile $!"; # open file for writing
    
    while (defined($line = <TEMPLATE>)) {
        $newline = $line;
        $newline =~ s#MMM#$maxNum#;
        $newline =~ s#NNN#$randNum#;
        print PARAMETERS $newline;
    }
    close(PARAMETERS);
    close(TEMPLATE);
    
    #    $logFile = "$prefix$index.log";
    #    $pythiaCMD = '$workDir/pythia.exe $paramFile >& $logFile';
    #    system($pythiaCMD);

    #    $mvCMD = "mv pythia.root $prefix$index.root";
    #    system($mvCMD);
    
    $i++;
}


