onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib fix2float_opt

do {wave.do}

view wave
view structure
view signals

do {fix2float.udo}

run -all

quit -force
