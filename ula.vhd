library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY ula IS
	PORT (
		src1: in unsigned  (31 downto 0);
		src2: in unsigned  (31 downto 0);
		op: in bit_vector(4 downto 0);
		
		result: out unsigned (31 downto 0);
		zero_result: out bit		
	);
END ENTITY;

ARCHITECTURE ula_arch OF ula IS
	signal result_op: unsigned (31 downto 0);
BEGIN

	result_op <=src1 + 		src2 when op = "00000" else
					src1 and 	src2 when op = "00001" else
					src1 or 		src2 when op = "00010" else
					src1 xor 	src2 when op = "00011" else
									
					shift_left(src1, to_integer(src2)) when op = "00100" else
					shift_right(src1, to_integer(src2)) when op = "00101";
		
	result 		<= result_op;
	zero_result <= '1' when result_op = 0 else '0';
	
	
	


	
END ARCHITECTURE;