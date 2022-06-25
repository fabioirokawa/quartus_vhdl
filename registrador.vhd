entity registrador is
	port(
		clock : IN BIT;
		enable : IN BIT;
		data_write : IN BIT_VECTOR(31 DOWNTO 0);
		data_read : OUT BIT_VECTOR(31 DOWNTO 0)
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