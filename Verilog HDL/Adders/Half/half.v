module half_adder(Sum,Carry,A,B);
input[3:0]A,B;
output [3:0]Sum,Carry;
assign Sum = A^B;
assign Carry = A&B;
endmodule