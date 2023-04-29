// Copyright 1986-2019 Xilinx, Inc. All Rights Reserved.
// --------------------------------------------------------------------------------
// Tool Version: Vivado v.2019.1 (win64) Build 2552052 Fri May 24 14:49:42 MDT 2019
// Date        : Fri Apr 23 09:28:26 2021
// Host        : DESKTOP-C3MDEKS running 64-bit major release  (build 9200)
// Command     : write_verilog -force -mode funcsim
//               c:/Users/dell/Desktop/CameraLink/fft_test2/fft_test2.srcs/sources_1/ip/add32bits/add32bits_sim_netlist.v
// Design      : add32bits
// Purpose     : This verilog netlist is a functional simulation representation of the design and should not be modified
//               or synthesized. This netlist cannot be used for SDF annotated simulation.
// Device      : xc7z010clg400-1
// --------------------------------------------------------------------------------
`timescale 1 ps / 1 ps

(* CHECK_LICENSE_TYPE = "add32bits,c_addsub_v12_0_13,{}" *) (* downgradeipidentifiedwarnings = "yes" *) (* x_core_info = "c_addsub_v12_0_13,Vivado 2019.1" *) 
(* NotValidForBitStream *)
module add32bits
   (A,
    B,
    CLK,
    S);
  (* x_interface_info = "xilinx.com:signal:data:1.0 a_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME a_intf, LAYERED_METADATA undef" *) input [31:0]A;
  (* x_interface_info = "xilinx.com:signal:data:1.0 b_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME b_intf, LAYERED_METADATA undef" *) input [31:0]B;
  (* x_interface_info = "xilinx.com:signal:clock:1.0 clk_intf CLK" *) (* x_interface_parameter = "XIL_INTERFACENAME clk_intf, ASSOCIATED_BUSIF s_intf:c_out_intf:sinit_intf:sset_intf:bypass_intf:c_in_intf:add_intf:b_intf:a_intf, ASSOCIATED_RESET SCLR, ASSOCIATED_CLKEN CE, FREQ_HZ 100000000, PHASE 0.000, INSERT_VIP 0" *) input CLK;
  (* x_interface_info = "xilinx.com:signal:data:1.0 s_intf DATA" *) (* x_interface_parameter = "XIL_INTERFACENAME s_intf, LAYERED_METADATA undef" *) output [31:0]S;

  wire [31:0]A;
  wire [31:0]B;
  wire CLK;
  wire [31:0]S;
  wire NLW_U0_C_OUT_UNCONNECTED;

  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "32" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "00000000000000000000000000000000" *) 
  (* c_b_width = "32" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "32" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  add32bits_c_addsub_v12_0_13 U0
       (.A(A),
        .ADD(1'b1),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b1),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_U0_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule

(* C_ADD_MODE = "0" *) (* C_AINIT_VAL = "0" *) (* C_A_TYPE = "0" *) 
(* C_A_WIDTH = "32" *) (* C_BORROW_LOW = "1" *) (* C_BYPASS_LOW = "0" *) 
(* C_B_CONSTANT = "0" *) (* C_B_TYPE = "0" *) (* C_B_VALUE = "00000000000000000000000000000000" *) 
(* C_B_WIDTH = "32" *) (* C_CE_OVERRIDES_BYPASS = "1" *) (* C_CE_OVERRIDES_SCLR = "0" *) 
(* C_HAS_BYPASS = "0" *) (* C_HAS_CE = "0" *) (* C_HAS_C_IN = "0" *) 
(* C_HAS_C_OUT = "0" *) (* C_HAS_SCLR = "0" *) (* C_HAS_SINIT = "0" *) 
(* C_HAS_SSET = "0" *) (* C_IMPLEMENTATION = "0" *) (* C_LATENCY = "1" *) 
(* C_OUT_WIDTH = "32" *) (* C_SCLR_OVERRIDES_SSET = "1" *) (* C_SINIT_VAL = "0" *) 
(* C_VERBOSITY = "0" *) (* C_XDEVICEFAMILY = "zynq" *) (* ORIG_REF_NAME = "c_addsub_v12_0_13" *) 
(* downgradeipidentifiedwarnings = "yes" *) 
module add32bits_c_addsub_v12_0_13
   (A,
    B,
    CLK,
    ADD,
    C_IN,
    CE,
    BYPASS,
    SCLR,
    SSET,
    SINIT,
    C_OUT,
    S);
  input [31:0]A;
  input [31:0]B;
  input CLK;
  input ADD;
  input C_IN;
  input CE;
  input BYPASS;
  input SCLR;
  input SSET;
  input SINIT;
  output C_OUT;
  output [31:0]S;

  wire \<const0> ;
  wire [31:0]A;
  wire [31:0]B;
  wire CLK;
  wire [31:0]S;
  wire NLW_xst_addsub_C_OUT_UNCONNECTED;

  assign C_OUT = \<const0> ;
  GND GND
       (.G(\<const0> ));
  (* C_AINIT_VAL = "0" *) 
  (* C_BORROW_LOW = "1" *) 
  (* C_CE_OVERRIDES_BYPASS = "1" *) 
  (* C_CE_OVERRIDES_SCLR = "0" *) 
  (* C_HAS_CE = "0" *) 
  (* C_HAS_SCLR = "0" *) 
  (* C_HAS_SINIT = "0" *) 
  (* C_HAS_SSET = "0" *) 
  (* C_IMPLEMENTATION = "0" *) 
  (* C_SCLR_OVERRIDES_SSET = "1" *) 
  (* C_SINIT_VAL = "0" *) 
  (* C_VERBOSITY = "0" *) 
  (* C_XDEVICEFAMILY = "zynq" *) 
  (* c_a_type = "0" *) 
  (* c_a_width = "32" *) 
  (* c_add_mode = "0" *) 
  (* c_b_constant = "0" *) 
  (* c_b_type = "0" *) 
  (* c_b_value = "00000000000000000000000000000000" *) 
  (* c_b_width = "32" *) 
  (* c_bypass_low = "0" *) 
  (* c_has_bypass = "0" *) 
  (* c_has_c_in = "0" *) 
  (* c_has_c_out = "0" *) 
  (* c_latency = "1" *) 
  (* c_out_width = "32" *) 
  (* downgradeipidentifiedwarnings = "yes" *) 
  add32bits_c_addsub_v12_0_13_viv xst_addsub
       (.A(A),
        .ADD(1'b0),
        .B(B),
        .BYPASS(1'b0),
        .CE(1'b0),
        .CLK(CLK),
        .C_IN(1'b0),
        .C_OUT(NLW_xst_addsub_C_OUT_UNCONNECTED),
        .S(S),
        .SCLR(1'b0),
        .SINIT(1'b0),
        .SSET(1'b0));
endmodule
`pragma protect begin_protected
`pragma protect version = 1
`pragma protect encrypt_agent = "XILINX"
`pragma protect encrypt_agent_info = "Xilinx Encryption Tool 2019.1"
`pragma protect key_keyowner="Cadence Design Systems.", key_keyname="cds_rsa_key", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=64)
`pragma protect key_block
hkYW+OZm6k9gF5yAUfXGm/n8kfXYD6tjFQYha968Ws0SqrM/NNAjCrrtMG8kIqTbkipnmceefxNr
sB0PtSpUrw==

`pragma protect key_keyowner="Synopsys", key_keyname="SNPS-VCS-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NEPpD4CxNBVJLV3hg1agn83QnqiCz3YuR89MlVuNyQGERKVJ+uGolFDqHFzBKLQArFTiHBWivkzK
A2DQ42XdOxp30NKOgHjrjgmF+fZMjDs24rn3Ue1INLHwTS5RT84Kih7Jx/7R0dl03/COJq+33l9u
7l+ArdY7mLwqqI9iIjU=

`pragma protect key_keyowner="Aldec", key_keyname="ALDEC15_001", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
cfBwEwc95LpKuxDGqpON2gGac620iHNKrm/QNXYg3/OFA5ZQNdpdhRz4vCTQRVbOg7b1nIox6GR8
TD/cf0JW38RU0NuY+TR6CkFT19NCdy67gR6JTDdXifhr/zTKjOL5gvp0XjT9PSLwwPyDirNX4TMa
9y9X5pf4gEnt0dikHNgySZO+Qpr30MP7n6oAjuxowlf45cfmPqZthYPnIjBSCdQGBPfSF+kZ2F1N
XCDEja5xE4CQshPPodH5njadc6kj7/qp9C4PfKcyNtDug+qsws9UK25Z2IFc8vk6/15HlIkQHkXv
Wq0iHaPLidqh3035FinHyPD/FDnfGGa5Oa2qcg==

`pragma protect key_keyowner="ATRENTA", key_keyname="ATR-SG-2015-RSA-3", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
QmjD3HAHcP+h0RsjR0iH8h2N6drNxei50nfQN9RC8HobMEaARq/6rKjZEhHXMSCStQeCMhyVKRmN
HM7ZrqMf3W0s/8U4QMqp3M1VuYXVjEe2PCIpvtRcMY3JngdSWOydG2dH6dDA16ehxinMKgIr0TjA
PXA+lfyX6yTs1FWrne/6ufrl6ZAPpNG7EDKQ2aHqSm8DEXT1BJYMblBfAjAajwaJmPEu1aDlQeNo
onryTiFJkKP92pcZLCCufZL8ZAJ5uMvZZxiZRsiLd0BnCfOe3rl9AON+q53U+iK11EvAkpIBT+Cc
VYb5NqVAVaqXbQrqo3+YHEW5ft3fM9kZnlFDew==

`pragma protect key_keyowner="Xilinx", key_keyname="xilinxt_2019_02", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
FkHW107swc8fPv4xOTlQJU6PWERObturlywl6rsGCswc/v367bmQ1Maze/8QdmUPjEYwhAcHKVMu
7U4o3CvYhmrDpYiUQdQQ0B7gAbMZbJ8MFY5jRxn7KYDk+Bi9Ov8092IdW1a51FPWEVPmF4Kn6z4E
DSqpQDL58qieEUnrU2Ltb4GLJc3NrWTLvnbvRtHUUuQWTMZTQ7WqX4iH2dZ/EICpbRjlAF50iMAS
YHuuFTRKXcIFQlKYRyeQV4nyaA5JGbb3RC3N/Q2IZjdSXqQ9EOpmdhttpxReCnsdJiD/pPCtf7ZN
d/TheLy1Va2FZR+p4MozZorVui5/FtcCwKy6aw==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VELOCE-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=128)
`pragma protect key_block
NgZm/7Jvy0UZQRVxBVxeZ/odxMd59IlnRFHjM+6Bof6o6u4Qy4u9MOoQ3Sr2paPuGq+B+5EhdcD8
a5WGiurBrPW0qF+L2CoUJsDqz0WonRehZECQynibSUlmctvvMyr790pwb+C78gtW47p8uALYdUCJ
NhcDkV8fE3jFdDEYmfQ=

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-VERIF-SIM-RSA-2", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
TxQNdd2WOThZCBZEYNgXxai4jK9AqWD/GRadYnarEfzmLUfcNDUoG7DxVWHCdTVuW8i2qZpouT1H
FUHt76rzZk8vI2tFLfUbKyTaRqik1aYwOCp1ZdqbgqQEDhBRWJjGxcJuxZbSQ2z8IUgiJ0eT148+
nf9UmzvYS1jrIsN/a7K4EjyRNMk0V917y85rxdk7itlisaUw4Cm72z9slByFtALj6/077uPjcK9U
mbWm7PbXk8PT44eQeaJl990wlWvD5/8BZS6AHqjg8520Xs+jftSeB6aNqTiYxfp21FJqmexwo7cG
G3BH/DRHhP7ZIsXHqSaJJFo20Nx9VgpLuF5t2g==

`pragma protect key_keyowner="Mentor Graphics Corporation", key_keyname="MGC-PREC-RSA", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
opi89M0UhXFQTgpL6YJWTVfeoYJ3VdYGWVPpICnIh/pkyrYnoNFYzBzYSwydjCHJ3g4xUQNiL7MF
EIbuBd7OfdWShzT9U7866QQ6n5TrZV6WrVDYb1arCIZ+wg7G1+KkTPXXSycP6qlFd3DNdVt9/NgG
F2HzMPqsdTEyma5TQSfNqgTvo3kx1wDeWWmhb7jvQ7bUH8uszHiS1YBKcGqbHREDcX05Dln8LpGt
AoUH+T7sbB2UJSShVABrftZfjlnnbjt3pRGh65/BmBr9nYZOhcxGG2zevMuWoUwshzdhNkX5GVed
1g9cgPNSjyLw5cYaOG0bHzID6oJvOekc5w6edQ==

`pragma protect key_keyowner="Synplicity", key_keyname="SYNP15_1", key_method="rsa"
`pragma protect encoding = (enctype="BASE64", line_length=76, bytes=256)
`pragma protect key_block
Y2d+/47H5W0U5cjRR5/QM3tDlDg4qIYZujUU5S2gbrRCFJ1L6ixqIE95XnXIypVg8L9q5oQXUHB8
GIxNmu3QRx2GoZ0Wkbjp4dlNZ+1ECDXIChievkUfTWOK6Ft13Pjxg9HNvoiYvbyDVcCCP/3F7h6O
kdgsKsf1GzR3fxE8X9SfllSF6rRSO+oQvVIGk3+Yw7oUDiB1Mf8qiYEeJtYri4umfJ1vwVDdObSl
u23CzkIbZ4u4nmDIm+iWGua60y5zpl3SyO+IPnDCpe00r1CJk9B3/+2pS5/sur7KypcfpwvoEmLB
EurpVmGFSiLY2uMhaA347jO+25vHbd/a98LhVA==

`pragma protect data_method = "AES128-CBC"
`pragma protect encoding = (enctype = "BASE64", line_length = 76, bytes = 23200)
`pragma protect data_block
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
fA==
`pragma protect end_protected
`ifndef GLBL
`define GLBL
`timescale  1 ps / 1 ps

module glbl ();

    parameter ROC_WIDTH = 100000;
    parameter TOC_WIDTH = 0;

//--------   STARTUP Globals --------------
    wire GSR;
    wire GTS;
    wire GWE;
    wire PRLD;
    tri1 p_up_tmp;
    tri (weak1, strong0) PLL_LOCKG = p_up_tmp;

    wire PROGB_GLBL;
    wire CCLKO_GLBL;
    wire FCSBO_GLBL;
    wire [3:0] DO_GLBL;
    wire [3:0] DI_GLBL;
   
    reg GSR_int;
    reg GTS_int;
    reg PRLD_int;

//--------   JTAG Globals --------------
    wire JTAG_TDO_GLBL;
    wire JTAG_TCK_GLBL;
    wire JTAG_TDI_GLBL;
    wire JTAG_TMS_GLBL;
    wire JTAG_TRST_GLBL;

    reg JTAG_CAPTURE_GLBL;
    reg JTAG_RESET_GLBL;
    reg JTAG_SHIFT_GLBL;
    reg JTAG_UPDATE_GLBL;
    reg JTAG_RUNTEST_GLBL;

    reg JTAG_SEL1_GLBL = 0;
    reg JTAG_SEL2_GLBL = 0 ;
    reg JTAG_SEL3_GLBL = 0;
    reg JTAG_SEL4_GLBL = 0;

    reg JTAG_USER_TDO1_GLBL = 1'bz;
    reg JTAG_USER_TDO2_GLBL = 1'bz;
    reg JTAG_USER_TDO3_GLBL = 1'bz;
    reg JTAG_USER_TDO4_GLBL = 1'bz;

    assign (strong1, weak0) GSR = GSR_int;
    assign (strong1, weak0) GTS = GTS_int;
    assign (weak1, weak0) PRLD = PRLD_int;

    initial begin
	GSR_int = 1'b1;
	PRLD_int = 1'b1;
	#(ROC_WIDTH)
	GSR_int = 1'b0;
	PRLD_int = 1'b0;
    end

    initial begin
	GTS_int = 1'b1;
	#(TOC_WIDTH)
	GTS_int = 1'b0;
    end

endmodule
`endif
