module counter#(
    parameter MOD = 5 
)(
    input clk,load,rst,up,down,
    input [3:0] din,
    output reg [3:0]count
);

always@(negedge clk)begin
    if(rst)begin
        count<=4'b0000;
    end
    else if(load)begin
        if (count == MOD-1)
            count <= 0;
        else
            count <= din;
    end
    else if(up)begin
       if (count == MOD-1)
            count <= 0;
        else
            count <= count + 1'b1;
    end
    else if(down)begin
        if (count == 0)
            count <= MOD-1;
        else
            count <= count - 1'b1;
    end
    else count <= count;
end
endmodule


`timescale 1ps/1ps
module tb;

reg clk,load,rst,up,down;
reg [3:0]din;
wire [3:0]count;

counter dut(
    clk,load,rst,up,down,din,count
    );
initial begin
    {clk,load,rst,din,up,down}=0;
end
always #5 clk = ~clk;
initial begin
    $dumpfile("up_down.vcd");
    $dumpvars(0,tb);
    rst =1;
    #10
    rst =0;

    load =1;
    for(integer i =0;i<=10;i=i+1)begin
        din = i;#10;
    end
    #10;
    load=0;
    
    rst =1;#10;rst=0;
    up =1;
    @(posedge clk);
    #100;
    up =0;

    rst =1;#10;rst=0;
    down =1;
    @(posedge clk);
    #100;
    down = 0;
    #10;


    $finish;
end

endmodule