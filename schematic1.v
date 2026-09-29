module schematic1(
	input A,
	input B,
	input C,
	input D,
	input E,
	input F,
	input G,
	input H,
	output CA,
	output CB,
	output CC,
	output CD,
	output CE,
	output CF,
	output CG,
	output DP,
	output AN0,
	output AN1,
	output AN2,
	output AN3


);

    assign CA = 1'b1;
    assign CB = 1'b0;
    assign CC = 1'b1;
    assign CD = 1'b0;
    assign CE = 1'b1;

    assign CF = A;
    assign CG = B;
    assign DP = C;

    assign AN0 = D;
    assign AN1 = E;
    assign AN2 = F;
    assign AN3 = G;


endmodule
