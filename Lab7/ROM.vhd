----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:44:58 11/15/2020 
-- Design Name: 
-- Module Name:    ROM - Behavioral 
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

entity ROM is

generic(
	W : integer := 8;
	D : integer := 4;
	C : integer := 16
	);
	
port(
	clk : in std_logic;
	addr : in std_logic_vector(D-1 downto 0);
	data_out : out std_logic_vector(W-1 downto 0)
	);

end ROM;

architecture ROM_arch of ROM is

type mem_type is array (C-1 downto 0) of std_logic_vector(W-1 downto 0);
constant ROM_block : mem_type := ( "00001111" ,
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
			if(rising_edge(clk)) then
				data_out <= ROM_block(conv_integer(addr));
			end if;
		end process;
end ROM_arch;

