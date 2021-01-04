`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/22/2020 12:38:39 PM
// Design Name: 
// Module Name: top_tb
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


module top_tb;
    
  localparam T = 10;//clk period
    
  // declarations   
 logic clk, reset;
 logic stop;
 logic [15:0] led_out;
 logic [7:0] sw;
 logic d_counter;
    
    // insta of top module 
   top uut( .reset(reset), .clk(clk),.stop(stop), .sw(sw), .led_out(led_out));
      
    
    //10ns clk
 always
    begin
        clk = 1'b1;
        #(T/2);
        clk = 1'b0;
        #(T/2);
    end
    
  // reset 
 initial
    begin
        reset = 1'b1;
        #(T/2);
        reset = 1'b0;
    end
    
 initial
    begin
   
   // stop at zero to begin  
    stop =1'b0;
    
    // testing diffrent dealys 
     sw= 8'b00000000; //50ms
     #200000000;
     
     sw= 8'b00011111; 
      #300000000;
      
     sw= 8'b00000111; //255ms 
      #100000000;
      
      
      // testing reset 
     #100000000;
     reset =1'b1;
     #100000000;
     reset =1'b0;
     
     
     // testing stop 
     #100000000; 
     stop =1'b1;
     #100000000;
     stop =1'b0;
     
     
     end     
endmodule