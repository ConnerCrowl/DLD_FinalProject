// testbench to prove maximal LFSR
module tb ();


   //logic variables to route input and output to DUT
  integer handle3;
  integer desc3;
   // instantiate device under test (small LFSR)
  logic[15:0]seed_sm;
  logic clk;
  logic reset;
  logic[15:0]shift_seed_sm;
   //create file handles to write results to a file
  lfsr dut (seed_sm,clk,reset,shift_seed_sm);   
   
   //set up a clock signal
   always     
     begin
	clk = 1; #1; clk = 0; #1;
     end
   
   initial
     begin
	//set up output file
  initial
     begin
	// Gives output file name
	handle3 = $fopen("fsm.out");
	// Tells when to finish simulation
	#500 $finish;		
     end

 always 
     begin
	desc3 = handle3;
	#5 $fdisplay(desc3, "%b || %b", reset, shift_seed_sm); 
     end   
   
	//set up any book keeping variables you may want to use

	//set up a starting seed.  What happens with all 0s?
     assign seed_sm = 64'h0 00_06_76_00_04_64_64_00;

	//reset your DUT
     lfsr dut (seed_sm,clk,reset,shift_seed_sm);   
	//save the initial output of your DUT to compare with current output

	//and see whenb you repeat
     end

   always @(posedge clk)
     begin
		//output your results to a file
     end

   // check results on falling edge of clk
   always @(negedge clk) begin
		if(~reset) begin
		//check if your output equals the initial output 
		//if so, report how many iterations it took to repeat
		//this should be (2^n) - 1
		//if the output never repeats for 2^n iterations, report that
		end
	end
   
endmodule // tb

