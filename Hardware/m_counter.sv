`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2020 10:41:22 PM
// Design Name: 
// Module Name: m_counter
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


module m_counter
#(parameter  D= 8, ms = 5000000 , delay = 176470 )
(
input logic clk, reset, 
input logic [D -1:0] M,
output logic max_tick
);
 
    // signal declaration
logic [31:0] reg_next, cur_reg; //next register and current register
// body
 // Register 
always_ff @(posedge clk , posedge reset)
    begin
        if(reset)
            cur_reg <= 0;   //reset to 0
        else
        // move to the next
            cur_reg <= reg_next;
    end
    //500000 cycles  =50ms 
    // we got 176470 by 500ms -50ms = 450ms/1000s= .450sec => (4.5e8ns / 10ns) = 45000000 ns
    // thus 45000000 cycles / 255 =  about 176470
    //255 * 176470 => 45000000 + 5000000 = 50000000 cycles for 500ms,  * 10 => 500000000 => 500ms

    //2. next-state logic
    assign reg_next = (cur_reg == ( ms + (M * delay) ))? 0: cur_reg + 1;
    
    ////check to see at max count to drive the leds ON and OFF
    assign max_tick = (cur_reg == (ms + (M * delay) )) ? 1'b1: 1'b0; 
   
endmodule
