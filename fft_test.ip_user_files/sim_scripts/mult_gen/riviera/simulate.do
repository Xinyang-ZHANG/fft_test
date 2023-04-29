onbreak {quit -force}
onerror {quit -force}

asim -t 1ps +access +r +m+mult_gen -L xil_defaultlib -L xpm -L xbip_utils_v3_0_10 -L xbip_pipe_v3_0_6 -L xbip_bram18k_v3_0_6 -L mult_gen_v12_0_15 -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.mult_gen xil_defaultlib.glbl

do {wave.do}

view wave
view structure

do {mult_gen.udo}

run -all

endsim

quit -force
