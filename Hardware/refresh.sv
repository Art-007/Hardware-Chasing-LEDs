`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2020 09:53:28 PM
// Design Name: 
// Module Name: refresh
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


module refresh(
input logic clk,
output logic [1:0] twobitout
); 

// two bit binary counter 
always_ff@(posedge clk)
begin 
    if (twobitout==2)
        twobitout <=0;
    else
        twobitout <= twobitout + 1; 
end

endmodule
