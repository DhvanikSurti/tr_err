module asyncronous(
    input clk,rst,
    input din,
    output reg [3:0]q
);

always@(negedge clk)begin
    if(rst)begin
        q[0] <= 1'b0;
    end
    else begin
        q[0] <= ~q[0];
    end
end
always@(negedge q[0])begin
    if(rst)begin
         q[1] <= 1'b0;
    end
    else begin
        q[1] <= ~q[1];
    end
end
always@(negedge q[1])begin
    if(rst)begin
        q[2] <= 1'b0;
    end
    else begin
        q[2] <= ~q[2];
    end
end
always@(negedge q[2])begin
    if(rst)begin
        q[3] <= 1'b0;
    end
    else begin
        q[3] <= ~q[3];
    end
end
endmodule

`timescale 1ps/1ps
module tb;

reg clk,rst;
reg  din;
wire [3:0]q;

asyncronous dut(
    clk,rst,din,q
);
initial begin
    {clk,rst,din} = 0;
end

always #5 clk = ~clk;

initial begin
    $dumpfile("asyncronous.vcd");
    $dumpvars(0,tb);
    rst = 1;
    #10;
    rst = 0;
    #100;

    
 
    $finish;

end
endmodule

