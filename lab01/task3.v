`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date:    09:05:00 10/19/2021 
// Design Name: 
// Module Name:    task3 
// Project Name: 
// Target Devices: 
// Tool versions: 
// Description: 
//
// Dependencies: 
//
// Revision: 
// Revision 0.01 - File Created
// Additional Comments: 
//
//////////////////////////////////////////////////////////////////////////////////
module task3(
    inout [7:0] data,
    input [6:0] address,
    input we,
    input cs,
    input oe,
    input clk
    );
	 
	reg [7:0] memory[0:127];
	reg [7:0] buffer;
    
	
	
	// TODO: Implement writing and reading in/from SRAM
	always @(posedge clk) begin
		if(cs) begin
			if (we) begin
				memory[address]=data;
			end
			else
				begin
				buffer = memory[address];
			end
	end
	end
	
	// TODO: define output value
	assign data = ((oe) && (!we) &&(cs))? buffer :8'bz;


endmodule
