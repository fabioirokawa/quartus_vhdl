library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity executor is
	port(
		clock: in bit;
		
		wb_reg_write_in:  in bit;
		wb_mem_to_reg_in: in bit;
		
		mem_read_in:  in bit;
		mem_write_in: in bit;
		branch_op_in: in bit;
		
		alu_src:  in bit;
		alu_op:  in bit_vector(4 DOWNTO 0);
		
		pc_in : in bit_vector(31 downto 0);
		data1 : in bit_vector(31 downto 0);
		data2 : in bit_vector(31 downto 0);
		imediate: in BIT_VECTOR(31 DOWNTO 0);
		dest_register_in: in bit_vector(4 DOWNTO 0);
		
		
		wb_reg_write_out:  out bit;
		wb_mem_to_reg_out: out bit;
		
		mem_read_out:  out bit;
		mem_write_out: out bit;
		branch_op_out: out bit;
		branch_result: 	out bit_vector(31 downto 0);
		dest_register: out bit_vector(4 DOWNTO 0);
		result_out:		out bit_vector(31 downto 0);
		zero_result: 	out bit
		
	);
end entity;

architecture executor_arch of executor is

	component registrador
		port(
		clock : in bit;
		enable : in bit;
		data_write : in bit_vector(31 downto 0);
		data_read : out bit_vector(31 downto 0)
		);
	end component;
	
	component ula
		port(
		src1: in unsigned  (31 downto 0);
		src2: in unsigned  (31 downto 0);
		op: in bit_vector(4 downto 0);
		
		result: out unsigned (31 downto 0);
		zero_result: out bit		
		);
	end component;
	
	component mux2x1
		port(
		control: in bit;
		first_port : IN bit_vector (31 DOWNTO 0);
		Second_port : IN bit_vector (31 DOWNTO 0);
		
		out_port : OUT bit_vector (31 DOWNTO 0)
		);
	end component;
	
	
	signal result: unsigned (31 downto 0);
	signal data2_src: bit_vector (31 DOWNTO 0);
	signal data1_to_unsigned: unsigned(31 downto 0);
	signal data2_to_unsigned: unsigned(31 downto 0);
	signal immediate_to_unsigned: unsigned(31 downto 0);
	signal pc_unsigned: unsigned(31 downto 0);
	signal branch_unsigned: unsigned(31 downto 0);
	
begin
	data1_to_unsigned <= unsigned(to_stdlogicvector(data1));
	data2_to_unsigned <= unsigned(to_stdlogicvector(data2_src));
	immediate_to_unsigned <= unsigned(to_stdlogicvector(imediate));
	pc_unsigned <= unsigned(to_stdlogicvector(pc_in));

	process(clock)
	begin
		wb_reg_write_out <= wb_reg_write_in;
		wb_mem_to_reg_out <= wb_mem_to_reg_in;
			
		mem_read_out <= mem_read_in;
		mem_write_out <= mem_write_in;
		branch_op_out <= branch_op_in;
	end process;
	
	ula_src_mux: mux2x1 port map(alu_src, data2, imediate, data2_src);
	ula_component: ula port map(data1_to_unsigned, data2_to_unsigned, alu_op, result, zero_result);
	
	result_out <=  to_bitvector(std_logic_vector(result));
	branch_unsigned <= pc_unsigned + immediate_to_unsigned;
	branch_result <=  to_bitvector(std_logic_vector(branch_unsigned));

end architecture;