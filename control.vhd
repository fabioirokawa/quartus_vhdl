library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY control IS
PORT(
	clock: IN BIT;

	opcode_in 	: in BIT_VECTOR(6 DOWNTO 0);
	funct3_in 	: in BIT_VECTOR(2 DOWNTO 0);
	funct7_in 	: in BIT_VECTOR(6 DOWNTO 0);
	
	write_back 	: out bit;
	alu_src	  	: out bit;
	mem_read	: out bit;
	mem_write	: out bit;
	branch		: out bit;
	mem_to_reg	: out bit;
	alu_op	  	: out BIT_VECTOR(4 DOWNTO 0)
);

END ENTITY;

ARCHITECTURE control_arch OF control IS
	
BEGIN
	PROCESS (clock)
	BEGIN
		case opcode_in is
			when "1100011" => --BEQ ou BNE
				if (funct3_in = "000") then --BEQ
					write_back	<=	 	'0';
					alu_src	  	<=		'0';
					mem_read	<=			'0';
					mem_write	<=		'0';
					branch		<=		'1';
					mem_to_reg	<=		'0';
					alu_op	  	<=		"00110";	--XOR
					
				else 						--BNE
					write_back	<=	 	'0';
					alu_src	  	<=		'0';
					mem_read	<=			'0';
					mem_write	<=		'0';
					branch		<=		'1';
					mem_to_reg	<=		'0';
					alu_op	  	<=		"00000";
					
				end if;

			when "0010011" => --ADDI
					write_back	<=	 	'1';
					alu_src	  	<=		'1';
					mem_read	<=			'0';
					mem_write	<=		'0';
					branch		<=		'0';
					mem_to_reg	<=		'1';
					alu_op	  	<=		"00000";

			when "0010011" => --ADD
					write_back	<=	 	'1';
					alu_src	  	<=		'0';
					mem_read	<=			'0';
					mem_write	<=		'0';
					branch		<=		'0';
					mem_to_reg	<=		'1';
					alu_op	  	<=		"00000";

			when others => alu_op <= "00000";
		end case;
	END PROCESS;
END control_arch;