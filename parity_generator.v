module parity(input a,b,c,d, output reg [4:0]q_even, output reg [4:0]q_odd);
reg q1;
//even parity generator  
always @({a,b,c,d})begin
    q1 = a ^ b ^ c ^ d;
    q_even = {q1,a,b,c,d};
    q_odd = {~q1,a,b,c,d};
end

//odd 
endmodule

module tb;

reg a,b,c,d;
wire [4:0]q_even;
wire [4:0]q_odd;

parity dut(a,b,c,d,q_even,q_odd);
initial begin 
    {a,b,c,d}=0;
    #10;
    a=1;b=0;c=0;d=0;
    #10;
    $display("value is %0b",{a,b,c,d});
    $display("even parity is %0b",q_even[4]);
    $display("even parity output is %0b",q_even);

    $display("value is %0b",{a,b,c,d});
    $display("odd parity is %0b",q_odd[4]);
    $display("odd parity output is %0b",q_odd);
    
    $finish;
end
endmodule