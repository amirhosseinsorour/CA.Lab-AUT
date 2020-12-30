----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:53:49 11/29/2020 
-- Design Name: 
-- Module Name:    DFF - Behavioral 
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

entity DFF is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Q : out  STD_LOGIC);
end DFF;

architecture Behavioral of DFF is
	signal internal : STD_LOGIC_VECTOR(5 downto 0);
begin
	internal(0) <= not (internal(3) and internal(1));
	internal(1) <= not (clk and internal(0) and rst);
	internal(2) <= not (clk and internal(1) and internal(3));
	internal(3) <= not (D and rst and internal(2));
	
	internal(4) <= not (internal(1) and internal(5));
	internal(5) <= not (internal(4) and internal(2) and rst);
	
	Q <= internal(4);

end Behavioral;

