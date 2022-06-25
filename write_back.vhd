ENTITY write_back IS
	PORT(
	clock: IN BIT;
	
	mem_to_reg: IN BIT;
	reg_write_in: IN BIT;
	reg_write_out: OUT BIT;
	
	data_memory:  IN BIT_VECTOR(31 DOWNTO 0);
	data_register: IN BIT_VECTOR(31 DOWNTO 0);
	data_out: OUT BIT_VECTOR(31 DOWNTO 0);
	
	addr_in: IN BIT_VECTOR(31 DOWNTO 0);
	addr_out: OUT BIT_VECTOR(31 DOWNTO 0)
	
	);
	
END ENTITY;

architecture write_back_arch of write_back is

	signal mem_to_reg_signal: BIT;
	
	signal data_memory_signal: BIT_VECTOR(31 DOWNTO 0);
	signal data_register_signal: BIT_VECTOR(31 DOWNTO 0);

	component mux2x1
		port(
		control: IN BIT;
		first_port : IN BIT_VECTOR (31 DOWNTO 0);
		Second_port : IN BIT_VECTOR (31 DOWNTO 0);
		
		out_port : OUT BIT_VECTOR (31 DOWNTO 0)
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