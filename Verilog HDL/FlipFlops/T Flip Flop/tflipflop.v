    module D_Flip_Flop(Q, Qbar, D, clk, clear);
        input D, clk, clear;
        output Q, Qbar;
        wire S,Sbar,R,Rbar,Cbar;

        assign Cbar = ~clear;

        assign Sbar = ~(Rbar & S),
            S = ~(Sbar & Cbar & ~clk),
            R = ~(Rbar & ~clk &S),
            Rbar = ~(R & Cbar & D);

        assign Q = ~(S & Qbar),
                Qbar = ~(Q & R & Cbar);      
    endmodule


    module T_Flip_Flop(Q,clk, clear);
        input clk, clear;
        output Q;
        D_Flip_Flop D1(Q, ,~Q,clk,clear);
    endmodule


