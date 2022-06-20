ENTITY write_back IS
	PORT(
	clock: in bit;
	
	mem_to_reg: in bit;
	reg_write_in: in bit;
	reg_write_out: out bit;
	
	data_memory:  in bit_vector(31 downto 0);
	data_register: in bit_vector(31 downto 0);
	data_out: out bit_vector(31 downto 0);
	
	addr_in: in bit_vector(31 downto 0);
	addr_out: out bit_vector(31 downto 0)
	
	);
	
END ENTITY;

architecture write_back_arch of write_back is

	signal mem_to_reg_signal: bit;
	
	signal data_memory_signal: bit_vector(31 downto 0);
	signal data_register_signal: bit_vector(31 downto 0);

	component mux2x1
		port(
		control: in bit;
		first_port : IN bit_vector (31 DOWNTO 0);
		Second_port : IN bit_vector (31 DOWNTO 0);
		
		out_port : OUT bit_vector (31 DOWNTO 0)
		);
	end component;

begin
	
	process(clock)
	begin
		reg_write_out <= reg_write_in;
		addr_out <= addr_in;
		mem_to_reg_signal <= mem_to_reg;
	end process;
	
	data_src: mux2x1 port map(mem_to_reg_signal, data_memory_signal, data_register_signal, data_out);
	
	


end architecture;