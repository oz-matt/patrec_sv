package axil_if_c;
	
	class axil;
		
		protected function new();
		endfunction
		
		static int tim = 5;
		
		static function void setavalid(virtual interface axilite_int#(1, 32, 8) bus);
			bus.AXI_ARVALID <= 1;
		endfunction
		
		
	endclass	
endpackage