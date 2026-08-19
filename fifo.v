`timescale 1ps/1ps
module fifo(
    input clk,
    input rst,
    input w_enb,
    input r_enb,

    input [7:0] data_in,
    output reg [7:0] data_out,
    output full,
    output empty
);

    reg [2:0] wr_ptr;
    reg [2:0] rd_ptr;

    reg [7:0] mem [0:7];

    integer i;

    always @(posedge clk) begin

        if (rst) begin
            wr_ptr   <= 3'b000;
            rd_ptr   <= 3'b000;
            data_out <= 8'b0;

            for (i = 0; i < 8; i = i + 1)
                mem[i] <= 8'b0;
        end

        else begin

            // Write operation
            if (w_enb && !full) begin
                mem[wr_ptr] <= data_in;
                wr_ptr <= wr_ptr + 1'b1;
            end

            // Read operation
            if (r_enb && !empty) begin
                data_out <= mem[rd_ptr];
                rd_ptr <= rd_ptr + 1'b1;
            end

        end
    end


    // FIFO is full when next write pointer reaches read pointer
    assign full = ((wr_ptr + 1'b1) == rd_ptr);

    // FIFO is empty when both pointers are equal
    assign empty = (wr_ptr == rd_ptr);

endmodule

// MOD_A Generates write enable and passes input data

module mod_a(
    input clk,
    input rst,
    input [7:0] data_in,

    output reg [7:0] data_out,
    output reg w_enb
);

    always @(posedge clk) begin

        if (rst) begin
            data_out <= 8'b0;
            w_enb    <= 1'b0;
        end

        else begin
            data_out <= data_in;
            w_enb <= 1'b1;
        end

    end

endmodule




// MOD_B Generates read enable and receives FIFO data
module mod_b(
    input clk,
    input rst,
    input [7:0] data_in,
    input empty,
    output reg [7:0] data_out,
    output reg       r_enb
);

    parameter idle = 2'b00;
    parameter s1 = 2'b01;
    parameter data_state = 2'b10;

    reg [1:0] ps;
    reg [1:0] ns;


    // State register
    always @(posedge clk) begin

        if (rst)
            ps <= idle;

        else
            ps <= ns;

    end


    // Next-state logic
    always @(*) begin

        // Default values
        ns   = idle;
        r_enb = 1'b0;

        case (ps)

            idle: begin
                ns = s1;
                r_enb = 1'b0;
            end


            s1: begin
                ns = data_state;
                r_enb = 1'b0;
            end


            data_state: begin
                ns = idle;

                // Read only if FIFO contains data
                if (!empty)
                    r_enb = 1'b1;
                else
                    r_enb = 1'b0;
            end


            default: begin
                ns = idle;
                r_enb = 1'b0;
            end

        endcase

    end


    // Capture data coming from FIFO
    always @(posedge clk) begin

        if (rst)
            data_out <= 8'b0;

        else if (r_enb)
            data_out <= data_in;

    end

endmodule



// TOP FIFO

module top_fifo(
    input clk,
    input rst,

    input [7:0] data_top,
    output [7:0] data_out_top
);

    // Connections between MOD_A and FIFO
    wire [7:0] data_to_fifo;
    wire       w_enb;


    // Connections between FIFO and MOD_B
    wire [7:0] data_from_fifo;
    wire       r_enb;


    // FIFO status
    wire full;
    wire empty;


    // MOD_A
    mod_a mod1 (

        .clk (clk),
        .rst (rst),

        .data_in  (data_top),

        .data_out (data_to_fifo),
        .w_enb (w_enb)

    );


    // FIFO
    fifo fifo1 (

        .clk      (clk),
        .rst      (rst),

        .w_enb    (w_enb),
        .r_enb    (r_enb),

        .data_in  (data_to_fifo),
        .data_out (data_from_fifo),

        .full     (full),
        .empty    (empty)

    );


    // MOD_B
    mod_b mod2 (

        .clk      (clk),
        .rst      (rst),

        .data_in  (data_from_fifo),
        .empty    (empty),

        .data_out (data_out_top),
        .r_enb    (r_enb)

    );

endmodule



// TESTBENCH
module tb;

    reg        clk;
    reg        rst;

    reg  [7:0] data_top;
    wire [7:0] data_out_top;


    
    top_fifo dut (

        .clk         (clk),
        .rst         (rst),

        .data_top    (data_top),
        .data_out_top(data_out_top)

    );


  
    initial begin
        clk = 1'b0;
    end

    always #5 clk = ~clk;


    
    initial begin

        $dumpfile("fifo.vcd");
        $dumpvars(0, tb);


        // Initial values
        rst      = 1'b1;
        data_top = 8'b0;


        // Reset
        #10;
        rst = 1'b0;


       
        data_top = 8'd44;

        #50;


        
        data_top = 8'd55;

        #50;


        
        data_top = 8'd66;

        #100;


        $finish;

    end

    initial begin

        $monitor(
            "TIME=%0t | rst=%b | data_in=%d | data_out=%d",
            $time,
            rst,
            data_top,
            data_out_top
        );

    end

endmodule