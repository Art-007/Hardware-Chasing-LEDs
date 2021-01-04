`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2020 09:44:28 PM
// Design Name: 
// Module Name: bcd_seg
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


module bcd_seg(
input logic [1:0] select,
input logic [6:0] seg7Disp0, seg7Disp1,seg7Disp2,
output logic  [6:0] seg7out
);

//  display the numbers based on the input 
always_comb 
begin
    case (select)
        0   :   seg7out = seg7Disp0;   //Display 0 (seconds, one's place)
        1   :   seg7out = seg7Disp1;   //Display 1 (seconds, ten's place)
        2   :   seg7out = seg7Disp2;   //Display 2 (seconds, hundrens's place)
        
    endcase
end
endmodule
