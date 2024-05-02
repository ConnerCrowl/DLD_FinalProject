module lfsr16(seed_sm, clk, reset, shift_seed_sm);
//inputs and outputs for a smaller implementation
input logic [15:0] seed_sm;
input logic clk;
input logic reset;
output logic [15:0] shift_seed_sm;

//perhaps 8 or 16 bits

always @(posedge clk) begin
    if(reset)
        shift_seed_sm = seed_sm;
    else
        shift_seed_sm = {shift_seed_sm[14:0],~(shift_seed_sm[15]^shift_seed_sm[14]^shift_seed_sm[12]^shift_seed_sm[3])};
end
//your implementation of the LFSR.  Remember that this 
//implementation has memory so it should be done 
//with some form of a flip-flop based register

endmodule

module lfsr64 (seed, clk, reset, shift_seed);
//inputs and outputs for the full seed size (64 bits)

input logic [63:0] seed;
input logic clk;
input logic reset;
output logic [63:0]shift_seed;

always @(posedge clk) begin
    if(reset)
        shift_seed = seed;
    else
        shift_seed = {shift_seed[62:0],~(shift_seed[63]^shift_seed[62]^shift_seed[60]^shift_seed[59])};
end
//either build a 64 bit version using your smaller implementation above
//or use the same methods from the xilinx document to build a full
//64 bit version

endmodule