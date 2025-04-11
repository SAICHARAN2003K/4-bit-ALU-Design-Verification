module alu_tb;
  logic [3:0] a, b;
  logic [2:0] op;
  logic [3:0] result;
  logic carry, zero, overflow;

  alu dut (.a(a), .b(b), .op(op), .result(result), .carry(carry), .zero(zero), .overflow(overflow));

  class Stimulus;
    rand logic [3:0] a, b;
    rand logic [2:0] op;
    constraint valid_ops { op < 8; }
  endclass

  covergroup alu_cov;
    coverpoint op;
  endgroup

  alu_cov ac = new();
  Stimulus s;

  initial begin
    s = new();
    repeat (50) begin
      assert(s.randomize());
      a = s.a; b = s.b; op = s.op;
      #5 ac.sample();
    end
    $finish;
  end
endmodule
