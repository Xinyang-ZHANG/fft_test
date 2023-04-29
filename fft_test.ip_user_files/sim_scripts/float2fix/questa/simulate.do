onbreak {quit -f}
onerror {quit -f}

vsim -t 1ps -lib xil_defaultlib float2fix_opt

do {wave.do}

view wave
view structure
view signals

do {float2fix.udo}

run -all

quit -force
