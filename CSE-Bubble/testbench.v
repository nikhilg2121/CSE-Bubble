`include "processor.v"

module testing;

reg clk;

always @* begin
    #2;
    clk <= ~clk;
end

processor p(clk);

initial begin
    $dumpfile("processor.vcd");
    $dumpvars(1, testing);

    clk <= 0;

    #500;
    $finish;
end 


endmodule