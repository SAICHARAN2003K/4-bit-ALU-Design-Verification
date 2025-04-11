module alu (
  input  logic [3:0] a, b,
  input  logic [2:0] op,
  output logic [3:0] result,
  output logic carry, zero, overflow
);
  always_comb begin
    carry = 0; overflow = 0;
    case (op)
      3'b000: {carry, result} = a + b;        // ADD
      3'b001: {carry, result} = a - b;        // SUB
      3'b010: result = a & b;
      3'b011: result = a | b;
      3'b100: result = a ^ b;
      3'b101: result = ~a;
      3'b110: result = a + 1;
      3'b111: result = a - 1;
      default: result = 4'b0000;
    endcase
    zero = (result == 4'b0000);
  end
endmodule
