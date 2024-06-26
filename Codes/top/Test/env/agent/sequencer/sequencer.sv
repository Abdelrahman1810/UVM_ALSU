package sequencer_pkg;
import uvm_pkg::*;
import sequenceItem_pkg::*;
`include "uvm_macros.svh"
`define create_obj(type, name) type::type_id::create(name, this);

// sequencer class
class sequencer extends uvm_sequencer #(ALSU_sequenceItem);
    `uvm_component_utils(sequencer)
    function new(string name = "sequencer", uvm_component parent = null);
        super.new(name, parent);
    endfunction //new()
endclass //sequencer extends uvm_sequencer #(ALSU_sequenceItem)
endpackage