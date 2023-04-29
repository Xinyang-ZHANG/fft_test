`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/12 14:05:39
// Design Name: 
// Module Name: fft
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
module fft(
    input aclk,
    input aresetn,
    output [15:0] fft_real,
    output [15:0] fft_imag,
    output [31:0] data,
    output [15:0] dds10_m_data_tdata
    );
    
    wire dds_m_data_tvalid;
    
    wire[63:0]   sinf;
    wire         sinf_val;

    wire[15:0]  dds5_m_data_tdata;
    wire        dds5_m_data_tvalid;

    dds_compiler_0 dds_10MHz (
        .aclk(aclk),
        .m_axis_data_tdata(dds10_m_data_tdata),
     //   .m_axis_data_tready(fft_s_data_tready),
        .m_axis_data_tvalid(dds_m_data_tvalid)
    );
    
    dds_compiler_1 dds_5MHz (
            .aclk(aclk),
            .m_axis_data_tdata(dds5_m_data_tdata),
         //   .m_axis_data_tready(fft_s_data_tready),
            .m_axis_data_tvalid(dds5_m_data_tvalid)
        );
        
    wire[31:0]  P;
    mult_gen    mult_gen_inst(
        .CLK(aclk),
        .A(dds5_m_data_tdata),
        .B(dds10_m_data_tdata),
        .P(P)
        );
    
    fix2float   fix2float_sin(
        .aclk(aclk),
        .s_axis_a_tdata(P),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(dds_m_data_tvalid),
        .m_axis_result_tdata(sinf[31:0]),
        .m_axis_result_tvalid(sinf_val)
    );
    fix2float   fix2float_cos(
        .aclk(aclk),
        .s_axis_a_tdata(32'd0),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(dds_m_data_tvalid),
        .m_axis_result_tdata(sinf[63:32]),
        .m_axis_result_tvalid()
    );

    //----------------------FFT core-------------------
    wire [7:0] fft_s_config_tdata;//[0:0]FWD_INV_0
    wire fft_s_config_tready;
    wire fft_s_config_tvalid;

    wire [7:0] fft_m_status_tdata;
    wire fft_m_status_tvalid;

    wire [31:0] fft_m_data_tdata;
    wire fft_m_data_tlast;
 
    wire [23:0] fft_m_data_tuser;//[11:0]XK_INDEX
    wire fft_m_data_tvalid;

    wire fft_event_frame_started;
    wire fft_event_tlast_unexpected;
    wire fft_event_tlast_missing;
    wire fft_event_data_in_channel_halt;

    assign fft_s_config_tdata = 8'd1;//定义FFT模块配置信息(第0位为1表示用FFT，为0表示用IFFT)
    assign fft_s_config_tvalid = 1'd1;//FFT模块配置使能，从一开始就拉高，表示已经准备好要传入的配置数据了
    xfft_0 usr_fft(
        .aclk(aclk),//Rising-edge clock
        .aresetn(aresetn),//(低有效)Active-Low synchronous clear (optional, always take priority over aclken); A minimum aresetn active pulse of two cycles is required
        //S_AXIS_DATA
        .s_axis_data_tdata({16'd0, dds10_m_data_tdata}),//IN Carries the unprocessed sample data: XN_RE and XN_IM{16'd0, dds10_m_data_tdata}
        .s_axis_data_tlast(),//IN Asserted by the external master on the last sample of the frame
       // .s_axis_data_tready(fft_s_data_tready),//OUT Used by the core to signal that it is ready to accept data
        .s_axis_data_tvalid(dds_m_data_tvalid),//IN Used by the external master to signal that it is able to provide data
        //S_AXIS_CONFIG
        .s_axis_config_tdata(fft_s_config_tdata),//IN Carries the configuration information
        .s_axis_config_tready(fft_s_config_tready),//OUT Asserted by the core to signal that it is ready to accept data
        .s_axis_config_tvalid(fft_s_config_tvalid),//IN Asserted by the external master to signal that it is able to provide data
        //M_AXIS_STATUS
        .m_axis_status_tdata(fft_m_status_tdata),
        .m_axis_status_tvalid(fft_m_status_tvalid),
        //M_AXIS_DATA
        .m_axis_data_tdata(fft_m_data_tdata),//OUT Carries the processed sample data XK_RE and XK_IM
        .m_axis_data_tlast(fft_m_data_tlast),//OUT Asserted by the core on the last sample of the frame
        .m_axis_data_tuser(fft_m_data_tuser),//OUT Carries additional per-sample information: XK_INDEX, OVFLO and BLK_EXP
        .m_axis_data_tvalid(fft_m_data_tvalid),//OUT Asserted by the core to signal that it is able to provide status data
        //EVENTS
        .event_frame_started(fft_event_frame_started),//Asserted when the core starts to process a new frame
        .event_tlast_unexpected(fft_event_tlast_unexpected),//Asserted when the core sees s_axis_data_tlast High on a data sample that is not the last one in a frame
        .event_tlast_missing(fft_event_tlast_missing),//Asserted when s_axis_data_tlast is Low on the last data sample of a frame
        .event_data_in_channel_halt(fft_event_data_in_channel_halt)//Asserted when the core requests data from the Data Input channel and none is available
    );
    
    wire[63:0]  fft_sinf;
    wire        fft_sinf_val;
   xfft_f fft_float (
        .aclk(aclk),                                                // input wire aclk
        .aresetn(aresetn),                                          // input wire aresetn
        .s_axis_config_tdata(16'b1),                  // input wire [15 : 0] s_axis_config_tdata
        .s_axis_config_tvalid(1),                // input wire s_axis_config_tvalid
        .s_axis_config_tready(),                // output wire s_axis_config_tready
        .s_axis_data_tdata(sinf),                      // input wire [63 : 0] s_axis_data_tdata
        .s_axis_data_tvalid(sinf_val),                    // input wire sinf_val
        .s_axis_data_tready(),                    // output wire s_axis_data_tready
        .s_axis_data_tlast(),                      // input wire s_axis_data_tlast
        .m_axis_data_tdata(fft_sinf),                      // output wire [63 : 0] m_axis_data_tdata
        .m_axis_data_tvalid(fft_sinf_val),                    // output wire m_axis_data_tvalid
        .m_axis_data_tready(1),                    // input wire m_axis_data_tready
        .m_axis_data_tlast(),                      // output wire m_axis_data_tlast
        .event_frame_started(),                  // output wire event_frame_started
        .event_tlast_unexpected(),            // output wire event_tlast_unexpected
        .event_tlast_missing(),                  // output wire event_tlast_missing
        .event_status_channel_halt(),      // output wire event_status_channel_halt
        .event_data_in_channel_halt(),    // output wire event_data_in_channel_halt
        .event_data_out_channel_halt()  // output wire event_data_out_channel_halt
); 

    wire[31:0]   fft_datare, fft_dataim, fft_data2, fft_data;
    wire         fft_datare_val, fft_dataim_val, fft_data2_val, fft_data_val;

    mult   mult_re(
        .aclk(aclk),
        .s_axis_a_tdata(fft_sinf[31:0]),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(fft_sinf_val),
        .s_axis_b_tdata(fft_sinf[31:0]),
        .s_axis_b_tready(),
        .s_axis_b_tvalid(fft_sinf_val),
        .m_axis_result_tdata(fft_datare),
        .m_axis_result_tvalid(fft_datare_val)
    );
    
    mult   mult_im(
        .aclk(aclk),
        .s_axis_a_tdata(fft_sinf[63:32]),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(fft_sinf_val),
        .s_axis_b_tdata(fft_sinf[63:32]),
        .s_axis_b_tready(),
        .s_axis_b_tvalid(fft_sinf_val),
        .m_axis_result_tdata(fft_dataim),
        .m_axis_result_tvalid(fft_dataim_val)
    );
    
    add add_inst(
        .aclk(aclk),
        .s_axis_a_tdata(fft_datare),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(fft_datare_val),
        .s_axis_b_tdata(fft_dataim),
        .s_axis_b_tready(),
        .s_axis_b_tvalid(fft_dataim_val),
        .m_axis_result_tdata(fft_data2),
        .m_axis_result_tvalid(fft_data2_val)
    );
    
    sqrt   sqrt_inst(
        .aclk(aclk),
        .s_axis_a_tdata(fft_data2),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(fft_data2_val),
        .m_axis_result_tdata(fft_data),
        .m_axis_result_tvalid(fft_data_val)
    );

    wire[63:0]  fft_data_fixed;
    wire        fft_data_fixed_val;
    float2fix   float2fix_inst(
        .aclk(aclk),
        .s_axis_a_tdata(fft_data),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(fft_data_val),
        .m_axis_result_tdata(fft_data_fixed),
        .m_axis_result_tvalid(fft_data_fixed_val)
    );
    
    //----------------------IFFT core-------------------

    wire [31:0] ifft_m_data_tdata;
    wire ifft_m_data_tlast;
 
    wire [23:0] ifft_m_data_tuser;//[11:0]XK_INDEX
    wire ifft_m_data_tvalid;
    
    ifft_0 usr_ifft(
        .aclk(aclk),//Rising-edge clock
        .aresetn(aresetn),//(低有效)Active-Low synchronous clear (optional, always take priority over aclken); A minimum aresetn active pulse of two cycles is required
        //S_AXIS_DATA
        .s_axis_data_tdata(fft_m_data_tdata),//IN Carries the unprocessed sample data: XN_RE and XN_IM
        .s_axis_data_tlast(fft_m_data_tlast),//IN Asserted by the external master on the last sample of the frame
       // .s_axis_data_tready(fft_s_data_tready),//OUT Used by the core to signal that it is ready to accept data
        .s_axis_data_tvalid(fft_m_data_tvalid),//IN Used by the external master to signal that it is able to provide data
        //S_AXIS_CONFIG
        .s_axis_config_tdata(8'd0),//IN Carries the configuration information
        .s_axis_config_tready(fft_s_config_tready),//OUT Asserted by the core to signal that it is ready to accept data
        .s_axis_config_tvalid(fft_s_config_tvalid),//IN Asserted by the external master to signal that it is able to provide data
        //M_AXIS_STATUS
        .m_axis_status_tdata(fft_m_status_tdata),
        .m_axis_status_tvalid(fft_m_status_tvalid),
        //M_AXIS_DATA
        .m_axis_data_tdata(ifft_m_data_tdata),//OUT Carries the processed sample data XK_RE and XK_IM
        .m_axis_data_tlast(ifft_m_data_tlast),//OUT Asserted by the core on the last sample of the frame
        .m_axis_data_tuser(ifft_m_data_tuser),//OUT Carries additional per-sample information: XK_INDEX, OVFLO and BLK_EXP
        .m_axis_data_tvalid(ifft_m_data_tvalid),//OUT Asserted by the core to signal that it is able to provide status data
        //EVENTS
        .event_frame_started(),//Asserted when the core starts to process a new frame
        .event_tlast_unexpected(),//Asserted when the core sees s_axis_data_tlast High on a data sample that is not the last one in a frame
        .event_tlast_missing(),//Asserted when s_axis_data_tlast is Low on the last data sample of a frame
        .event_data_in_channel_halt()//Asserted when the core requests data from the Data Input channel and none is available
    );
    
    
    wire[63:0]  ifft_sinf;
    wire        ifft_sinf_val, ifft_sinf_last;
    ifft_f ifft_float (
        .aclk(aclk),                                                // input wire aclk
        .aresetn(aresetn),                                          // input wire aresetn
        .s_axis_config_tdata(16'b0),                  // input wire [15 : 0] s_axis_config_tdata
        .s_axis_config_tvalid(1),                // input wire s_axis_config_tvalid
        .s_axis_config_tready(),                // output wire s_axis_config_tready
        .s_axis_data_tdata(fft_sinf),                      // input wire [63 : 0] s_axis_data_tdata
        .s_axis_data_tvalid(fft_sinf_val),                    // input wire sinf_val
        .s_axis_data_tready(),                    // output wire s_axis_data_tready
        .s_axis_data_tlast(),                      // input wire s_axis_data_tlast
        .m_axis_data_tdata(ifft_sinf),                      // output wire [63 : 0] m_axis_data_tdata
        .m_axis_data_tvalid(ifft_sinf_val),                    // output wire m_axis_data_tvalid
        .m_axis_data_tready(1),                    // input wire m_axis_data_tready
        .m_axis_data_tlast(ifft_sinf_last),                      // output wire m_axis_data_tlast
        .event_frame_started(),                  // output wire event_frame_started
        .event_tlast_unexpected(),            // output wire event_tlast_unexpected
        .event_tlast_missing(),                  // output wire event_tlast_missing
        .event_status_channel_halt(),      // output wire event_status_channel_halt
        .event_data_in_channel_halt(),    // output wire event_data_in_channel_halt
        .event_data_out_channel_halt()  // output wire event_data_out_channel_halt
); 

    wire[31:0]  re_ifft_sinf = ifft_sinf[31:0];
    wire[31:0]  im_ifft_sinf = ifft_sinf[63:32];
    wire[63:0]  ifft_data_fixed_re, ifft_data_fixed_im;
    wire        ifft_data_fixed_val;
    float2fix   float2fix_ifft_re(
        .aclk(aclk),
        .s_axis_a_tdata(re_ifft_sinf),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(ifft_sinf_val),
        .m_axis_result_tdata(ifft_data_fixed_re),
        .m_axis_result_tvalid(ifft_data_fixed_val)
    );
    float2fix   float2fix_ifft_im(
        .aclk(aclk),
        .s_axis_a_tdata(im_ifft_sinf),
        .s_axis_a_tready(),
        .s_axis_a_tvalid(ifft_sinf_val),
        .m_axis_result_tdata(ifft_data_fixed_im),
        .m_axis_result_tvalid()
    );
    
    

    //----------------将FFT/IFFT处理完的信号传出(虚部/实部分别传出)-------
    assign fft_real = fft_m_data_tdata[15:0];
    assign fft_imag = fft_m_data_tdata[31:16];
    wire[31:0]  RE, IM;
    mult_gen    mult_gen_RE(
        .CLK(aclk),
        .A(fft_real),
        .B(fft_real),
        .P(RE)
        );
    mult_gen    mult_gen_IM(
        .CLK(aclk),
        .A(fft_imag),
        .B(fft_imag),
        .P(IM)
        );
    add32bits   add_gen(
        .CLK(aclk),
        .A(RE),
        .B(IM),
        .S(data)
    );
endmodule
