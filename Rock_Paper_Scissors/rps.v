module rps_toplevel(A,B,score);
input [2:0] A,B;
output [2:0]score;
wire [5:0] decide;
assign decide={A,B};
//Structural Modeling
rps_Awins rpsa(A,B,score[1]);
rps_Bwins rpsb(A,B,score[0]);
endmodule
module rps_Awins (A, B, score);
input [2:0] A,B;//Rock-Paper-Scissors
output reg score;//AScore

wire [5:0] decide;
//concatenate A,B in decide
assign decide = {A,B};
//Behavioral Modeling
always @*
case(decide)
	//Cases for A to Win
	//A: Rock B: Scissors 
	6'b100100:
		score=1'b1;
	//A: Paper B: Rock
	6'b010100:
		score=1'b1;
	//A: Scissors B: Paper
	6'b001010:
		score=1'b1;
	default:
		score=1'b0;

endcase

endmodule

module rps_Bwins (A, B, score);
input [2:0] A,B;//Rock-Paper-Scissors
output score;//Score

wire [5:0] decide;
//concatenate A,B in decide
assign decide = {A,B};

//Data Flow Modeling
assign score=(!decide[5]&!decide[4]&decide[3]&decide[2]&!decide[1]&!decide[0])|
	(!decide[5]&decide[4]&!decide[3]&!decide[2]&!decide[1]&decide[0])|
	(decide[5]&!decide[4]&!decide[3]&!decide[2]&decide[1]&!decide[0]);
endmodule