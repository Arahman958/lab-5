module schematic1(
    input W,
    input X,
    input Y,
    input Z,
    input sw6,
    input sw7,
    input sw4,
    
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

wire [15:0] dec;
wire X169, X171, X177, X178, X179, X191, X192, X195;
wire X249, X250, X253, X254, X255, X256, X260, X265, X266, X272;
wire X299, X300, X302, X303, X310, X311, X317, X318, X319;

mux #(16,1) U33 (
    .data_out(CA),
    .select_in({W,X,Y,Z}),
    .data_in({
        1'b0,1'b0,1'b1,1'b0,
        1'b1,1'b0,1'b0,1'b0,
        1'b0,1'b0,1'b0,1'b1,
        1'b0,1'b0,1'b1,1'b0
    })
);

mux #(16,1) U81 (
    .data_out(CB),
    .select_in({W,X,Y,Z}),
    .data_in({
        1'b1,1'b1,1'b0,1'b1,
        1'b1,1'b0,1'b0,1'b0,
        1'b0,1'b1,1'b1,1'b0,
        1'b0,1'b0,1'b0,1'b0
    })
);

decoder #(4,1) U133 (
    .data_out(dec),
    .address_in({W,X,Y,Z}),
    .en_in(1'b1)
);

or U152 (CC, dec[2], dec[12], dec[14], dec[15]);

or U160 (CD, dec[1], dec[4], dec[7], dec[10], dec[15]);

not U169 (X169, W);
and U171 (X171, Z, X169);

not U177 (X177, W);
not U178 (X178, Y);
and U179 (X179, X177, X, X178);

or U185 (CE, X171, X179, X195);

not U191 (X191, X);
not U192 (X192, Y);
and U195 (X195, X191, X192, Z);

not U249 (X249, W);
not U250 (X250, X);
and U253 (X253, X249, X250, Z);

and U254 (X254, X260, Y, Z);
and U255 (X255, X265, X266, Y);
and U256 (X256, W, X, X272, Z);

not U260 (X260, W);
not U265 (X265, W);
not U266 (X266, X);
not U272 (X272, Y);

or U278 (CF, X253, X254, X255, X256);

not U299 (X299, W);
not U300 (X300, X);
not U302 (X302, Y);
and U303 (X303, X299, X300, X302);

not U310 (X310, W);
and U311 (X311, X, X310, Y, Z);

and U317 (X317, W, X, X318, X319);

not U318 (X318, Y);
not U319 (X319, Z);

or U326 (CG, X303, X311, X317);


wire n_sw7, n_sw6;

assign DP = sw4;

not inv1(n_sw7, sw7);
not inv2(n_sw6, sw6);

or cat(AN0, sw7, sw6);
or cat1(AN1, sw7, n_sw6);
or cat2(AN2, n_sw7, sw6);
or cat3(AN3, n_sw7, n_sw6);

endmodule
