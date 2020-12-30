----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:11:05 11/15/2020 
-- Design Name: 
-- Module Name:    RAM - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM is

generic(
	W1 : integer := 8;
	D : integer := 5;
	C : integer := 32
	);
	
port(
	w , r , rst , clk: in std_logic;
	addr : in std_logic_vector(D-1 downto 0);
	data_in : in std_logic_vector(W1-1 downto 0);
	data_out : out std_logic_vector(W1-1 downto 0);
	is_valid : out std_logic
	);
	
end RAM;

architecture RAM_arch of RAM is

type mem_type is array (C-1 downto 0) of std_logic_vector(W1-1 downto 0);
signal RAM_block : mem_type := ( "00001111" ,
										   "00101110" ,
										   "01001101" ,
									 	   "01101100" ,
											"10001011" ,
											"10101010" ,
											"11001001" ,
											"11101000" ,
											"11000111" ,
											"10100110" ,
											"10000101" ,
											"01100100" ,
											"01000011" ,
											"00100010" ,
											"00000001" ,
											"11100000" ,
											"00011111" ,
										   "00111110" ,
										   "01011101" ,
									 	   "01111100" ,
											"10011011" ,
											"10111010" ,
											"11011001" ,
											"11111000" ,
											"11010111" ,
											"10110110" ,
											"10010101" ,
											"01110100" ,
											"01010011" ,
											"00110010" ,
											"00010001" ,
											"11110000" );

begin
		
	process (clk)
		begin
			if rst = '0' then
				for i in 0 to C-1 loop
					RAM_block(i) <= RAM_block(i) + conv_std_logic_vector(i,W1);
				end loop;
			elsif rising_edge(clk) then
				if (w = '1') and (r = '0') then
					RAM_block(conv_integer(addr)) <= data_in;
					is_valid <= '1' ;
				elsif (w = '0') and (r = '1') then
					data_out <= RAM_block(conv_integer(addr));
					is_valid <= '1' ;
				else
					is_valid <= '0';
					data_out <= "ZZZZZZZZ";
				end if;
			end if;
		end process;

end RAM_arch;
