`default_nettype none

module tt_um_dev_dlatch (
    input  wire [7:0] ui_in,    // unused
    output wire [7:0] uo_out,   // Q on bit 0
    input  wire [7:0] uio_in,   // unused
    output wire [7:0] uio_out,  // unused
    output wire [7:0] uio_oe,   // unused
    input  wire clk,            // unused
    input  wire rst_n,          // async active-low reset
    input  wire ena             // unused (TinyTapeout enable)
);

    // --- Inputs ---
    wire D  = ui_in[0];   // External D input on ui_in[0]
    wire EN = ui_in[1];   // Latch enable on ui_in[1]

    // --- Internal latch storage ---
    reg Q;

    // --- D Latch Behavior ---
    // Transparent when EN = 1
    // Holds value when EN = 0
    always @(*) begin
        if (!rst_n)
            Q = 1'b0;
        else if (EN)
            Q = D;
        // else: keep Q (latch behavior)
    end

    // --- Outputs ---
    assign uo_out = {7'b0, Q};
    assign uio_out = 8'b0;
    assign uio_oe  = 8'b0;

endmodule

`default_nettype wire
