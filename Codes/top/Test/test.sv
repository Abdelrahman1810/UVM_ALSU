package test_pkg;
import shared_pkg::*;
import env_pkg::*;
import config_pkg::*;
import main_sequence_pkg::*;
import rst_sequence_pkg::*;
import sequenceItem_pkg::*;
import sequenceItem_valid_pkg::*;

import uvm_pkg::*;
`include "uvm_macros.svh"
`define create_obj(type, name) type::type_id::create(name, this);

class ALSU_test extends uvm_test;
    `uvm_component_utils(ALSU_test)
    ALSU_env env;
    ALSU_config cfg;

    ALSU_reset_sequence rst_seq;
    ALSU_main_sequence main_seq;
    
    // declare new() function of parent uvm_test
    function new(string name = "ALSU_test", uvm_component parent = null);
        super.new(name, parent);
    endfunction //new()

    // build phase function and send the parameter phase to parent uvm_test
        function void build_phase(uvm_phase phase);
            uvm_factory factory = uvm_factory::get(); 
            super.build_phase(phase);
            //set_type_override_by_type(ALSU_sequenceItem::get_type(), ALSU_sequenceItem_valid::get_type());
            factory.print();
            env = `create_obj(ALSU_env, "env");
            cfg = `create_obj(ALSU_config, "cfg");
            rst_seq = `create_obj(ALSU_reset_sequence, "rst_seq")
            main_seq = `create_obj(ALSU_main_sequence, "main_seq")

             if (!uvm_config_db#(virtual ALSU_interface)::get(this, "", "INTERFACE", cfg.v_if))
                    `uvm_fatal("build_phase", "TEST - Unable to get config");

            uvm_config_db#(ALSU_config)::set(this, "*", "CFG", cfg);
        endfunction

    // run phase function to create UVM env
        task run_phase(uvm_phase phase);
            super.run_phase(phase);
            
            // raise and drop to start and finish of ALSU_test
            phase.raise_objection(this);
            // ONLY SHOW IF +UVM_VERBOSITY=UVM_DEBUG
            #1; `uvm_info("run_phase", "Inside the slaby test DEBUG", UVM_DEBUG) 

            ////////////////////
            //    stimulus    //
            ////////////////////
            // rst seq
            `uvm_info("run_phase", "ALSU reset seq start", UVM_MEDIUM)
            rst_seq.start(env.agt.sqr);
            `uvm_info("run_phase", "ALSU reset seq finish", UVM_MEDIUM)
            // Main seq
            `uvm_info("run_phase", "ALSU main seq start", UVM_MEDIUM)
            main_seq.start(env.agt.sqr);
            `uvm_info("run_phase", "ALSU reset seq finish", UVM_MEDIUM)

            phase.drop_objection(this);
        endtask
endclass //ALSU_test extends uvm_test
endpackage