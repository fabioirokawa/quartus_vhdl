LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.std_logic_unsigned.all;
use ieee.numeric_std.all;

ENTITY CPU IS
PORT (
	Clock : IN BIT
	
	);
END CPU;


ARCHITECTURE CPU_ARCH OF CPU IS


	COMPONENT registrador
	port(
		clock : IN BIT;
		enable : IN BIT;
		data_write : IN BIT_VECTOR(31 DOWNTO 0);
		data_read : OUT BIT_VECTOR(31 DOWNTO 0)
	);
	END COMPONENT;

	COMPONENT data_mem
		port(	
		clock				:in bit;
		reg_write_in 	:in bit;
		mem_write		:in bit;
		zero_result		:in bit;
		branch_bit		:in bit;
		pc_addr_in		:in bit_vector(31 downto 0);
		alu_result_in	:in bit_vector(31 downto 0);
		data_write		:in bit_vector(31 downto 0);
		reg_addr_in		:in bit_vector(31 downto 0);
		
		
		reg_write_out 	:out bit;
		branch_out		:out bit;
		reg_addr_out	:out bit_vector(31 downto 0);
		pc_addr_out		:out bit_vector(31 downto 0);
		readed_mem_data:out bit_vector(31 downto 0);
		alu_result_out	:out bit_vector(31 downto 0)
	);
	END COMPONENT;
	
	COMPONENT ula
		PORT(
			src1: in unsigned  (31 downto 0);
			src2: in unsigned  (31 downto 0);
			op: in bit_vector(4 downto 0);
		
			result: out unsigned (31 downto 0);
			zero_result: out bit		
	);
	END COMPONENT;
	
	COMPONENT write_back
	PORT(
		clock				:	IN BIT;
		mem_to_reg		:	IN BIT;
		reg_write_in	:	IN BIT;
		reg_write_out	:	OUT BIT;
	
		data_memory		:	IN BIT_VECTOR(31 DOWNTO 0);
		data_register	:	IN BIT_VECTOR(31 DOWNTO 0);
		data_out			:	OUT BIT_VECTOR(31 DOWNTO 0);
	
		addr_in			:	IN BIT_VECTOR(31 DOWNTO 0);
		addr_out			:	OUt BIT_VECTOR(31 DOWNTO 0)
	
		);
	END COMPONENT;
	
	COMPONENT banco_registradores
		PORT(
			clock							:	IN BIT;
			read_register1_addr 		:	IN BIT_VECTOR(4 DOWNTO 0);
			read_register2_addr 		:	IN BIT_VECTOR(4 DOWNTO 0);
			write_data 					:	IN BIT_VECTOR(31 DOWNTO 0);
			write_addr 					:	IN BIT_VECTOR(4 DOWNTO 0);
			write_enable 				:	IN BIT;
		
			read_register1_data 		:	OUT BIT_VECTOR(31 DOWNTO 0);
			read_register2_data 		:	OUT BIT_VECTOR(31 DOWNTO 0)
		);
	END COMPONENT;
	
	COMPONENT control
		PORT(
			clock				: IN BIT;

			opcode_in 		: IN BIT_VECTOR(6 DOWNTO 0);
			funct3_in 		: IN BIT_VECTOR(2 DOWNTO 0);
			funct7_in 		: IN BIT_VECTOR(6 DOWNTO 0);
	
			write_back 		: OUT BIT;
			alu_src	  		: OUT BIT;
			mem_read			: OUT BIT;
			mem_write		: OUT BIT;
			branch			: OUT BIT;
			mem_to_reg		: OUT BIT;
			alu_op	  		: OUT BIT_VECTOR(4 DOWNTO 0)
		);
	END COMPONENT;
	
	
	
	COMPONENT rom
		PORT ( 
			address 		: IN BIT_VECTOR(3 DOWNTO 0);
         data 			: OUT BIT_VECTOR(31 DOWNTO 0) 
		);
	END COMPONENT;
			
			
			
			
	COMPONENT decoder
		PORT(
			clock: IN BIT;
	
			instruction 			: IN BIT_VECTOR(31 DOWNTO 0);
			intruction_addr_in 	: IN BIT_VECTOR(31 DOWNTO 0);
			intruction_addr_out 	: OUT BIT_VECTOR(31 DOWNTO 0);
	
			imediate_value			: OUT BIT_VECTOR(19 DOWNTO 0);
			rd_addr 					: OUT BIT_VECTOR(4 DOWNTO 0);
			rs1_addr 				: OUT BIT_VECTOR(4 DOWNTO 0);
			rs2_addr	 				: OUT BIT_VECTOR(4 DOWNTO 0);
	
			opcode_out 				: OUT BIT_VECTOR(6 DOWNTO 0);
			funct3_out 				: OUT BIT_VECTOR(2 DOWNTO 0);
			funct7_out 				: OUT BIT_VECTOR(6 DOWNTO 0)
		);
	END COMPONENT;	
		
	COMPONENT executor
		PORT(
			clock					: 	IN BIT;
		
			wb_reg_write_in	:  IN BIT;
			wb_mem_to_reg_in	: 	IN BIT;
		
			mem_read_in			:  IN BIT;
			mem_write_in		: 	IN BIT;
			branch_op_in		: 	IN BIT;
		
			alu_src				:  IN BIT;
			alu_op				:  IN BIT_VECTOR(4 DOWNTO 0);
		
			pc_in 				: 	IN BIT_VECTOR(31 DOWNTO 0);
			data1 				: 	IN BIT_VECTOR(31 DOWNTO 0);
			data2 				: 	IN BIT_VECTOR(31 DOWNTO 0);
			imediate				: 	IN BIT_VECTOR(31 DOWNTO 0);
			dest_register_in	: 	IN BIT_VECTOR(4 DOWNTO 0);
		
		
			wb_reg_write_out	:  OUT BIT;
			wb_mem_to_reg_out	: 	OUT BIT;
		
			mem_read_out		:  OUT BIT;
			mem_write_out		: 	OUT BIT;
			branch_op_out		: 	OUT BIT;
			branch_result		: 	OUT BIT_VECTOR(31 DOWNTO 0);
			dest_register		: 	OUT BIT_VECTOR(4 DOWNTO 0);
			result_out			:	OUT BIT_VECTOR(31 DOWNTO 0);
			zero_result			: 	OUT BIT
	);
	END COMPONENT;
	
	COMPONENT mux2X1
		PORT (
			control		: IN BIT;
			first_port 	: IN BIT_VECTOR (31 DOWNTO 0);
			Second_port : IN BIT_VECTOR (31 DOWNTO 0);
			out_port 	: OUT BIT_VECTOR (31 DOWNTO 0)
		);
	END COMPONENT;
		
		--MEMORIA
		SIGNAL data_mem_out			: 	BIT_VECTOR(8 DOWNTO 0);
		SIGNAL rom_instruction_out 		: 	BIT_VECTOR (31 DOWNTO 0);
		
		-- UNIDADE DE CONTROLE
		SIGNAL write_back_out 		: BIT;
		SIGNAL alu_src	  		: BIT;
		SIGNAL mem_read		: BIT;
		SIGNAL mem_write		: BIT;
		SIGNAL branch			: BIT;
		SIGNAL mem_to_reg		: BIT;
		SIGNAL alu_op	  		: BIT_VECTOR(4 DOWNTO 0);
		
		
		-- EXECUTOR
		SIGNAL exec_wb_reg_write_out	:  BIT;
		SIGNAL exec_wb_mem_to_reg_out	: 	BIT;
		
		SIGNAL exec_mem_read_out		:  BIT;
		SIGNAL exec_mem_write_out		: 	BIT;
		SIGNAL exec_branch_op_out		: 	BIT;
		SIGNAL exec_branch_result		: 	BIT_VECTOR(31 DOWNTO 0);
		SIGNAL exec_dest_register		: 	BIT_VECTOR(4 DOWNTO 0);
		SIGNAL exec_result_out			:	BIT_VECTOR(31 DOWNTO 0);
		SIGNAL exec_zero_result			: 	BIT;
		
		-- MUX
		SIGNAL out_mux	: BIT_VECTOR (31 DOWNTO 0);
			
		-- DECODER
		SIGNAL intruction_addr_out 	: BIT_VECTOR(31 DOWNTO 0);
	
		SIGNAL imediate_value			: BIT_VECTOR(19 DOWNTO 0);
		SIGNAL rd_addr 					: BIT_VECTOR(4 DOWNTO 0);
		SIGNAL rs1_addr 				: BIT_VECTOR(4 DOWNTO 0);
		SIGNAL rs2_addr	 				: BIT_VECTOR(4 DOWNTO 0);
	
		SIGNAL opcode_out 				: BIT_VECTOR(6 DOWNTO 0);
		SIGNAL funct3_out 				: BIT_VECTOR(2 DOWNTO 0);
		SIGNAL funct7_out 				: BIT_VECTOR(6 DOWNTO 0);
		
		-- BANCO REGISTRADORES
		SIGNAL read_register1_data 		:	BIT_VECTOR(31 DOWNTO 0);
		SIGNAL read_register2_data 		:	BIT_VECTOR(31 DOWNTO 0);
		
		-- ULA
		
		SIGNAL result		:	UNSIGNED (31 DOWNTO 0);
		SIGNAL zero_result	:	BIT;
		
		-- WRITE BACK
		
		SIGNAL reg_write_out	:	BIT;
		SIGNAL data_out			:	BIT_VECTOR(31 DOWNTO 0);
		SIGNAL addr_out			:	BIT_VECTOR(31 DOWNTO 0);
		
		-- REGISTRADOR PC
		SIGNAL pc_in : unsigned (31 DOWNTO 0):="00000000000000000000000000000000";
		SIGNAL pc_convertido : BIT_VECTOR (31 DOWNTO 0);
		
	BEGIN
	
		pc_convertido <= to_bitvector(std_logic_vector(pc_in));

		rom_instructions : rom port map(pc_convertido,rom_instruction_out);
		
		mux_pc : mux2x1 port map(exec_branch_op_out,pc_convertido,exec_branch_result,pc_in);
		
 process(clock)
	begin
			
			if (clock = '1') then
				pc_in <= pc_in + 1;
			
			
		
			end if;
	end process;
	
	
	
	
	
	END CPU_ARCH;
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	