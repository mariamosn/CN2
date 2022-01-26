`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:52:35 10/19/2021
// Design Name:   task02
// Module Name:   /home/student/Desktop/lab01_skel_2021_2/lab01_skel/task2_test.v
// Project Name:  lab01_skel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: task02
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module task2_test;

	// Inputs
	reg clk;
	reg oe;
	reg cs;
	reg we;
	reg [6:0] address;
	reg [7:0] data_in;

	// Outputs
	wire [7:0] data_out;

	// Instantiate the Unit Under Test (UUT)
	task02 uut (
		.clk(clk), 
		.oe(oe), 
		.cs(cs), 
		.we(we), 
		.address(address), 
		.data_in(data_in), 
		.data_out(data_out)
	);

	initial begin
		// Initialize Inputs
		clk = 0;
		oe = 0;
		cs = 0;
		we = 0;
		address = 0;
		data_in = 0;

		// Wait 100 ns for global reset to finish
		#100;
		oe = 0;
		cs = 1;
		we = 1;
		address = 1;
		data_in = 8'd5;
		
		#100;
		oe = 1;
		cs = 1;
		we = 0;
		address = 1;
		data_in = 8'd5;
        
		// Add stimulus here

	end
	
	always #50 begin
		clk = ~clk;
	end
      
endmodule

