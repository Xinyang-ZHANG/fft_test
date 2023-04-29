onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib add_opt

do {wave.do}

view wave
view structure
view signals

do {add.udo}

run -all

quit -force
