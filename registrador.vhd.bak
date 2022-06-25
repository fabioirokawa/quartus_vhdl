entity registrador is
	port(
		clock : in bit;
		enable : in bit;
		data_write : in bit_vector(31 downto 0);
		data_read : out bit_vector(31 downto 0)
	);
end entity;

architecture registrador_arch of registrador is
begin
	process(clock)
	begin
		if(enable = '1' and clock = '1') then
			data_read <= data_write;
		end if;
	end process;
end architecture;