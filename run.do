vlib work

vlog -coveropt 3 +cover +acc {Codes\shared_pkg\shared_pkg.sv}
###
vlog -coveropt 3 +cover +acc {Codes\Interface\interface.sv}

vlog -coveropt 3 +cover +acc {Codes\refrence\ALSU_ref.sv}
###
vlog -coveropt 3 +cover +acc {Codes\DUT\ALSU.sv}
vlog -coveropt 3 +cover +acc {Codes\DUT\assertion.sv}
###
vlog -coveropt 3 +cover +acc {Codes\objects\configration.sv}

vlog -coveropt 3 +cover +acc {Codes\objects\sequence_Items\sequenceItem.sv}
vlog -coveropt 3 +cover +acc {Codes\objects\sequence_Items\sequenceItem_Valid.sv}

vlog -coveropt 3 +cover +acc {Codes\objects\ALSU_sequence\ALSU_reset_sequence.sv}
vlog -coveropt 3 +cover +acc {Codes\objects\ALSU_sequence\ALSU_main_sequence.sv}
###
vlog -coveropt 3 +cover +acc {Codes\UVM\Test\env\agent\driver\driver.sv}
vlog -coveropt 3 +cover +acc {Codes\UVM\Test\env\agent\monitor\monitor.sv}
vlog -coveropt 3 +cover +acc {Codes\UVM\Test\env\agent\sequencer\sequencer.sv}
vlog -coveropt 3 +cover +acc {Codes\UVM\Test\env\agent\agent.sv}
###
vlog -coveropt 3 +cover +acc {Codes\UVM\Test\env\coverage_collector\coverage_collector.sv}
vlog -coveropt 3 +cover +acc {Codes\UVM\Test\env\scoreboard\scoreboard.sv}
vlog -coveropt 3 +cover +acc {Codes\UVM\Test\env\env.sv}
###
vlog -coveropt 3 +cover +acc {Codes\UVM\Test\test.sv}
vlog -coveropt 3 +cover +acc {Codes\UVM\top.sv}

#vsim -voptargs=+acc work.top -classdebug -uvmcontrol=all
vsim +UVM_VERBOSITY=UVM_LOW -voptargs=+acc work.top -classdebug -uvmcontrol=all -cover

add wave -position insertpoint sim:/top/intf/*

add wave -radix hexadecimal sim:/top/intf/out
add wave -radix hexadecimal sim:/top/intf/out_ref
add wave -color Orchid -radix hexadecimal sim:/top/intf/leds
add wave -color gold   -radix hexadecimal sim:/top/intf/leds_ref

run -all
#quit -sim