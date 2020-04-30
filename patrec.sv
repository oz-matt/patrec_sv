module patrec(axilite_int.slave io);
	
	typedef enum integer {
		IDLE,
		PASS1,
		PASS2,
		PASS3
	} pstate_t;
	
	logic[7:0] ldata;
	
	pstate_t pstate =IDLE;
	pstate_t pstate_next = IDLE;
	
	
	always_ff @ (posedge io.AXI_ACLK or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN)
			io.AXI_ARREADY <= 0;
		else if (io.AXI_ARVALID)
			io.AXI_ARREADY <= 1;
		else
			io.AXI_ARREADY <= 0;
	end
	
	always_ff @ (posedge io.AXI_ACLK or negedge io.AXI_ARESETN) begin
		if (!io.AXI_ARESETN)
			io.AXI_RVALID <= 0;
		else if (io.AXI_ARVALID && io.AXI_ARREADY)
			io.AXI_RVALID <= 1;
		else
			io.AXI_RVALID <= 0;
	end
	
		
	
endmodule