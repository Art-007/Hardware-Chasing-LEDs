`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 12:31:15 PM
// Design Name: 
// Module Name: top
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module top
(
  input logic reset,
  input logic clk, // genrally the 100MHz
  input logic stop,
  input logic [7:0] sw, 
  output logic [15:0]led_out,
  output logic [7:0] an,
   output logic [6:0] sseg 
 );
   
   // connections  
  logic max;
  logic [8:0] m_out;
  
  assign dp =1;
  logic r_clk;
  logic [1:0] twobitout;
  logic [6:0] Out7Seg_lower_1, Out7Seg_middle_1, Out7Seg_upper_1;
  
  
  // system 
   m_counter  m_counter  (.M(sw), .clk(clk),.reset(reset),.max_tick(max));
   delayed_led  system (.m_tick(max), .reset(reset), .stop(stop), .clk(clk), .led(led_out));
   
   // anodes 
   clock_div slow_clock(.clk(clk), .divider_clk(r_clk));
   refresh keep_on_anodes (.clk(r_clk), .twobitout(twobitout));
   anode_ctr num_anodes(.twobitcounter(twobitout), .AN_Control(an));
   
   // seven segement 
   bcd_ctr turn_on_segments (.Bit8In(sw[7:0]),. Out7Seg_lower(Out7Seg_lower_1),.Out7Seg_middle( Out7Seg_middle_1),.Out7Seg_upper(Out7Seg_upper_1));
   bcd_seg display (.seg7Disp0(Out7Seg_lower_1),.seg7Disp1(Out7Seg_middle_1),.seg7Disp2(Out7Seg_upper_1),.select(twobitout), .seg7out(sseg));
     
endmodule