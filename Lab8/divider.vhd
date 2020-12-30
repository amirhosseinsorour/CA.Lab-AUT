----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:51:20 12/07/2020 
-- Design Name: 
-- Module Name:    divider - Behavioral 
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
use IEEE.numeric_std.all;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider is
	
	PORT(
		  Dividend : in std_logic_vector(7 downto 0);
		  Division : in std_logic_vector(3 downto 0);
		  clk : in std_logic ;
		  zero_error : out std_logic ;
		  overflow : out std_logic ;
		  Reminder : out std_logic_vector(3 downto 0) ;
		  Quotient : out std_logic_vector(3 downto 0) 
		  );
		  
end divider;

architecture Behavioral of divider is

signal R , A , B , not_B : std_logic_vector(3 downto 0);
signal ERA : std_logic_vector(8 downto 0);
signal ER : std_logic_vector(4 downto 0);
signal E : std_logic ;

begin
	process(Division,Dividend)
		begin
			if(Division = "0000") then
				zero_error <= '1' ;
			else
				zero_error <= '0' ;
				R <= Dividend(7 downto 4);
				A <= Dividend (3 downto 0);
				B <= Division ;
				not_B <= not B ;

				ER <= ('0' & R) + ('0' & not_B) + 1 ;
				E <= ER(4) ;
				R <= ER(3 downto 0) ;
				if (E = '1') then
					R <= R + B ;
					overflow <= '1';
				else
					R <= R + B ;
					overflow <= '0';
					for sc in 0 to 3 loop
						-- SHL(E:R:A)
						ERA <= E & R & A ;
						ERA <= ERA(7 downto 0) & '0' ;
						E <= ERA(8) ;
						R <= ERA(7 downto 4) ;
						A <= ERA(3 downto 0) ;
						if(E = '1') then
							ER <= ('0' & R) + ('0' & not_B) + 1 ;
							E <= ER(4) ;
							R <= ER(3 downto 0) ;
							A(0) <= '1' ;
						else
							ER <= ('0' & R) + ('0' & not_B) + 1 ;
							E <= ER(4) ;
							R <= ER(3 downto 0) ;
							if(E = '1') then
								A(0) <= '1' ;
							else
								A(0) <= '0' ;
								R <= R + B ;
							end if ;
						end if ;
					end loop ;
				end if ;
				Quotient <= A ;
				Reminder <= R ;

			end if ;
	end process;

end Behavioral;

