module drink_moore (
    input  one,
           half,
           clk,
           reset,
    output cout,
           out
);

    localparam   s0 =000,
                s1 =001,
                s2 =010,
                s3 =011,
                s4 =100,
                s5 =101,
                s6 =110;

    reg [2:0]state;
    reg [2:0]next_state;

always @(posedge clk or negedge reset) begin
    if (!reset) begin
        state<=s0;
    end else begin
        state<=next_state;
    end
end

always @(*) begin
    case(state)
        s0:if(half)
            next_state<=s1;
           else if(one)
            next_state<=s2;
                else
            next_state<=s0;
        s1:if(half)
            next_state<=s2;
            else if(one)
            next_state<=s3;
            else
            next_state<=s1;
        s2:if(half)
            next_state<=s3;
            else if(one)
            next_state<=s4;
            else 
            next_state<=s2;
        s3:if(half)
            next_state<=s4;
            else if(one)
            next_state<=s5;
            else 
            next_state<=s3;
        s4:if(half)
            next_state<=s5;
            else if(one)
            next_state<=s6;
            else
            next_state<=s4;
        s5:if(half)
            next_state<=s1;
            else if(one)
            next_state<=s2;
            else
            next_state<=s0;
        s6:if(half)
            next_state<=s1;
            else if(one)
            next_state<=s2;
            else
            next_state<=s0;
        /*s5:next_state<=s0;
        s6:next_state<=s0;*/  
    default:next_state<=s0;
    endcase
end
assign out=((state==s5)||(state==s6));
assign cout=(state==s6);
endmodule