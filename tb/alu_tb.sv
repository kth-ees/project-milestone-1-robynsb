module alu_tb;

  parameter BW = 16; // bitwidth

  logic signed [BW-1:0] in_a;
  logic signed [BW-1:0] in_b;
  logic             [3:0] opcode;
  logic signed [BW-1:0] out;
  logic             [2:0] flags; // {overflow, negative, zero}

  // Instantiate the ALU
  alu #(BW) dut (
    .in_a(in_a),
    .in_b(in_b),
    .opcode(opcode),
    .out(out),
    .flags(flags)
  );


  initial begin
		$monitor("A=%d B=%d opcode=%d out=%d flags[0,1,2] = %d (zero), %d (negative), %d (overflow)", in_a, in_b, opcode, out, flags[0], flags[1], flags[2]);
    in_a = '0;
    in_b = '0;
    opcode = '0;
    #10ns;
		in_a = 10;
    #5ns;
		in_b = 5;
    #10ns;
    opcode = 1;
    #10ns;
		in_a = -3;
		in_b = -7;
    opcode = 0;
    #10ns;
		in_a = 32000;
		in_b = 10000;
    opcode = 0;
    #10ns;
		in_a = -32000;
		in_b = -10000;
    opcode = 0;
    #10ns;
		in_a = -31000;
		in_b = 9001;
    opcode = 1;
    #10ns;
		in_a = 100;
		in_b = 100;
    opcode = 1;
    #10ns;
		in_a = 0;
		in_b = 0;
    opcode = 2;
    #10ns;
		in_a = 1;
		in_b = 0;
    opcode = 2;
    #10ns;
		in_a = 1;
		in_b = 1;
    opcode = 2;
    #10ns;
		in_a = 0;
		in_b = 0;
    opcode = 3;
    #10ns;
		in_a = 10;
		in_b = 0;
    opcode = 3;
    #10ns;
		in_a = 0;
		in_b = 0;
    opcode = 4;
    #10ns;
		in_a = 0;
		in_b = 100;
    opcode = 4;
    #10ns;
		in_a = 150;
		in_b = 100;
    opcode = 4;
    #10ns;
		in_a = 41;
    opcode = 5;
    #10ns;
		in_a = 16'b0111111111111111;
    opcode = 5;
    #10ns;
		in_a = 23;
    opcode = 6;
    #10ns;
		in_b = 11;
    opcode = 7;
  end
endmodule
