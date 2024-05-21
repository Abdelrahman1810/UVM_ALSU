`timescale 1ps/1ps
package env_pkg;
import shared_pkg::*;
import scoreboard_pkg::*;
import coverage_collector_pkg::*;
import agent_pkg::*;
import uvm_pkg::*;
`include "uvm_macros.svh"
`define create_obj(type, name) type::type_id::create(name, this);

// Environment class
class ALSU_env extends uvm_env;
    `uvm_component_utils(ALSU_env)

    ALSU_scoreboard sb;
    ALSU_coverage cov;
    ALSU_agent agt;

    // declare new() function of parent uvm_env
    function new(string name = "ALSU_env", uvm_component parent = null);
        super.new(name, parent);
    endfunction //new()

    // build phase function and send the parameter phase to parent uvm_env
    function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        // create scoreboard, coverage and agent
        // if we have more than one I should change name (first parameter)
        agt = `create_obj(ALSU_agent, "agt")
        sb = `create_obj(ALSU_scoreboard, "sb")
        cov = `create_obj(ALSU_coverage, "cov")

        // Override the default instantiation of ALSU_sequenceItem objects with ALSU_sequenceItem_valid objects
        //uvm_factory::set_default_create_ "ALSU_sequenceItem", () => ALSU_sequenceItem_valid::type_id::create();
    endfunction

    function void connect_phase(uvm_phase phase);     
        agt.agt_port.connect(sb.sb_export);   // why we connect with export directly why not fifo first
        agt.agt_port.connect(cov.cov_export); // why we connect with export directly why not fifo first  
    endfunction
endclass //ALSU_env extends uvm_env
endpackage