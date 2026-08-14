module usr(
    input clk,enb,rst,s_in,
    input [3:0]p_in,
    input [1:0]mode,
    output reg s_out,
    output reg [3:0]p_out 
);
reg [3:0]temp;
always@(posedge clk)begin
    if(rst)begin
        temp <= 4'b0000;
        s_out<=1'b0;
        p_out<=4'b0000;
    end
    else begin
        case(mode)
            2'b00: begin //siso operation 
                temp <= {s_in,temp[3:1]};
                s_out <= temp[0];
            end

            2'b01: begin //sipo operation
                p_out <= {s_in, temp[3:1]};
                temp  <= {s_in, temp[3:1]};
            end

            2'b10:begin //piso operation
                 if(enb == 1)begin
                     temp <= p_in;
                 end
                 else if(enb ==0)begin
                     s_out <= temp[0];
                     temp <= temp >> 1'b1;
                 end
            end

            2'b11:begin //pipo operation
                p_out <= p_in;

            end

            default: begin
                p_out<=4'b0000;
                temp <=4'b0000;
                s_out <= 1'b0;
                $monitor("defualt statement has ran ");
            end
        endcase
    end
end

endmodule


`timescale 1ps/1ps
module tb;

reg clk,enb,rst,s_in;
reg [3:0]p_in;
reg [1:0]mode;
wire s_out;
wire [3:0]p_out;

usr dut(clk,enb,rst,s_in,p_in,mode,s_out,p_out);
initial begin
    {clk,enb,rst,s_in,p_in,mode} =0;
end
always #5 clk = ~clk;

initial begin
    $dumpfile("usr.vcd");
    $dumpvars(0,tb);
    rst =1;
    #10;
    rst =0;
   
    #10;
    mode = 2'b00; //siso
    s_in = 1; #10;
    s_in = 0; #10;
    s_in = 0; #10;
    s_in = 1; #10;
    #40;
     enb = 1;

     rst = 1;#10;rst=0;

    mode = 2'b01; //sipo
    s_in = 1; #10;
    s_in = 0; #10;
    s_in = 0; #10;
    s_in = 1; #10;
     enb = 0;
    #40;

    rst = 1;#10;rst=0;

    mode = 2'b10; //piso
    enb=1;
    p_in = 4'b1001;#10;
    enb=0;
    #40;

    rst = 1;#10;rst=0;
    mode = 2'b11; //pipo 
    p_in = 4'b1001;#10;
    #10;
    #200;
    $finish;


end
endmodule