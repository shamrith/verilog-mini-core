`timescale 1ns / 1ps

module mini_core_tb;

  reg clk;
  reg rst;

  // Instantiate the DUT (Device Under Test)
  mini_core uut (
  .clk(clk), 
  .rst(rst)
  );

  // Clock generation
  initial begin
    clk = 0;
    forever #5 clk = ~clk;  // 10ns clock period
  end

  // Stimulus
  initial begin
    // Initialize
    rst = 1;
    #10;  //10ns delay
    rst = 0;

    // Wait a few clock cycles
    #50;    //50ns wait for clock

    // Stop simulation
    #100 $finish;
  end

  // Dump waveform
  initial begin
    $dumpfile("mini_core.vcd");
    $dumpvars(0, mini_core_tb);       // dump top-level testbench
    $dumpvars(0, mini_core_tb.uut);   // dump DUT internals
  end

endmodule
