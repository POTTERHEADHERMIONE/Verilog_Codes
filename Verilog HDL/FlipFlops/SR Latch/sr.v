module sr_latch(Q,Qbar,S,R);
input S,R;
output Q,Qbar;
nand N1(Q,S,Qbar);
nand N2(Qbar,R,Q);
endmodule