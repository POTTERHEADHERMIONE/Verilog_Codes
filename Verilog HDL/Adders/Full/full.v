module half_adder(Sum,Carry,A,B);
input[3:0]A,B;
output [3:0]Sum,Carry;
assign Sum = A^B;
assign Carry = A&B;
endmodule

module full_adder(Sum,Carry,A,B,C);
input[3:0]A, B, C;
output [3:0]Sum,Carry;
wire [3:0]Hsum,Hcarry;

half_adder H1(Hsum,Hcarry,A,B);
half_adder H2(Sum,Carry,Hsum,C);

endmodule