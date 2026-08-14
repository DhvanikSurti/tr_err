module siso(
    input enb,clk,rst,
    input [3:0]p_in, 
    output reg [3:0]p_out
);
reg [3:0] temp;

always @(posedge clk) begin
    if (rst) begin
        p_out <= 4'b0000;
    end
    else begin
        p_out <= p_in;
    end
end

endmodule


`timescale 1ps/1ps
module tb;

reg enb,clk,rst;
reg [3:0]p_in;
wire [3:0]p_out;

siso dut(
    enb,clk,rst,p_in,p_out
);

initial begin
    {enb,clk,rst,p_in} = 0;
end

always #5 clk = ~clk;
initial begin
    $dumpfile("pipo.vcd");
    $dumpvars(0,tb);
    rst =1;
    #10;
    rst =0;
    enb = 1; 
    p_in = 1;
    #10;
    p_in= 0;
    #10;
    p_in =0 ; #10;
    p_in =1; #10;
     enb =0;
    #60;
   
    $finish;

end
endmodule