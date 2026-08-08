module mux_tb;

reg [1:0] s;
reg [3:0] i;
wire y;

mux uut(
    .s(s),
    .i(i),
    .y(y)
);

initial begin

    $dumpfile("mux.vcd");
    $dumpvars(0,mux_tb);

    i = 4'b1010;
    $monitor("Time=%0t  s=%b  i=%b  y=%b", $time, s, i, y);
    #10 s = 2'b00 ;
    #10 s = 2'b01 ;
    #10 s = 2'b10 ;
    #10 s = 2'b11 ;
    #10 s = 2'b10 ;
    #10 s = 2'b01 ;

end
endmodule