`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2020 09:52:00 PM
// Design Name: 
// Module Name: clock_div
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


module clock_div(
input logic clk,
output logic divider_clk
    );
    

logic [26:0]counter;

always_ff@(posedge clk)
begin
// a slow clock to see the anodes 
     counter <= counter +1;
    if (counter % 90_000 == 0)
      begin
         divider_clk <= ~divider_clk; 
      end 
end
endmodule

