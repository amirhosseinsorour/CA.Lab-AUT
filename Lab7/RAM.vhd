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
	D : integer := 4;
	C : integer := 16
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
										   "00001110" ,
										   "00001101" ,
									 	   "00001100" ,
											"00001011" ,
											"00001010" ,
											"00001001" ,
											"00001000" ,
											"00000111" ,
											"00000110" ,
											"00000101" ,
											"00000100" ,
											"00000011" ,
											"00000010" ,
											"00000001" ,
											"00000000" );

begin
		
	process (clk)
		begin
			if rst = '0' then
				for i in 0 to C-1 loop
					RAM_block(i) <= conv_std_logic_vector(i,W1);
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
				end if;
			end if;
		end process;

end RAM_arch;
