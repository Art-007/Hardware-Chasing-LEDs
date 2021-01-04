`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/21/2020 10:41:56 PM
// Design Name: 
// Module Name: delayed_led
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


module delayed_led
(
  input logic reset,
  input logic clk,
  input logic stop,
  input logic m_tick, 
  output logic [15:0] led
 );
 
 // declarations 
 logic [15:0] temp_next, temp_reg;
 logic direction_next, direction_reg;
 
 //sate register 
 always_ff@(posedge clk, posedge reset)
 begin 
    // upon reset move go back to the first led 
    if (reset)
      begin
        temp_reg <= 16'b0000000000000001;
        direction_reg <=0;
      end 
    // assign reg to next   
    else 
      begin
       temp_reg <= temp_next;
       direction_reg <= direction_next;
     end
 end 
 
 // combinational 
 always_comb
 begin
    // holds the direction reg 
    direction_next = direction_reg;
    // upon stop make led to stay and then when coninue after is not switch
   if(stop)
     begin
        temp_next = temp_reg;
     end
   // if the stop is NOT present begin the led
   else 
     begin
      
        // when is in the first led direction is 0 meaning to the left 
        // make direction low
        if (temp_reg==16'b0000000000000001)
             direction_next = 1'b0;
            // when is in the last led,  direction is 1 meaning to the right
            // make durection high 
         else if (temp_reg ==16'b1000000000000000)    
                 direction_next = 1'b1;
                 
        // check for the direction here is 0 zero so to the left
        if (~direction_reg)
           // move to the next after tick is done 
           if(m_tick)
              temp_next = temp_reg << 1;
           else 
           // if m_tick not yet reach stay on 
              temp_next = temp_reg;
              
        // check for the direction right   
         else if (direction_reg)               
           // move to the next after tick is done
           if(m_tick)
              temp_next = temp_reg >> 1;
           else 
             // if m_tick not yet reach stay on 
             temp_next = temp_reg;
     end
 end 
 // assing led to the temp_led
 assign led = temp_reg;
 
 endmodule
 

    
   
 
 
 
 
    

