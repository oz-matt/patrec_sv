`ifndef PLIB_SV
`define PLIB_SV

import axil_if_c::*;

task setbus(input logic clk, logic[7:0] data, virtual axilite_int#(1,32,8) bus);
	repeat(5) @(posedge clk);
	placebyte(std::randomize(data));
	repeat(5) @(posedge clk);
	placebyte(std::randomize(data));
	axil::setavalid(bus);
	repeat(5) @(posedge clk);
	placebyte(std::randomize(data));
endtask
	
	
function void placebyte(bit[7:0] nbyte);
	$display("sent %b at %t", nbyte, $time());
endfunction
	
`endif