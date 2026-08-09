module op;

    reg [3:0] a;
    reg [3:0] b;

    reg gt;
    reg lt;
    reg gteq;
    reg lteq;

initial begin
    a = 4'b0011;
    b = 4'b0010;
    
    gt = a > b;
    lt = a < b;
    gteq = a >= b;
    lteq = a <= b;
    $monitor ("the value is %b",gt);
end


endmodule 
