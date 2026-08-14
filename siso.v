module siso(
    input clk,rst,s_in, 
    output reg s_out
);
reg [3:0] temp;

always @(posedge clk)begin
    if(rst)begin
        s_out <= 0;
        temp <= 4'b0000;
    end

    else begin
        temp <= {s_in,temp[3:1]};
        s_out <= temp[0];
        temp[3] <= s_in;
        
    end

end

endmodule


`timescale 1ps/1ps
module tb;

reg clk,rst,s_in;
wire s_out;

siso dut(
    clk,rst,s_in,s_out
);

initial begin
    {clk,rst,s_in} = 0;
end

always #5 clk = ~clk;
initial begin
    $dumpfile("siso.vcd");
    $dumpvars(0,tb);
    rst =1;
    #10;
    rst =0;
    #5;
    s_in = 1;
    #10;
    s_in= 0;
    #10;
    s_in =0 ; #10;
    s_in =1; #10;
    
    #60;
    $finish;

end
endmodule