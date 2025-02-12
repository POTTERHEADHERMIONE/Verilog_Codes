module simulate;
reg [3:0]A,B;
wire [3:0]Sum,Carry;
half_adder HA(Sum,Carry,A,B);

initial
begin
    #10 A = 0000;B=0000;
    #10 A = 0001;B=0001;
    #10 A = 0010;B=0100;
    #10 A = 1100;B=0100;
end

initial
begin
    $monitor("A:%b | B:%b | Sum:%d | Carry:%d",A,B,Sum,Carry);
 end
endmodule