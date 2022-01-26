`timescale 1ns / 1ps

////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer:
//
// Create Date:   08:45:29 10/19/2021
// Design Name:   task01
// Module Name:   /home/student/Desktop/lab01_skel_2021_2/lab01_skel/task1_test.v
// Project Name:  lab01_skel
// Target Device:  
// Tool versions:  
// Description: 
//
// Verilog Test Fixture created by ISE for module: task01
//
// Dependencies:
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
////////////////////////////////////////////////////////////////////////////////

module task1_test;

	// Inputs
	reg [3:0] address;

	// Outputs
	wire [7:0] data;

	// Instantiate the Unit Under Test (UUT)
	task01 uut (
		.address(address), 
		.data(data)
	);

	initial begin
		// Initialize Inputs
		address = 0;

		// Wait 100 ns for global reset to finish
		#100;
		
		address = 1;
        
		// Add stimulus here

	end
      
endmodule

