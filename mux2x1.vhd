ENTITY mux2x1 IS
	PORT (
		control: in bit;
		first_port : IN BIT_VECTOR (31 DOWNTO 0);
		Second_port : IN BIT_VECTOR (31 DOWNTO 0);
		
		out_port : OUT BIT_VECTOR (31 DOWNTO 0)
	);
END ENTITY;

ARCHITECTURE mux2x1_arch OF mux2x1 IS
BEGIN
	WITH control SELECT
		out_port	<=	first_port WHEN '0',
						Second_port WHEN '1';
END ARCHITECTURE;