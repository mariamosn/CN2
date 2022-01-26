module task04 (
        input  wire clk,        // clock
        input  wire rst,        // reset
        input  wire [3:0] address,
        output wire [7:0] data
    );
 
	reg [1:0]  state;
	reg [1:0]  next_state;
	reg [7:0]  out_buffer;
	reg [7:0] sram_buffer2;
	
	/* Memory params */
	reg we, oe, cs;
	wire [7:0]  rom_buffer;  // used for rom instance
	wire [7:0]  sram_buffer; // used for sram instance
	
 
	localparam TRUE = 1'b1,
				  FALSE = 1'b0,
				  STATE_IDLE = 2'd0,
				  STATE_SRAM_READ_INIT = 2'b01,
				  STATE_SRAM_READ = 2'b10;
 
	// TODO: Implement transition from state to next state
	always @(clk) begin
		if (rst) begin
			state <= STATE_IDLE; // TODO
			next_state <= STATE_IDLE; // TODO
		
		end else begin
			state <= next_state; // TODO
		end
	end
 
	// TODO: Implement the process of reading/writing data
	//                 how to change the state
	// Hint: Pay attention to the list of signals which trigger the block.
	//       When do we want it to run?
	always @(*) begin
		case (state)
			STATE_IDLE: begin
				we = 0;//TODO: TRUE or FALSE?; 
				cs = 0;//TODO: TRUE or FALSE?;
				oe = 0;//TODO: TRUE or FALSE?;
				if (address !== 4'dz) begin
					next_state = STATE_SRAM_READ_INIT;//TODO: set next state (check FSM diagram)
				end else begin
					next_state = STATE_IDLE;//TODO: keep the current state
			end
			end
			STATE_SRAM_READ_INIT: begin
				next_state = STATE_SRAM_READ;
				we = 0;//TODO: TRUE or FALSE?; 
				cs = 1;//TODO: TRUE or FALSE?;
				oe = 1;//TODO: TRUE or FALSE?;
			end
			STATE_SRAM_READ: begin
				if (sram_buffer !== 8'dx) begin  // if data is in SRAM
					out_buffer = sram_buffer; //TODO;
					next_state = STATE_IDLE;//TODO;
				end else begin
					out_buffer = rom_buffer; 
					//sram_buffer2 = out_buffer;// if data is NOT SRAM, take it from ROM
					// set flags to write data in SRAM
					we = 1;//TODO: TRUE or FALSE?; 
					oe = 0;//TODO: TRUE or FALSE?; 
					next_state = STATE_IDLE;//TODO;
				end
			end
		endcase
	end

	// Assign a value to data bus
	assign data = out_buffer;
	//assign sram_buffer = ((state == STATE_SRAM_READ) & we) ? out_buffer : 8'dz;\
	assign sram_buffer = (we) ? out_buffer : 8'dz;
	
	// TODO: Create an instance for each memory module
	// Hint: Pay attention to the address width
	 task01 rom (address, rom_buffer);
	 task03 sram (clk, oe, cs, we, {4'b0, address}, sram_buffer);

endmodule