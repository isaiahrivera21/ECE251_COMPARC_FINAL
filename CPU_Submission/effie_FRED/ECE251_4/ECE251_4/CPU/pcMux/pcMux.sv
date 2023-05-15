module pcMux
    #(parameter n = 32)(A,B,Sel,Y);

    input  logic    Sel;
    input  logic    [(n-1): 0] A, B;
    output logic    [(n-1): 0] Y;


    always@(*) //might need to be changed to pc_sel 
    begin
        if(Sel == 1'b0)
        begin
            Y = A;
        end
        else
        begin
            Y = B;
        end

    // assign Y = Sel ? A : B;
    end

endmodule
