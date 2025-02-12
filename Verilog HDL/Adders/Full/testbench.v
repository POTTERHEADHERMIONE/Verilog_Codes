module simulate;
reg [3:0]A,B,C;
wire [3:0]Sum,Carry;

full_adder FA(Sum,Carry,A,B,C);

initial
begin
    #10 A = 0000;B=0000;C=0000;
    #10 A = 0001;B=0001;C=0001;
    #10 A = 0010;B=0100;C=0100;
    #10 A = 1100;B=0100;C=0001;
end

initial
begin
    $monitor("A:%b | B:%b | C:%b | Sum:%d | Carry:%d",A,B,C,Sum,Carry);
 end
endmodule