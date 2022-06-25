entity sign_extensor is

	port(
		in_data		: IN  BIT_VECTOR (11 DOWNTO 0);
		out_data		:OUT BIT_VECTOR (31 DOWNTO 0)
	);

end entity;

architecture sign_extensor_arch of sign_extensor is

	signal one 		: BIT_VECTOR(19 DOWNTO 0);
	signal zero 	: BIT_VECTOR(19 DOWNTO 0);

begin

	one <= "11111111111111111111";
	zero<= "00000000000000000000";
	
	with in_data(11) select 
		out_data <= zero & in_data when '0',
						one  & in_data when '1';
	
	

end architecture;