----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:11 11/30/2020 
-- Design Name: 
-- Module Name:    Freq_devidor - Behavioral 
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

entity Freq_devidor is
port(
		clk_in : in std_logic ;
		clk_out : out std_logic );
		
end entity Freq_devidor;

architecture freq_devidor_arch of Freq_devidor is

signal counter : integer range 1 to 400 := 1 ;
signal temp : std_logic := '1' ;

begin
		freq_devidor : process (clk_in)
		begin
				if rising_edge(clk_in) then
					if(counter = 200) then
						temp <= not(temp);
						counter <= 1 ;
					else
						counter <= counter + 1 ;
					end if;
				end if;
		end process freq_devidor;
		clk_out <= temp ;

end freq_devidor_arch ;




