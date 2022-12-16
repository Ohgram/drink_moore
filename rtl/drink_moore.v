module drink_moore (
    input  one,
           half,
           clk,
           reset,
    output cout,
           out
);

    parameter s0 =3'b000,
                   s1 =3'b001,
                   s2 =3'b010,
                   s3 =3'b011,
                   s4 =3'b100,
                   s5 =3'b101,
                   s6 =3'b110;

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