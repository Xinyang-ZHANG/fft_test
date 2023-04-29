onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib add32bits_opt

do {wave.do}

view wave
view structure
view signals

do {add32bits.udo}

run -all

quit -force
