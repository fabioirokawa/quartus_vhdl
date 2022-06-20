entity banco_registradores is
	port(
		clock  : in bit;
		read_register1_addr : in bit_vector(4 downto 0);
		read_register2_addr : in bit_vector(4 downto 0);
		write_data : in bit_vector(31 downto 0);
		write_addr : in bit_vector(4 downto 0);
		write_enable : in bit;
		
		read_register1_data : out bit_vector(31 downto 0);
		read_register2_data : out bit_vector(31 downto 0)
	);
end entity;

architecture banco_registradores_arch of banco_registradores is

	component registrador
		port(
		clock : in bit;
		enable : in bit;
		data_write : in bit_vector(31 downto 0);
		data_read : out bit_vector(31 downto 0)
		);
	end component;
	
	signal addr_op: bit_vector(4 downto 0);
	signal not_addr_op: bit_vector(4 downto 0);
	
	signal register0_signal_read: bit_vector(31 downto 0);
	signal register1_signal_read: bit_vector(31 downto 0);
	signal register2_signal_read: bit_vector(31 downto 0);
	signal register3_signal_read: bit_vector(31 downto 0);
	signal register4_signal_read: bit_vector(31 downto 0);
	signal register5_signal_read: bit_vector(31 downto 0);
	signal register6_signal_read: bit_vector(31 downto 0);
	signal register7_signal_read: bit_vector(31 downto 0);
	signal register8_signal_read: bit_vector(31 downto 0);
	signal register9_signal_read: bit_vector(31 downto 0);
	signal register10_signal_read: bit_vector(31 downto 0);
	signal register11_signal_read: bit_vector(31 downto 0);
	signal register12_signal_read: bit_vector(31 downto 0);
	signal register13_signal_read: bit_vector(31 downto 0);
	signal register14_signal_read: bit_vector(31 downto 0);
	signal register15_signal_read: bit_vector(31 downto 0);
	signal register16_signal_read: bit_vector(31 downto 0);
	signal register17_signal_read: bit_vector(31 downto 0);
	signal register18_signal_read: bit_vector(31 downto 0);
	signal register19_signal_read: bit_vector(31 downto 0);
	signal register20_signal_read: bit_vector(31 downto 0);
	signal register21_signal_read: bit_vector(31 downto 0);
	signal register22_signal_read: bit_vector(31 downto 0);
	signal register23_signal_read: bit_vector(31 downto 0);
	signal register24_signal_read: bit_vector(31 downto 0);
	signal register25_signal_read: bit_vector(31 downto 0);
	signal register26_signal_read: bit_vector(31 downto 0);
	signal register27_signal_read: bit_vector(31 downto 0);
	signal register28_signal_read: bit_vector(31 downto 0);
	signal register29_signal_read: bit_vector(31 downto 0);
	signal register30_signal_read: bit_vector(31 downto 0);
	signal register31_signal_read: bit_vector(31 downto 0);
	
	signal register0_write_enable: bit;
	signal register1_write_enable: bit;
	signal register2_write_enable: bit;
	signal register3_write_enable: bit;
	signal register4_write_enable: bit;
	signal register5_write_enable: bit;
	signal register6_write_enable: bit;
	signal register7_write_enable: bit;
	signal register8_write_enable: bit;
	signal register9_write_enable: bit;
	signal register10_write_enable: bit;
	signal register11_write_enable: bit;
	signal register12_write_enable: bit;
	signal register13_write_enable: bit;
	signal register14_write_enable: bit;
	signal register15_write_enable: bit;
	signal register16_write_enable: bit;
	signal register17_write_enable: bit;
	signal register18_write_enable: bit;
	signal register19_write_enable: bit;
	signal register20_write_enable: bit;
	signal register21_write_enable: bit;
	signal register22_write_enable: bit;
	signal register23_write_enable: bit;
	signal register24_write_enable: bit;
	signal register25_write_enable: bit;
	signal register26_write_enable: bit;
	signal register27_write_enable: bit;
	signal register28_write_enable: bit;
	signal register29_write_enable: bit;
	signal register30_write_enable: bit;
	signal register31_write_enable: bit;
	
		
begin

	with read_register1_addr select 
		read_register1_data <= 
			register0_signal_read when "00000",
			register0_signal_read when "00001",
			register0_signal_read when "00010",
			register0_signal_read when "00011",
			register0_signal_read when "00100",
			register0_signal_read when "00101",
			register0_signal_read when "00110",
			register0_signal_read when "00111",
			register0_signal_read when "01000",
			register0_signal_read when "01001",
			register0_signal_read when "01010",
			register0_signal_read when "01011",
			register0_signal_read when "01100",
			register0_signal_read when "01101",
			register0_signal_read when "01110",
			register0_signal_read when "01111",
			register0_signal_read when "10000",
			register0_signal_read when "10001",
			register0_signal_read when "10010",
			register0_signal_read when "10011",
			register0_signal_read when "10100",
			register0_signal_read when "10101",
			register0_signal_read when "10110",
			register0_signal_read when "10111",
			register0_signal_read when "11000",
			register0_signal_read when "11001",
			register0_signal_read when "11010",
			register0_signal_read when "11011",
			register0_signal_read when "11100",
			register0_signal_read when "11101",
			register0_signal_read when "11110",
			register0_signal_read when "11111";
			
	with read_register2_addr select 
		read_register2_data <= 
			register0_signal_read when "00000",
			register0_signal_read when "00001",
			register0_signal_read when "00010",
			register0_signal_read when "00011",
			register0_signal_read when "00100",
			register0_signal_read when "00101",
			register0_signal_read when "00110",
			register0_signal_read when "00111",
			register0_signal_read when "01000",
			register0_signal_read when "01001",
			register0_signal_read when "01010",
			register0_signal_read when "01011",
			register0_signal_read when "01100",
			register0_signal_read when "01101",
			register0_signal_read when "01110",
			register0_signal_read when "01111",
			register0_signal_read when "10000",
			register0_signal_read when "10001",
			register0_signal_read when "10010",
			register0_signal_read when "10011",
			register0_signal_read when "10100",
			register0_signal_read when "10101",
			register0_signal_read when "10110",
			register0_signal_read when "10111",
			register0_signal_read when "11000",
			register0_signal_read when "11001",
			register0_signal_read when "11010",
			register0_signal_read when "11011",
			register0_signal_read when "11100",
			register0_signal_read when "11101",
			register0_signal_read when "11110",
			register0_signal_read when "11111";

	
	addr_op <= write_addr;
	not_addr_op <= not write_addr;
	
	 register0_write_enable <= (write_enable and not_addr_op(4) and not_addr_op(3)  	and not_addr_op(2) 	and not_addr_op(1)	and not_addr_op(0));
	 register1_write_enable <= (write_enable and not_addr_op(4) and not_addr_op(3)  	and not_addr_op(2) 	and not_addr_op(1) 	and addr_op(0)		);
	 register2_write_enable <= (write_enable and not_addr_op(4) and not_addr_op(3)  	and not_addr_op(2) 	and addr_op(1) 	   and not_addr_op(0));
	 register3_write_enable <= (write_enable and not_addr_op(4) and not_addr_op(3)  	and not_addr_op(2) 	and addr_op(1)     	and addr_op(0)		);
	 register4_write_enable <= (write_enable and not_addr_op(4) and not_addr_op(3)  	and addr_op(2)	 		and not_addr_op(1) 	and not_addr_op(0));
	 register5_write_enable <= (write_enable and not_addr_op(4) and not_addr_op(3)  	and addr_op(2)	 		and not_addr_op(1) 	and addr_op(0)		);
	 register6_write_enable <= (write_enable and not_addr_op(4) and not_addr_op(3)  	and addr_op(2)	 		and addr_op(1) 	   and not_addr_op(0));
	 register7_write_enable <= (write_enable and not_addr_op(4) and not_addr_op(3)  	and addr_op(2)	 		and addr_op(1)	   	and addr_op(0)		);
	 register8_write_enable <= (write_enable and not_addr_op(4) and addr_op(3)	   	and not_addr_op(2) 	and not_addr_op(1) 	and not_addr_op(0));
	 register9_write_enable <= (write_enable and not_addr_op(4) and addr_op(3)	   	and not_addr_op(2) 	and not_addr_op(1) 	and addr_op(0)		);
	register10_write_enable <= (write_enable and not_addr_op(4) and addr_op(3)	   	and not_addr_op(2) 	and addr_op(1) 	   and not_addr_op(0));
	register11_write_enable <= (write_enable and not_addr_op(4) and addr_op(3)	   	and not_addr_op(2) 	and addr_op(1)	   	and addr_op(0)		);
	register12_write_enable <= (write_enable and not_addr_op(4) and addr_op(3)	   	and addr_op(2)	 		and not_addr_op(1) 	and not_addr_op(0));
	register13_write_enable <= (write_enable and not_addr_op(4) and addr_op(3)	  	 	and addr_op(2)	 		and not_addr_op(1) 	and addr_op(0)		);
	register14_write_enable <= (write_enable and not_addr_op(4) and addr_op(3)	   	and addr_op(2)	 		and addr_op(1) 	   and not_addr_op(0));
	register15_write_enable <= (write_enable and not_addr_op(4) and addr_op(3)	   	and addr_op(2)	 		and addr_op(1)	   	and addr_op(0)		);
	register16_write_enable <= (write_enable and addr_op(4)	  	and not_addr_op(3)  	and not_addr_op(2) 	and not_addr_op(1) 	and not_addr_op(0));
	register17_write_enable <= (write_enable and addr_op(4)	  	and not_addr_op(3)  	and not_addr_op(2) 	and not_addr_op(1) 	and addr_op(0)		);
	register18_write_enable <= (write_enable and addr_op(4)	  	and not_addr_op(3)  	and not_addr_op(2) 	and addr_op(1)     	and not_addr_op(0));
	register19_write_enable <= (write_enable and addr_op(4)	  	and not_addr_op(3)  	and not_addr_op(2) 	and addr_op(1)	   	and addr_op(0)		);
	register20_write_enable <= (write_enable and addr_op(4)	  	and not_addr_op(3)  	and addr_op(2)	 		and not_addr_op(1) 	and not_addr_op(0));
	register21_write_enable <= (write_enable and addr_op(4)	  	and not_addr_op(3)  	and addr_op(2)	 		and not_addr_op(1) 	and addr_op(0)		);
	register22_write_enable <= (write_enable and addr_op(4)	  	and not_addr_op(3)  	and addr_op(2)	 		and addr_op(1) 	   and not_addr_op(0));
	register23_write_enable <= (write_enable and addr_op(4)	  	and not_addr_op(3)  	and addr_op(2)	 		and addr_op(1)	   	and addr_op(0)		);
	register24_write_enable <= (write_enable and addr_op(4)	  	and addr_op(3)	   	and not_addr_op(2) 	and not_addr_op(1) 	and not_addr_op(0));
	register25_write_enable <= (write_enable and addr_op(4)	  	and addr_op(3)	   	and not_addr_op(2) 	and not_addr_op(1) 	and addr_op(0)		);
	register26_write_enable <= (write_enable and addr_op(4)	  	and addr_op(3)	   	and not_addr_op(2) 	and addr_op(1) 	   and not_addr_op(0));
	register27_write_enable <= (write_enable and addr_op(4)	  	and addr_op(3)	   	and not_addr_op(2) 	and addr_op(1)	   	and addr_op(0)		);
	register28_write_enable <= (write_enable and addr_op(4)	  	and addr_op(3)	   	and addr_op(2)	 		and not_addr_op(1) 	and not_addr_op(0));
	register29_write_enable <= (write_enable and addr_op(4)	  	and addr_op(3)	   	and addr_op(2)	 		and not_addr_op(1) 	and addr_op(0)		);
	register30_write_enable <= (write_enable and addr_op(4)	  	and addr_op(3)	   	and addr_op(2)	 		and addr_op(1) 	   and not_addr_op(0));
	register31_write_enable <= (write_enable and addr_op(4)	  	and addr_op(3)	   	and addr_op(2)	 		and addr_op(1)	   	and addr_op(0)		);
									 
	register0: registrador port map(clock, register0_write_enable, write_data,register0_signal_read);
	register1: registrador port map(clock, register1_write_enable, write_data,register1_signal_read);
	register2: registrador port map(clock, register2_write_enable, write_data,register2_signal_read);
	register3: registrador port map(clock, register3_write_enable, write_data,register3_signal_read);
	register4: registrador port map(clock, register4_write_enable, write_data,register4_signal_read);
	register5: registrador port map(clock, register5_write_enable, write_data,register5_signal_read);
	register6: registrador port map(clock, register6_write_enable, write_data,register6_signal_read);
	register7: registrador port map(clock, register7_write_enable, write_data,register7_signal_read);
	register8: registrador port map(clock, register8_write_enable, write_data,register8_signal_read);
	register9: registrador port map(clock, register9_write_enable, write_data,register9_signal_read);
	register10:registrador port map(clock, register10_write_enable, write_data,register10_signal_read);
	register11:registrador port map(clock, register11_write_enable, write_data,register11_signal_read);
	register12:registrador port map(clock, register12_write_enable, write_data,register12_signal_read);
	register13:registrador port map(clock, register13_write_enable, write_data,register13_signal_read);
	register14:registrador port map(clock, register14_write_enable, write_data,register14_signal_read);
	register15:registrador port map(clock, register15_write_enable, write_data,register15_signal_read);
	register16:registrador port map(clock, register16_write_enable, write_data,register16_signal_read);
	register17:registrador port map(clock, register17_write_enable, write_data,register17_signal_read);
	register18:registrador port map(clock, register18_write_enable, write_data,register18_signal_read);
	register19:registrador port map(clock, register19_write_enable, write_data,register19_signal_read);
	register20:registrador port map(clock, register20_write_enable, write_data,register20_signal_read);
	register21:registrador port map(clock, register21_write_enable, write_data,register21_signal_read);
	register22:registrador port map(clock, register22_write_enable, write_data,register22_signal_read);
	register23:registrador port map(clock, register23_write_enable, write_data,register23_signal_read);
	register24:registrador port map(clock, register24_write_enable, write_data,register24_signal_read);
	register25:registrador port map(clock, register25_write_enable, write_data,register25_signal_read);
	register26:registrador port map(clock, register26_write_enable, write_data,register26_signal_read);
	register27:registrador port map(clock, register27_write_enable, write_data,register27_signal_read);
	register28:registrador port map(clock, register28_write_enable, write_data,register28_signal_read);
	register29:registrador port map(clock, register29_write_enable, write_data,register29_signal_read);
	register30:registrador port map(clock, register30_write_enable, write_data,register30_signal_read);
	register31:registrador port map(clock, register31_write_enable, write_data,register31_signal_read);

end architecture;