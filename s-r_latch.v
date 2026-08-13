
module sr(input enb,rst,s,r,output reg q, q_bar);

always@(enb)begin
    if(enb)begin
        //syncronouse reset logic at start 
        if(rst) begin
            q<=1'b0;
            q<=1'b1; 
        end

        //hold condition
        else if(s==0 && r==0)begin
            q<=q;
            q_bar<=q_bar;
        end

        //s=0 r=1
        else if(s==0 && r==1)begin
            q<=1'b0;
            q_bar<=1'b1;
        end

        //s=1 r=0
         else if(s==1 && r==0)begin
            q<=1'b1;
            q_bar<=1'b0;
        end

        //s=1 r=0
         else if(s==1 && r==1)begin
            q<='bx;
            q_bar<='bx;
        end
    end
end

// always @(*) begin
    
//     case({s,r})
//         2'b00:q <= q;
//         2'b01:q <= 1'b0;
//         2'b10:q <= 1'b1;
//         2'b11:q <= 1'bx;
//     endcase
//     end

endmodule


`timescale 1ps/1ps
module sr_tb;

reg enb,rst;
reg s,r;
wire q,q_bar;


sr uut(enb,rst,s,r,q,q_bar);

initial begin
    $dumpfile("sr.vcd");
    $dumpvars(0,sr_tb);
    {enb,rst,s,r} <= 1'b0;
end
always #5 enb=~enb;
initial begin

    rst =1;
    #10; rst =0;
    s=0;r=0; //hold
    #10;
    s=1;r=0; //set
    #10;
    s=0;r=1; //reset
    #10;
    s=1;r=1; //invalid
end
endmodule