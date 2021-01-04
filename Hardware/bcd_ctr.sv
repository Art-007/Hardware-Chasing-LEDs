`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 09/25/2020 09:57:15 PM
// Design Name: 
// Module Name: bcd_ctr
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


module bcd_ctr(
input logic [7:0] Bit8In,
output logic [6:0] Out7Seg_upper, Out7Seg_lower, Out7Seg_middle
);

//  BCD to seven segment for the first three digits 
always_comb
    begin
    case (Bit8In/100) // hundrends 
      0  : Out7Seg_upper = 7'b1000000;         //0
      1  : Out7Seg_upper = 7'b1111001;         //1
      2  : Out7Seg_upper = 7'b0100100;         //2
      3  : Out7Seg_upper = 7'b0110000;         //3
      4  : Out7Seg_upper = 7'b0011001;         //4
      5  : Out7Seg_upper = 7'b0010010;         //5
      6  : Out7Seg_upper = 7'b0000010;         //6
      7  : Out7Seg_upper = 7'b1111000;         //7
      8  : Out7Seg_upper = 7'b0000000;         //8
      9  : Out7Seg_upper = 7'b0010000;         //9
    endcase

case ((Bit8In/10)%10) // tens 
      0  : Out7Seg_middle = 7'b1000000;         //0
      1  : Out7Seg_middle = 7'b1111001;         //1
      2  : Out7Seg_middle = 7'b0100100;         //2
      3  : Out7Seg_middle = 7'b0110000;         //3
      4  : Out7Seg_middle = 7'b0011001;         //4
      5  : Out7Seg_middle = 7'b0010010;         //5
      6  : Out7Seg_middle = 7'b0000010;         //6
      7  : Out7Seg_middle = 7'b1111000;         //7
      8  : Out7Seg_middle = 7'b0000000;         //8
      9  : Out7Seg_middle = 7'b0010000;         //9
    endcase
    
    case (Bit8In%10) // ones
      0  : Out7Seg_lower = 7'b1000000;         //0
      1  : Out7Seg_lower = 7'b1111001;         //1
      2  : Out7Seg_lower = 7'b0100100;         //2
      3  : Out7Seg_lower = 7'b0110000;         //3
      4  : Out7Seg_lower = 7'b0011001;         //4
      5  : Out7Seg_lower = 7'b0010010;         //5
      6  : Out7Seg_lower = 7'b0000010;         //6
      7  : Out7Seg_lower = 7'b1111000;         //7
      8  : Out7Seg_lower = 7'b0000000;         //8
      9  : Out7Seg_lower = 7'b0010000;         //9
    endcase
    
    end
endmodule
