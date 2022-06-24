ENTITY instr_mem IS
    PORT ( address : IN BIT_VECTOR(3 DOWNTO 0);
         data : OUT BIT_VECTOR(7 DOWNTO 0) );
END ENTITY;
ARCHITECTURE behavioral OF instr_mem IS
    TYPE mem IS ARRAY ( 0 TO 2**4 - 1) OF BIT_VECTOR(31 DOWNTO 0);
    CONSTANT my_Rom : mem := (
                             0  => "00000000000000000000010110010011",
                             1  => "00000000101000000000010100010011",
                             2  => "00000000001001010000010100010011",
                             3  => "00000000000100000000000010010011",
                             4  => "00000000000100000000000100010011",
                             5  => "00000000001000000000000110010011",
                             6  => "00000000001000000000010110010011",
                             7  => "00000000000100010000000100110011",
                             8  => "00000000000101011000010110010011",
                             9  => "00000000001000000000101000110011",
                             10 => "00000000101001011000101001100011",
                             11 => "00000000000100010000000010110011",
                             12 => "00000000000101011000010110010011",
                             13 => "00000000000100000000101000110011",
                             14 => "11111110101001011001001011100011",
                             15 => "00000000000000000000000000000000");
BEGIN

 PROCESS (address)
    BEGIN
       CASE address IS
          WHEN "0000" => data <= my_rom(0);
          WHEN "0001" => data <= my_rom(1);
          WHEN "0010" => data <= my_rom(2);
          WHEN "0011" => data <= my_rom(3);
          WHEN "0100" => data <= my_rom(4);
          WHEN "0101" => data <= my_rom(5);
          WHEN "0110" => data <= my_rom(6);
          WHEN "0111" => data <= my_rom(7);
          WHEN "1000" => data <= my_rom(8);
          WHEN "1001" => data <= my_rom(9);
          WHEN "1010" => data <= my_rom(10);
          WHEN "1011" => data <= my_rom(11);
          WHEN "1100" => data <= my_rom(12);
          WHEN "1101" => data <= my_rom(13);
          WHEN "1110" => data <= my_rom(14);
          WHEN "1111" => data <= my_rom(15);
          WHEN others => data <= "00000000";
      END CASE;
   END PROCESS;
END ARCHITECTURE;