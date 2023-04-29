onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib ifft_f_opt

do {wave.do}

view wave
view structure
view signals

do {ifft_f.udo}

run -all

quit -force
