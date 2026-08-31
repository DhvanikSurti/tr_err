module ram(
    input we, clk,
    input [7:0]data, 
    input [2:0]addr,
    output reg [7:0] q

);
reg [7:0] ram [7:0];
always @ (posedge clk)begin
    if(we)begin
        ram[addr] <= data;
    end
    else
        q <= ram[addr];
end
endmodule

`timescale 1ps/1ps
module tb;
reg we,clk;
reg [7:0]data;
reg [2:0]addr;
wire [7:0]q;

ram ram_dut(we,clk,data,addr,q);
initial begin
    {we,clk,data,addr} <= 0;
end
always #5 clk<= ~clk;
initial begin
    $dumpfile("singleport_ram.vcd");
    $dumpvars(0,tb);
    clk = 1;
    #10;
    data = 8'b10101010;
    #10;
    we =1;
    addr = 3'b101;
    #20;
    we = 0;
    #20;
    $finish;


end
endmodule