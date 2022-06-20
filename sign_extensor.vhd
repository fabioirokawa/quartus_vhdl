entity sign_extensor is

	port(
		in_data: in  bit_vector (15 downto 0);
		out_data:out bit_vector (31 downto 0)
	);

end entity;

architecture sign_extensor_arch of sign_extensor is

	signal one :  bit_vector(15 downto 0);
	signal zero : bit_vector(15 downto 0);

begin

	one <= "1111111111111111";
	zero<= "0000000000000000";
	
	with in_data(15) select 
		out_data <= zero & in_data when '0',
						one  & in_data when '1';
	
	

end architecture;