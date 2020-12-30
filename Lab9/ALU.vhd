----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:15:07 12/21/2020 
-- Design Name: 
-- Module Name:    alu - Behavioral 
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
use IEEE.numeric_std.ALL;
use ieee.std_logic_unsigned.ALL;
library work;
use work.alu_package.ALL ;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity ALU is
	Port( A , B : in std_logic_vector(3 downto 0) ;
			sel : in std_logic_vector(2 downto 0) ;
			OUT_ALU : out std_logic_vector(3 downto 0) ) ;
end ALU;

architecture Behavioral of ALU is

begin

	process(A,B,sel)
		begin
			case sel is
				when and_op => OUT_ALU <= and_4bits(A,B) ;
				when or_op => OUT_ALU <= or_4bits(A,B) ;
				when ror_op => OUT_ALU <= ro_right(A) ;
				when rol_op => OUT_ALU <= ro_left(A);
			   when  dec_A_op => OUT_ALU <= std_logic_vector(unsigned(A) - 1);
				when  inc_A_op => OUT_ALU <= std_logic_vector(unsigned(A) + 1) ;
				when  add_op => OUT_ALU <= A + B ;
				when  sub_op => OUT_ALU <= A - B ;
				when others => OUT_ALU <= "0000" ;
			end case;
		end process ;

end Behavioral;