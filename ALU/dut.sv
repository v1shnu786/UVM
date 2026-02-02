module dut(
  input  [7:0] a, b,
  input  [1:0] s,
  output reg [8:0] c
);

  always @(*) begin
    case (s)
      2'd0: c = a + b;
      2'd1: c = a - b;
      2'd2: c = a & b;
      2'd3: c = a | b;
      default: c = 9'd0;
    endcase
  end

endmodule


