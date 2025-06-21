module mini_core(input clk, input rst);

  reg [7:0] regfile [0:3];     // 4 registers: R0-R3
  reg [7:0] memory [0:15];     // Simple RAM

  reg [1:0] alu_op;            // 00: add, 01: sub, 10: and, 11: or
  reg [1:0] src1, src2, dest;

  reg [7:0] result;

  always @(*) begin
	case (alu_op)
	  2'b00: result = regfile[src1] + regfile[src2];
      2'b01: result = regfile[src1] - regfile[src2];
      2'b10: result = regfile[src1] & regfile[src2];
      2'b11: result = regfile[src1] | regfile[src2];
    endcase
  end
  
    //state logic: reset and execute
  always @(posedge clk or posedge rst) begin
    if (rst) begin
      regfile[0] <= 8'd5;
      regfile[1] <= 8'd3;
      regfile[2] <= 0;
      regfile[3] <= 0;
      memory[0]  <= 0;

      alu_op <= 2'b00;    // ADD
      src1   <= 2'b00;    // R0
      src2   <= 2'b01;    // R1
      dest   <= 2'b10;    // R2
    end else begin
      regfile[dest] <= result;            // Write ALU output
      memory[0] <= regfile[dest];         // Store to memory as example
    end
  end
endmodule
