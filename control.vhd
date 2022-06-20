library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

ENTITY final IS
	PORT(	
	opcode: 	IN BIT_VECTOR(5 DOWNTO 0);
	
	ALUOp:		OUT BIT_VECTOR(4 DOWNTO 0);
    ALUSrc:		OUT BIT := '0';
    PCSrc:		OUT BIT := '0';
    Branch:		OUT BIT := '0';
    RegWrite:	OUT BIT := '0';
    MemWrite:	OUT BIT := '0';
    MemRead:	OUT BIT := '0';
    MemtoReg:	OUT BIT := '0');
	
END ENTITY final;

ARCHITECTURE control_arch OF final IS
	
BEGIN
	
	PROCESS (opcode)
	BEGIN
		case opcode is
			when "000000" => --ADD
				ALUOp		<=	"00000";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "000001" => --AND
				ALUOp		<=	"00001";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "000010" => --OR
				ALUOp		<=	"00010";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "000011" =>	--XOR
				ALUOp		<=	"00011";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "000100" =>	--SHFR
				ALUOp		<=	"00100";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "000101" =>	--SHFL
				ALUOp		<=	"00101";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "000110" =>	--ADDI
				ALUOp		<=	"00110";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "000111" =>	--BEQ
				ALUOp		<=	"00000";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "001000" =>	--BNE
				ALUOp		<=	"00000";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when "001001" =>	--JUMP
				ALUOp		<=	"00000";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

			when others =>
				ALUOp		<=	"11111";	
				ALUSrc		<=	'0';
				PCSrc		<=	'0';
				Branch		<=	'0';
				RegWrite	<=	'1';
				MemWrite	<=	'0';
				MemRead	<=	'0';
				MemtoReg	<= 	'1';

		end case;
	END PROCESS;
END control_arch;