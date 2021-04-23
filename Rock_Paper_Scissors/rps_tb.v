`timescale 1 ns/1 ns //timeunit = 10ns, precision = 1ns
module rps_tb();

	reg [2:0] A,B;
	wire [1:0] score;

	rps_toplevel UUT (A,B,score);
	initial
		begin
			//Cases for A to Win
			//A: Rock B: Scissors 
			#10 A = 3'b100;
			#10 B = 3'b001;
			#10 $monitor("A: Rock B: Scissors\n");
			#10 $monitor("t=%3d A=%b,B=%b,Score=%b \n",$time,A,B,score);
			
			//A: Paper B: Rock
			#10 A = 3'b010;
			#10 B = 3'b100;
			#10 $monitor("A: Paper B: Rock\n");
			#10 $monitor("t=%3d A=%b,B=%b,Score=%b \n",$time,A,B,score);
	
			//A: Scissors B: Paper
			#10 A = 3'b001;
			#10 B = 3'b010;
			#10 $monitor("A: Scissors B: Paper\n");
			#10 $monitor("t=%3d A=%b,B=%b,Score=%b \n",$time,A,B,score);

			//Cases for B to Win
			//B: Rock A: Scissors 
			#10 A = 3'b001;
			#10 B = 3'b100;
			#10 $monitor("B: Rock A: Scissors\n");
			#10 $monitor("t=%3d A=%b,B=%b,Score=%b \n",$time,A,B,score);

			//B: Paper A: Rock
			#10 A = 3'b100;
			#10 B = 3'b010;
			#10 $monitor("B: Paper A: Rock\n");
			#10 $monitor("t=%3d A=%b,B=%b,Score=%b \n",$time,A,B,score);

			//B: Scissors A: Paper
			#10 A = 3'b010;
			#10 B = 3'b001;
			#10 $monitor("B: Scissors A: Paper\n");
			#10 $monitor("t=%3d A=%b,B=%b,Score=%b \n",$time,A,B,score);
			//Remaining Cases
		end

endmodule