`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2020 09:55:57 PM
// Design Name: 
// Module Name: anode_ctr
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


module anode_ctr(
 input logic [1:0] twobitcounter,
 output logic [7:0] AN_Control
 );
 
 // Keep anodes ON using the two bit counter 
 always_comb  
 begin
     case(twobitcounter)
        0: AN_Control = 8'b11111110; 
        1: AN_Control = 8'b11111101;
        2: AN_Control = 8'b11111011;
        endcase
end
endmodule
