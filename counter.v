module counter(
    input clk,load,rst,
    input [3:0] din,
    output reg [3:0]count
);

always@(negedge clk)begin
    if(rst)begin
        count<=4'b0000;
    end
    else if(load)begin
        count<=din;
    end
    else count <= count+1'b1;
end
endmodule


`timescale 1ps/1ps
module tb;

reg clk,load,rst;
reg [3:0]din;
wire [3:0]count;

counter dut(
    clk,load,rst,din,count
    );
initial begin
    {clk,load,rst,din}=0;
end
always #5 clk = ~clk;
initial begin
    $dumpfile("counter.vcd");
    $dumpvars(0,tb);
    #10;
    rst =1;
    #10
    rst =0;

    load =1;
    for(integer i =0;i<=10;i=i+1)begin
        din = i;#10;
    end
    #100;
    load=0;
   
    $finish;
end

endmodule