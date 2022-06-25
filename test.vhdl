library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity test is
end test;

architecture tb of test is
    signal a, b : std_logic;
    signal sum, carry : std_logic;


    file input_buf : text;
begin
    -- connecting testbench signals with half_adder.vhd
    UUT : entity work.executor port map (a => a, b => b, sum => sum, carry => carry);

    tb1 : process
    variable read_col_from_input_buf : line;
    variable b : integer := 40;
    begin
        file_open(input_buf, "C:/Users/fabio/Desktop/git_vhdl/quartus_vhdl/binario.txt", read_mode); 
        readline(input_buf, read_col_from_input_buf);
        --while not endfile(input_buf) loop

        --a <= '1';  -- assign value to a
        --end loop;
        wait for 1000 ns;
        file_close(input_buf);             
        wait;
    end process;
end tb;
