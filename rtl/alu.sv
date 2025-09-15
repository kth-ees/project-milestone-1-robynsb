module alu #(
  BW = 16 // bitwidth
  ) (
  input  logic unsigned [BW-1:0] in_a,
  input  logic unsigned [BW-1:0] in_b,
  input  logic             [3:0] opcode,
  output logic unsigned [BW-1:0] out,
  output logic             [2:0] flags // {overflow, negative, zero}
  );
	
	
	always_comb begin
		out = '0;
		flags[2] = 1'b0;
		case (opcode)
			3'd0: begin
							out = in_a + in_b;
							flags[2] = (in_a[BW-1] && in_b[BW-1] && !out[BW-1]) ||
												 (!in_a[BW-1] && !in_b[BW-1] && out[BW-1]);
						end
			3'd1: begin
							out = in_a - in_b;
							flags[2] = (!in_a[BW-1] && in_b[BW-1] && out[BW-1]) ||
												 (in_a[BW-1] && !in_b[BW-1] && !out[BW-1]);
						end
			3'd2: out = in_a && in_b;
			3'd3: out = in_a || in_b; 
			3'd4: out = |in_a ^ |in_b;
			3'd5: begin 
							out = in_a + 1;
							flags[2] = (!in_a[BW-1] && out[BW-1]);
						end
			3'd6: out = in_a;
			3'd7: out = in_b;
			default: out = '0;
		endcase
	end

	assign flags[1] = out[BW-1];
	assign flags[0] = ~|out;


endmodule




