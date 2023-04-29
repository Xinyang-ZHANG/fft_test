`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 2021/04/12 14:13:47
// Design Name: 
// Module Name: fft_testbench
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

module fft_testbench( );
    reg aclk,aresetn;
    wire [15:0] fft_real,fft_imag;
    wire [15:0]dds_m_data_tdata;
    wire [31:0]data;
    fft fft_test(      
        .aclk(aclk),
        .aresetn(aresetn),
        .fft_real(fft_real),
        .fft_imag(fft_imag),
        .dds10_m_data_tdata(dds_m_data_tdata),
        .data(data)
    );

    initial begin
        aclk = 0;
        aresetn = 0;//低有效
        #10.3 aresetn = 1;
    end
    always #2.5 aclk=~aclk;//时钟频率100MHz
endmodule;