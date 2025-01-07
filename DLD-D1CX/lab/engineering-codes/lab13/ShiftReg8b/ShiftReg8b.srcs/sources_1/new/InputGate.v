module Inputgate(
    input SL,
    input Dat,
    input par_in,
    output D
);
assign D = (~SL & Dat) | (SL & par_in);
endmodule