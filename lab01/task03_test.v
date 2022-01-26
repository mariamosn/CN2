`timescale 1ns / 1ps
 
module test_sram;
 
   // Inputs
   reg clk;
   reg oe;
   reg cs;
   reg we;
   reg [6:0] address;
 
   // Outputs
   wire [7:0] data;
	reg [7:0] buffer;
 
	// TODO: Put data on the bus when necessary
  // assign data = 1'bx;
	assign data = (we) ? buffer:8'bz;

   // Instantiate the Unit Under Test (UUT)
   task03 uut (
      .clk(clk), 
      .oe(oe), 
      .cs(cs), 
      .we(we), 
      .address(address), 
      .data(data)
   );
 
   initial forever
        #5 clk = ~clk;
 
   initial begin
      // Initialize Inputs
      clk = 0;
      oe = 1;
      cs = 1;
 
      // write mode
      we = 1;
      // TODO: mem[0] = 73;
		oe = 0;
		cs = 1;
		we = 1;
		address = 0;
		buffer = 8'd73;
		
      #15;
      address = 1;
      // TODO: mem[1] = 19;
		oe = 0;
		cs = 1;
		we = 1;
		buffer = 8'd19;

      #10;
      address = 2;
		oe = 0;
		cs = 1;
		we = 1;
		buffer = 8'd34;
      // TODO: mem[2] = 34;
		
      #10;
		
		// Read the written values
      address = 0;
      we = 0;
      #10;
      address = 1;
      #10;
      cs = 0;
      address = 2;
      #10;
      oe = 0;
   end
 
endmodule