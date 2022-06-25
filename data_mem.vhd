library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity data_mem is
	port(	
		clock				:in bit;
		reg_write_in 	:in bit;
		mem_write		:in bit;
		zero_result		:in bit;
		branch_bit		:in bit;
		pc_addr_in		:in bit_vector(31 downto 0);
		alu_result_in	:in bit_vector(31 downto 0);
		data_write		:in bit_vector(31 downto 0);
		reg_addr_in		:in bit_vector(4 downto 0);
		
		
		reg_write_out 	:out bit;
		branch_out		:out bit;
		reg_addr_out	:out bit_vector(4 downto 0);
		pc_addr_out		:out bit_vector(31 downto 0);
		readed_mem_data:out bit_vector(31 downto 0);
		alu_result_out	:out bit_vector(31 downto 0)
	);
	
end data_mem;

architecture data_mem_arch of data_mem is
	
	signal addr_in_convertion 	: unsigned(7 downto 0);
	signal data_in_convertion 	: unsigned(7 downto 0);
	signal data_readed			: unsigned(7 downto 0);
	
	component memory
		port(
			clock: 			in bit;
			write_signal: 	in bit;
			addr: 			in unsigned(12 downto 0);
			data_in: 		in unsigned(7 downto 0);
		 
			data_out: 		out unsigned(7 downto 0)
		);
	end component;
	
begin
		addr_in_convertion <= unsigned(to_stdlogicvector(alu_result_in));
		data_in_convertion <= unsigned(to_stdlogicvector(data_write));
			
		ram_memory: memory port map(clock, mem_write, addr_in_convertion, data_in_convertion, data_readed);
			
		readed_mem_data <= to_bitvector(std_logic_vector(data_readed));
		
		process(clock)
		begin
			if(clock = '1') then
				branch_out <= zero_result and branch_bit;
			end if;
		end process;

end architecture;