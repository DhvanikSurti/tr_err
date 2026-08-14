module t_latch(
    input enb,rst,t,
    output reg q,q_bar
);

    always @(enb) begin
        if(enb)begin
            //reset login 
            if(rst) begin
                q <= 1'b0;
                q_bar <= 1'b1;
            end
            //hold condition 
            else if(t == 1'b0) begin
                q<=q;
                q_bar<=q_bar;
             end

             //toggle condition 
             else if(t == 1'b1)begin
                q<=~q;
                q_bar<=~q_bar;
             end
        end

    end

endmodule


`timescale 1ps/1ps
module t_latch_tb;

reg enb,rst,t;
wire q,q_bar;
t_latch uut(
     enb,rst,t,q,q_bar
);

initial begin
    {enb,rst} =0;
    t = 1;
end
always #5 enb = ~enb;

initial begin
    $dumpfile("t_latch.vcd");
    $dumpvars(0,t_latch_tb);
    
    rst = 1;
    #10;
    rst = 0;
    t = 0;
    #10;
    t = 1;
    #10;
    rst =1;
    #10;

    $finish;
end
endmodule