ENTITY decoder IS
	PORT(
	clock: IN BIT;
	
	instruction : IN BIT_VECTOR(31 DOWNTO 0);
	intruction_addr_in : IN BIT_VECTOR(31 DOWNTO 0);
	intruction_addr_out : OUT BIT_VECTOR(31 DOWNTO 0);
	
	imediate_value: OUT BIT_VECTOR(19 DOWNTO 0);
	rd_addr : OUT BIT_VECTOR(4 DOWNTO 0);
	rs1_addr : OUT BIT_VECTOR(4 DOWNTO 0);
	rs2_addr : OUT BIT_VECTOR(4 DOWNTO 0);
	
	opcode_out : OUT BIT_VECTOR(6 DOWNTO 0);
	funct3_out : OUT BIT_VECTOR(2 DOWNTO 0);
	funct7_out : OUT BIT_VECTOR(6 DOWNTO 0)
	);
	
END ENTITY decoder;

ARCHITECTURE decoder_arch OF decoder IS
	SIGNAL opcode: BIT_VECTOR (6 DOWNTO 0);
	
	SIGNAL rd: BIT_VECTOR (4 DOWNTO 0);
	SIGNAL rs1: BIT_VECTOR (4 DOWNTO 0);
	SIGNAL rs2: BIT_VECTOR (4 DOWNTO 0);
	SIGNAL funct3: BIT_VECTOR (2 DOWNTO 0);	
	SIGNAL funct7: BIT_VECTOR (6 DOWNTO 0);
	SIGNAL imm_i: BIT_VECTOR (11 DOWNTO 0);
	SIGNAL imm_s: BIT_VECTOR (11 DOWNTO 0);
	SIGNAL imm_b: BIT_VECTOR (11 DOWNTO 0);
	SIGNAL imm_u: BIT_VECTOR (19 DOWNTO 0);
	SIGNAL imm_j: BIT_VECTOR (19 DOWNTO 0);
	
	
	
BEGIN
	intruction_addr_out <= intruction_addr_in;
	
	opcode <= instruction(6 DOWNTO 0);
	rd <= instruction(11 DOWNTO 7);
	rs1 <= instruction(19 DOWNTO 15);
	rs2 <= instruction(24 DOWNTO 20);
	funct3 <= instruction(14 DOWNTO 12);
	funct7 <= instruction(31 DOWNTO 25);
	imm_i <= instruction(31 DOWNTO 20);
	imm_s <= instruction(31 DOWNTO 25) & instruction(11 DOWNTO 7);
	imm_b <= instruction(31 DOWNTO 25) & instruction(11 DOWNTO 7);
	imm_u <= instruction(31 DOWNTO 12);
	imm_j <= instruction(31 DOWNTO 12);
	
	set_output: PROCESS (clock) IS
	BEGIN
		opcode_out <= opcode;
		
		if(clock = '1') then --Só sera acionado caso o clock mude de 0 para 1
			if(opcode = "0100111" or opcode = "0000011" or opcode = "0010011" or opcode = "1100111") then --Caso Instrucao tipo I
				rd_addr <= rd;
				rs1_addr <= rs1;
				imediate_value(11 downto 0) <= imm_i;
				funct3_out <= funct3;
				
			elsif (opcode = "0100011") then	--Caso Instrucao tipo S
				rs1_addr <= rs1;
				rs2_addr <= rs2;
				funct3_out <= funct3;
				imediate_value(11 downto 0) <= imm_s;
				
			elsif (opcode = "1100011") then	--Caso Instrucao tipo B
				rs1_addr <= rs1;
				rs2_addr <= rs2;
				funct3_out <= funct3;
				imediate_value(11 downto 0) <= imm_b;;
				
			elsif (opcode = "0110111" or opcode = "0010111") then	--Caso Instrucao tipo U
				rd_addr <= rd;
				imediate_value <= imm_u;
				
			elsif (opcode = "1101111") then	--Caso Instrucao tipo J
				rd_addr <= rd;
				imediate_value <= imm_j;

			elsif (opcode = "0110011") then	--Caso Instrucao tipo R
				rd_addr <= rd;
				rs1_addr <= rs1;
				rs2_addr <= rs2;
				funct3_out <= funct3;
				funct7_out <= funct7;
				
			end if;
		end if;
	END PROCESS;
			
END decoder_arch;