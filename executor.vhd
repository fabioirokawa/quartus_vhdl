library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity executor is
	port(
		clock: IN BIT;
		
		wb_reg_write_in:  IN BIT;
		wb_mem_to_reg_in: IN BIT;
		
		mem_write_in: IN BIT;
		branch_op_in: IN BIT;
		
		alu_src:  IN BIT;
		alu_op:  IN BIT_VECTOR(4 DOWNTO 0);
		
		pc_in : IN BIT_VECTOR(31 DOWNTO 0);
		data1 : IN BIT_VECTOR(31 DOWNTO 0);
		data2 : IN BIT_VECTOR(31 DOWNTO 0);
		imediate: IN BIT_VECTOR(31 DOWNTO 0);
		dest_register_in: IN BIT_VECTOR(4 DOWNTO 0);
		
		
		wb_reg_write_out:  OUT BIT;
		wb_mem_to_reg_out: OUT BIT;
		
		mem_write_out: OUT BIT;
		branch_op_out: OUT BIT;
		branch_result: 	OUT BIT_VECTOR(31 DOWNTO 0);
		dest_register: OUT BIT_VECTOR(4 DOWNTO 0);
		result_out:		OUT BIT_VECTOR(31 DOWNTO 0);
		imediate_out: out BIT_VECTOR(31 DOWNTO 0);
		zero_result: 	OUT BIT
		
	);
end entity;

architecture executor_arch of executor is
	
	component ula
		port(
		src1: IN unsigned  (31 DOWNTO 0);
		src2: IN unsigned  (31 DOWNTO 0);
		op: IN BIT_VECTOR(4 DOWNTO 0);
		
		result: OUT unsigned (31 DOWNTO 0);
		zero_result: OUT BIT		
		);
	end component;
	
	component mux2x1
		port(
		control: IN BIT;
		first_port : IN BIT_VECTOR (31 DOWNTO 0);
		Second_port : IN BIT_VECTOR (31 DOWNTO 0);
		
		out_port : OUT BIT_VECTOR (31 DOWNTO 0)
		);
	end component;
	
	
	signal result: unsigned (31 DOWNTO 0);
	signal data2_src: BIT_VECTOR (31 DOWNTO 0);
	signal data1_to_unsigned: unsigned(31 DOWNTO 0);
	signal data2_to_unsigned: unsigned(31 DOWNTO 0);
	signal immediate_to_unsigned: unsigned(31 DOWNTO 0);
	signal pc_unsigned: unsigned(31 DOWNTO 0);
	signal branch_unsigned: unsigned(31 DOWNTO 0):="00000000000000000000000000000000";
	
begin
	imediate_out <= imediate;

	data1_to_unsigned <= unsigned(to_stdlogicvector(data1));
	data2_to_unsigned <= unsigned(to_stdlogicvector(data2_src));
	immediate_to_unsigned <= unsigned(to_stdlogicvector(imediate));
	pc_unsigned <= unsigned(to_stdlogicvector(pc_in));

	process(clock)
	begin
		wb_reg_write_out <= wb_reg_write_in;
		wb_mem_to_reg_out <= wb_mem_to_reg_in;
			
		mem_write_out <= mem_write_in;
		branch_op_out <= branch_op_in;
	end process;
	
	ula_src_mux: mux2x1 port map(alu_src, data2, imediate, data2_src);
	ula_component: ula port map(data1_to_unsigned, data2_to_unsigned, alu_op, result, zero_result);
	
	result_out <=  to_bitvector(std_logic_vector(result));
	branch_unsigned <= pc_unsigned + immediate_to_unsigned;
	branch_result <=  to_bitvector(std_logic_vector(branch_unsigned));

end architecture;