module rom #(
        parameter   DATA_WIDTH = 16,
        parameter   ADDR_WIDTH = 8          // 2 * 1024 bytes of ROM
    )(
        input  wire                  clk,
        input  wire [ADDR_WIDTH-1:0] addr,  // here comes the program counter
        output  reg [DATA_WIDTH-1:0] data   // here goes the instruction
    );

    reg [DATA_WIDTH-1:0] value;

    
    always @* begin
        case (addr)
			 /*	 rjmp 	main 		*/
		0:		value = 16'b1100000000000010;
		/*	 ldi 	r20, 42 		*/
		1:		value = 16'b1110001001001010;
		/*	 ret 	 		*/
		2:		value = 16'b1001010100001000;
		/*	 ldi 	r20, 7 		*/
		3:		value = 16'b1110000001000111;
		/*	 rcall 	foo 		*/
		4:		value = 16'b1101111111111100;
		default:		value = 16'b0000000000000000;
        endcase
    end

    always @(negedge clk) begin
        data <= value;
    end

endmodule
