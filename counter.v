module counter(
    input clk,enb,rst,
    output reg q
);

always@(negedge clk)begin
    if(rst)begin
        q<=1'b0;
    end
    else if(enb)begin
        q <=~q;
    end
end
endmodule


`timescale 1ps/1ps
module tb;

reg clk,enb,rst;
wire q;

counter dut(
    clk,enb,rst,q
);
initial begin
    {clk,enb,rst}=0;
end
always #5 clk = ~clk;
initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0,tb);
    rst =1;
    #10
    rst =0;

    enb =1;
    #100;
    enb=0;
   
    $finish;
end

endmodule