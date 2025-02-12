module sr_flip_flop(Q,Qbar,S,R,clk);
input S,R,clk;
output Q,Qbar;
wire W1,W2;

nand N1(W1,S,clk);
nand N2(W2,clk,R);
nand N3(Q,W1,Qbar);
nand N4(Qbar,W2,Q);
endmodule