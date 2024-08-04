# UVM ALSU

## Design Overview
The UVM ALSU (Universal Verification Methodology Arithmetic and Logic Simulation Unit) is a verification environment designed to test the functionality of an ALSU (Arithmetic and Logic Simulation Unit) in a SystemVerilog based verification flow. The ALSU is a core component of a CPU that performs various arithmetic and logic operations on data.

## Verification Environment
The verification environment for the ALSU design is set up using UVM. It includes the following components:

### Simulation Setup
1. To observe the design behavior in the waveform, run the `run.tcl` script.
2. To extract all the coverage reports, run the `run_extract_reports.tcl` script.

### Configurable Parameters
Before running the simulation, you can modify the following loop variables in the `shared_pkg.sv` file:
- `HOBBIT_LOOP`
- `DWARF_LOOP`
- `HUMAN_LOOP`
- `GIANT_LOOP`
- `BOOM_LOOP`

These variables control the number of iterations for each type of transaction, allowing you to customize the test scenario.

### Verification Components
The verification environment consists of the following key components:
1. **Test Bench**: The top-level module that instantiates the ALSU design and the verification components.
2. **Environment**: Responsible for creating and managing the verification components, such as the agent, monitor, scoreboard, and coverage collector.
3. **Agent**: Generates the stimulus for the ALSU design and handles the transaction-level communication.
4. **Monitor**: Observes the inputs and outputs of the ALSU design and collects data for the scoreboard and coverage collector.
5. **Scoreboard**: Compares the expected results with the actual results from the ALSU design.
6. **Coverage Collector**: Measures the coverage of the verification process, including code coverage and functional coverage.

## Verification Plan
1. **Test Cases**:
   - **Initialization and Reset**:
     - Verify that the module resets correctly when the `rst` signal is asserted.
     - Ensure that all the registers are set to their initial values.
   - **Invalid Operations**:
     - Verify that the `invalid` signal is correctly generated when the `red_op_A`, `red_op_B`, and `opcode` signals violate the specified conditions.
     - Ensure that the `leds` output is toggled when an invalid operation is detected, and the `out` output is set to 0.
   - **Valid Operations**:
     - Test the various arithmetic and logical operations (`OR`, `XOR`, `ADD`, `MUL`) with different input combinations, including the handling of the `cin` signal for the adder.
     - Verify the correct shifting behavior when the `direction` signal is high and low.
   - **Bypass Modes**:
     - Ensure that the `out` output correctly selects the values of `A_reg` or `B_reg` when the `bypass_A` or `bypass_B` signals are asserted.

2. **Assertions**:
   - **Illegal Combinations**:
     - Add assertions to check that the `invalid_red_op` and `invalid_opcode` signals are correctly generated based on the input values.
   - **Output Correctness**:
     - Add assertions to verify that the `out` output matches the expected results for each valid operation, considering the input values and control signals.
   - **Timing Constraints**:
     - Add assertions to ensure that the module's behavior satisfies any timing constraints, such as the correct propagation of input signals to the output.

3. **Directive coverage**:
  - cover every assert property in the design

## UVM Verification Flow
The UVM verification flow for the ALSU design includes the following steps:
1. **Test Case Generation**: Generate a comprehensive set of test cases to cover the ALSU's functionality.
3. **Stimulus Constraints**: Use the sequenceItem to constraint the appropriate input stimuli for the ALSU design.
3. **Stimulus Generation**: Use the agent to generate the appropriate input stimuli for the ALSU design.
4. **Design Monitoring**: Use the monitor to observe the ALSU design's inputs and outputs and collect data for the scoreboard and coverage collector.
5. **Result Comparison**: Use the scoreboard to compare the expected results from ALSU_ref design with the actual results from the ALSU design.
6. **Coverage Measurement**: Use the coverage collector to measure the coverage of the verification process and identify any gaps.
7. **Debug and Iteration**: If any issues are found, debug the design and the verification environment, and then iterate the process until the desired coverage is achieved.

## Project Structure
The project contains the following components:

1. **Documentation**:
   - `README.md`: Provides an overview of the project and instructions for getting started.
   - `UVM_ALSU_report.pdf`: Detailed documentation of the verification environment and the verification plan.

2. **Codes**:
   - **interface**:
     - `interface.sv`: Interface code.
   - **Design**:
     - `ALSU.v`: Design code.
     - `assertion.sv`: SystemVerilog assertions for the design.
   - **refrence**:
     - `ALSU_ref.sv`: Reference code.
   - **shared_pkg**:
     - `shared_pkg.sv`: Shared package with all shared variables.
   - **objects**:
     - `configration.sv`: Configuration database code.
     - **sequence_Item**:
       - `sequenceItem.sv`: Sequence item code with constraints.
       - `sequenceItem_Valid.sv`: Sequence item code with constraints valid cases only.
     - **FIFO_sequence**:
       - `ALSU_main_sequence.sv`
       - `ALSU_reset_sequence.sv`
   - **top**:
     - `top.sv`: Top-level code.
     - **test**:
       - `test.sv`: Test code.
       - **env**:
         - `env.sv`: Environment code.
         - **coverage_collector**:
           - `coverage_collector.sv`: Coverage collector code.
         - **scoreboard**:
           - `scoreboard.sv`: Scoreboard code.
         - **agent**:
           - `agent.sv`: Agent code.
           - **driver**:
             - `driver.sv`: Driver code.
           - **monitor**:
             - `monitor.sv`: Monitor code.
           - **sequencer**:
             - `sequencer.sv`: Sequencer code.

3. **Reports**:
   - **html_code_cover_report**:
     - `index.html`: Code coverage HTML report
   - **Text Reports**:
     - `Directive_Coverage_report.txt`: Code coverage text report
     - `FUNCTION_COVER_ALSU.txt`: covergroup text report
     - `code_coverage_cover_ALSU.txt`: Directive coverage text report
4. `run.tcl`: The script to run the simulation and observe the waveform.
5. `run_extract_reports.tcl`: The script to extract the coverage reports.

## Getting Started
To get started with this repository, follow these steps:
> [!IMPORTANT]
> You need to have [QuestaSim](https://support.sw.siemens.com/en-US/) installed on your machine.

1. Clone the repository to your local machine using the following command:
```
git clone https://github.com/Abdelrahman1810/UVM_ALSU.git
```

2. Open the project in QuestaSim and run the `run.tcl` script to observe the design behavior in the waveform.

3. Run the `run_extract_reports.tcl` script to extract the coverage reports.

4. Modify the configurable parameters in the `shared_pkg.sv` file as needed to customize the test scenario.

5. Explore the verification components and the UVM verification flow to understand the implementation details.

6. Extend the verification environment to add more test cases, cover additional functionality, or improve the overall verification quality.
2. Open QuestaSim and navigate to the directory where the repository is cloned.
3. Compile the Verilog files by executing the following command in the QuestaSim transcript tap: 
```ruby
do run.do
```
This will compile All files in Codes folder.

## Contributing
If you find any issues or have suggestions for improvement, feel free to submit a pull request or open an issue in the repository. Contributions are always welcome!

## Contact info 💜
<a href="https://linktr.ee/A_Hassanen" target="_blank">
  <img align="left" alt="Linktree" width="180px" src="https://app.ashbyhq.com/api/images/org-theme-wordmark/b3f78683-a307-4014-b236-373f18850e2c/d54b020a-ff53-455a-9d52-c90c0f4f2081.png" />
</a> 
<br>
<br>

### this project from Eng.Kareem Waseem diploma
  <tbody>
    <tr>
      <td align="left" valign="top" width="14.28%">
      <a href="https://www.linkedin.com/in/kareem-waseem/"><img src="https://th.bing.com/th/id/OIP.gWfK4ytf9t3fZF2i2oE71QHaIi?rs=1&pid=ImgDetMain" width="100px;" alt="Kareem Waseem"/><br /><sub><b>Kareem Waseem</b></sub></a>
      <br /><a href="kwaseem94@gmail.com" title="Gmail">📧</a> 
      <a href="https://www.linkedin.com/in/kareem-waseem/" title="LinkedIn">🌍</a>
      <a href="https://linktr.ee/kareemw" title="Talks">📢</a>
      <a href="https://www.facebook.com/groups/319864175836046" title="Facebook grp">💻</a>
      </td>
    </tr>
  </tbody>
