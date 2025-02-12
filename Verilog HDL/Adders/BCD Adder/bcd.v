// Full Adder Module
module adder(input A, B, Cin, output S, Cout);
  wire S1, S2, S3;
  
  xor (S1, A, B);
  and (S2, A, B);
  xor (S, S1, Cin);
  and (S3, S1, Cin);
  or (Cout, S3, S2);
endmodule

// 4-bit Binary Adder Module
module four_bit_adder(input [3:0] A, B, input Cin, output [3:0] S, output Cout);
  wire C1, C2, C3; 
  
  adder FA0(A[0], B[0], Cin,  S[0], C1);
  adder FA1(A[1], B[1], C1,   S[1], C2);
  adder FA2(A[2], B[2], C2,   S[2], C3);
  adder FA3(A[3], B[3], C3,   S[3], Cout); 
endmodule

// BCD Adder Module
module bcd_adder(input [3:0] A, B, input Cin, output [3:0] S, output Cout);
  wire [3:0] sum, correction;
  wire carry1, carry2, need_correction;
  
  // First 4-bit addition
  four_bit_adder fa1(A, B, Cin, sum, carry1);
  
  // Check if correction is needed (carry1 OR sum > 9)
  assign need_correction = carry1 | (sum[3] & (sum[2] | sum[1]));

  // If correction is needed, add 6 (0110), otherwise add 0 (0000)
  four_bit_adder fa2(sum, {1'b0, need_correction, need_correction, 1'b0}, 1'b0, S, carry2);
  
  // Final carry
  or (Cout, carry1, carry2);
endmodule
