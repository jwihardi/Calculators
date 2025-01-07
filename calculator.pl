use feature qw(switch); # needed for given($option) althought deprecated

sub calculator{
  print "***************************\n";
  print "A SIMPLE CALCULATOR IN PERL\n";
  print "ENTER INPUTS WITHOUT SPACES\n";
  print "***************************\n\n\n";
  
  while(1){
    print "Enter an operation (+, -, *, /) | 'q' to quit: ";
    my $option = <STDIN>;
    chomp($option); # remove new line
    if ($option eq 'q' || $option eq 'Q'){
      last;
    }
    print "Enter number 1 (double): ";
    my $num_1 = <STDIN>;
    print "Enter number 2 (double): ";
    my $num_2 = <STDIN>;
    my $total;
    
    given($option){
      when('+'){
        $total = $num_1 + $num_2;
      }
      when('-'){
        $total = $num_1 - $num_2;
      }
      when('*'){
        $total = $num_1 * $num_2;
      }
      when('/'){
        $total = $num_1 / $num_2;
      }
    }
    print "The result is: " . $total . "\n";
  }
}

calculator()
