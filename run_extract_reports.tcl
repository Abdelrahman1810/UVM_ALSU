vlib work

vlog -coveropt 3 +cover +acc {Codes\shared_pkg\shared_pkg.sv}
###
vlog -coveropt 3 +cover +acc {Codes\Interface\interface.sv}

vlog -coveropt 3 +cover +acc {Codes\refrence\ALSU_ref.sv}
###
vlog -coveropt 3 +cover +acc {Codes\design\ALSU.sv}
vlog -coveropt 3 +cover +acc {Codes\design\assertion.sv}
###
vlog -coveropt 3 +cover +acc {Codes\objects\configration.sv}

vlog -coveropt 3 +cover +acc {Codes\objects\sequence_Items\sequenceItem.sv}
vlog -coveropt 3 +cover +acc {Codes\objects\sequence_Items\sequenceItem_Valid.sv}

vlog -coveropt 3 +cover +acc {Codes\objects\ALSU_sequence\ALSU_reset_sequence.sv}
vlog -coveropt 3 +cover +acc {Codes\objects\ALSU_sequence\ALSU_main_sequence.sv}
###
vlog -coveropt 3 +cover +acc {Codes\top\Test\env\agent\driver\driver.sv}
vlog -coveropt 3 +cover +acc {Codes\top\Test\env\agent\monitor\monitor.sv}
vlog -coveropt 3 +cover +acc {Codes\top\Test\env\agent\sequencer\sequencer.sv}
vlog -coveropt 3 +cover +acc {Codes\top\Test\env\agent\agent.sv}
###
vlog -coveropt 3 +cover +acc {Codes\top\Test\env\coverage_collector\coverage_collector.sv}
vlog -coveropt 3 +cover +acc {Codes\top\Test\env\scoreboard\scoreboard.sv}
vlog -coveropt 3 +cover +acc {Codes\top\Test\env\env.sv}
###
vlog -coveropt 3 +cover +acc {Codes\top\Test\test.sv}
vlog -coveropt 3 +cover +acc {Codes\top\top.sv}

#vsim -voptargs=+acc work.top -classdebug -uvmcontrol=all
vsim +UVM_VERBOSITY=UVM_LOW -voptargs=+acc work.top -classdebug -uvmcontrol=all -cover

vsim -coverage -vopt work.top -c -do "add wave *; coverage save -onexit -du ALSU -directive -codeAll cover.ucdb; run -all"
coverage report -detail -cvg -directive -comments -output {Reports/Directive_Coverage_report.txt}
coverage report -detail -cvg -directive -comments -output {Reports/FUNCTION_COVER_ALSU.txt} {}

quit -sim

vcover report cover.ucdb -details -all -annotate -output {Reports/code_coverage_cover_ALSU.txt} 
vcover report -html cover.ucdb -output {Reports/HTML_code_cover\.}