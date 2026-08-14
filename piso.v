module siso(
    input clk,rst,enb,
    input [3:0]p_in, 
    output reg s_out
);
reg [3:0] temp;

always @(posedge clk)begin
    if(rst)begin
        s_out <= 0;
        temp <= 4'b0000;
    end

    else if(enb == 1)begin
        temp <= p_in;
    end
     else if(enb ==0)begin
        s_out <= temp[0];
        temp <= temp >> 1'b1;
     end

end

endmodule


`timescale 1ps/1ps
module tb;

reg clk,rst,enb;
reg [3:0]p_in;
wire s_out;

siso dut(
    clk,rst,enb,p_in,s_out
);

initial begin
    {clk,rst,enb,p_in} = 0;
end

always #5 clk = ~clk;
initial begin
    $dumpfile("piso.vcd");
    $dumpvars(0,tb);
    rst =1;
    #10;
    rst =0;
    enb=1;
    p_in = 4'b1001;
    #10;
    enb = 0;
    #60;
    $finish;

end
endmodule