module task02 (
        input  wire       clk,     // clock
        input  wire       oe,      // output enable, active high
        input  wire       cs,      // chip select, active high
        input  wire       we,      // write enable: 0 = read, 1 = write
        input  wire [6:0] address, // adrese pentru 128 de intrari
        input  wire [7:0] data_in, // intrare de date de 8 biti
        output wire [7:0] data_out // iesire de date de 8 biti
    );
 
	// TODO: Define memory[128][8] and buffer[8]
	reg [7:0] memory[0:127];
	reg [7:0] buffer;
    
	
	
	// TODO: Implement writing and reading in/from SRAM
	always @(posedge clk) begin
		if(cs) begin
			if (we) begin
				memory[address]=data_in;
			end
			else
				begin
				buffer = memory[address];
			end
	end
	end
	
	// TODO: define output value
	assign data_out = ((oe) && (!we) &&(cs))? buffer :8'bz;
	
endmodule