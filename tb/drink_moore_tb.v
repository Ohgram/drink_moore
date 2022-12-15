`timescale 1ps/1ps
module drink_moore_tb ();
    reg reset=1'b1,clk=1'b0;
    reg half,one;
    wire out,cout;
    always #5 clk=~clk;
    initial begin
           half =1'b0;
           one  =1'b0;
        #2 reset=1'b0;//error1: negedge reset to reset
        #2 reset=1'b1;
        #6 half =1'b1;//tast all half input
        #150
           half =1'b0;
           one  =1'b1;//tast all one input
        #90
           half =1'b1;//-------------------
           one  =1'b0;
        #10
           half =1'b0;
           one  =1'b1;
        #10
           half =1'b1;
           one  =1'b0;
        #10
           half =1'b0;
           one  =1'b1;//tast half and one input in turn
        #11   
        $finish;
    end

    initial begin
        //test all half input
        #60 if (out==1||cout==0) begin
            $display("%t first half right",$time);
        end else begin
            $display("%t first half error out=%b cout=%b",$time,out,cout);
        end
        #50 if (out==1||cout==0) begin
            $display("%t second half right",$time);
        end else begin
            $display("%t second half error out=%b cout=%b",$time,out,cout);
        end
        #50 if (out==1||cout==0) begin
            $display("%t third half right",$time);
            $display("%t all half right",$time);
        end else begin
            $display("%t third half error out=%b cout=%b",$time,out,cout);
        end
        //test all one input
        #30 if (out==1||cout==1) begin
            $display("%t first one right",$time);
        end else begin
            $display("%t first one error out=%b cout=%b",$time,out,cout);
        end
        #30 if (out==1||cout==1) begin
            $display("%t second one right",$time);
        end else begin
            $display("%t second one error out=%b cout=%b",$time,out,cout);
        end
        #30 if (out==1||cout==1) begin
            $display("%t third one right",$time);
            $display("%t all one right",$time);
        end else begin
            $display("%t third one error out=%b cout=%b",$time,out,cout);
        end
        //test one and half in turn
        #30 if (out==1||cout==0) begin
            $display("%t one and half in turn is right",$time);
        end else begin
            $display("%t one and half in turn is error out=%b cout=%b",$time,out,cout);
        end
    end

    initial begin
        $vcdpluson;
    end

    drink_moore u1(
        .half(half),
        .one(one),
        .clk(clk),
        .reset(reset),
        .out(out),
        .cout(cout)
    );
    
endmodule