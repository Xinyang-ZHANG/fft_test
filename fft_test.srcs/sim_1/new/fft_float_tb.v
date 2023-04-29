`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/21 14:54:51
// Design Name: 
// Module Name: fft_float_tb
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module fft_float_tb();

reg           clk;
reg           rst_n;

always#2.5 clk = ~clk;

initial
begin
    clk = 0;
end

    wire[15:0]  dds5_m_data_tdata, dds10_m_data_tdata;
    wire        dds5_m_data_tvalid, dds10_m_data_tvalid;

    dds_compiler_0 dds_10MHz (
        .aclk(clk),
        .m_axis_data_tdata(dds10_m_data_tdata),
     //   .m_axis_data_tready(fft_s_data_tready),
        .m_axis_data_tvalid(dds10_m_data_tvalid)
    );
    
    dds_compiler_1 dds_5MHz (
        .aclk(clk),
        .m_axis_data_tdata(dds5_m_data_tdata),
     //   .m_axis_data_tready(fft_s_data_tready),
        .m_axis_data_tvalid(dds5_m_data_tvalid)
    );
        
    wire[31:0]  P;
    mult_gen    mult_gen_inst(
        .CLK(clk),
        .A(dds5_m_data_tdata),
        .B(dds10_m_data_tdata),
        .P(P)
    );
    
    wire    [31:0]  fft_fix_data;
    wire            fft_fix_val;
    xfft_1 fft_fix (
        .aclk(clk),                                                // input wire aresetn
        .s_axis_config_tdata(8'b1),                  // input wire [15 : 0] s_axis_config_tdata
        .s_axis_config_tvalid(1),                // input wire s_axis_config_tvalid
        .s_axis_config_tready(),                // output wire s_axis_config_tready
        .s_axis_data_tdata({16'h0,dds10_m_data_tdata}),                      // input wire [63 : 0] s_axis_data_tdata
        .s_axis_data_tvalid(dds10_m_data_tvalid),                    // input wire s_sinf_val
        .s_axis_data_tready(),                    // output wire s_axis_data_tready
        .s_axis_data_tlast(),                      // input wire s_axis_data_tlast
        .m_axis_status_tdata(),
        .m_axis_status_tvalid(),
        .m_axis_data_tdata(fft_fix_data),                      // output wire [63 : 0] m_axis_data_tdata
        .m_axis_data_tvalid(fft_fix_val),                    // output wire m_axis_data_tvalid
        .m_axis_data_tuser(),                    // input wire m_axis_data_tready
        .m_axis_data_tlast(),                      // output wire m_axis_data_tlast
        .event_frame_started(),                  // output wire event_frame_started
        .event_tlast_unexpected(),            // output wire event_tlast_unexpected
        .event_tlast_missing(),                  // output wire event_tlast_missing
        .event_data_in_channel_halt()    // output wire event_data_in_channel_halt
); 

endmodule
