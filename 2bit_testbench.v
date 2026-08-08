module two_bit_testbench;
reg [1:0]a,b;
wire gt,eq,lt;

two_bit_comparator uut(
    .a(a),
    .b(b),
    .gt(gt),
    .eq(eq),
    .lt(lt)
);

initial begin
    $dumpfile("two_bit.vcd");
    $dumpvars(0,two_bit_testbench);
    #10 a = 2'b00; b = 2'b00;
    #10 a = 2'b00; b = 2'b01;
    #10 a = 2'b01; b = 2'b00;
    #10 a = 2'b01; b = 2'b01;
    #10 a = 2'b10; b = 2'b01;
    #10 a = 2'b01; b = 2'b10;
    #10 a = 2'b11; b = 2'b11;
    #10 $finish;
end


endmodule
