----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:46:22 11/30/2020 
-- Design Name: 
-- Module Name:    Bcd2_7seg - Behavioral 
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

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Bcd2_7seg is
port(
		reg_out : in std_logic_vector(3 downto 0);
		seg_sel : out std_logic_vector(4 downto 0);
		seg_data : out std_logic_vector(7 downto 0) 
		);
end Bcd2_7seg;

architecture Behavioral of Bcd2_7seg is

begin

	with reg_out select
		seg_data <= "00111111" when "0000" ,
						"00000110" when "0001" ,
						"01011011" when "0010" ,
						"01001111" when "0011" ,
						"01100110" when "0100" ,
						"01101101" when "0101" ,
						"01111101" when "0110" ,
						"00000111" when "0111" ,
						"01111111" when "1000" ,
						"01101111" when "1001" ,
						"00111000" when others ;
		seg_sel <= "00001" ;

end Behavioral;

