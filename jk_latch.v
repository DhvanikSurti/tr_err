module jk_latch(
    input enb,rst,j,k,
    output reg q,q_bar
);

always @(enb)begin
    if(enb)begin
        //reset logic 
        if(rst)begin
            q <= 0;
            q_bar <= 0;
         end

         //set 
         else if(j == 0 && k == 0)begin
            q <= q;
            q_bar <= q_bar;
         end

         else if(j == 0 && k == 1)begin
            q <= 0;
            q_bar <=1;
         end

         else if(j == 1 && k == 0)begin
            q <= 1;
            q_bar <= 0;
         end

         else if(j ==1 && k == 1)begin
            q <= ~q;
            q_bar <= ~q_bar;
         end
    end
end
endmodule


`timescale 1ps/1ps

module tb;

reg enb,rst,j,k;
wire q,q_bar;

jk_latch uut(enb,rst,j,k,q,q_bar);

initial begin
    {enb,rst,j,k} = 0;
end

always #5 enb = ~enb;
initial begin
    $dumpfile("jk_latch.vcd");
    $dumpvars(0,tb);
    rst = 1;
    #10;
    rst = 0;
    #10;
    //j=0;k=0; 
    #10;
    j=0;k=1; #10;
    j=1;k=0; #10;
    j=1;k=1; #10;
    rst = 1;
    #10;
    rst =0;
    $finish;
end
endmodule