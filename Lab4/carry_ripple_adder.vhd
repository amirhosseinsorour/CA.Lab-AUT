----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:45:54 11/09/2020 
-- Design Name: 
-- Module Name:    carry_ripple_adder - Behavioral 
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

entity carry_ripple_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end carry_ripple_adder;

architecture Behavioral of carry_ripple_adder is
	component full_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
	end component full_adder;
	
	signal c : STD_LOGIC_VECTOR (2 downto 0);
	
begin

	fa1: full_adder port map (a => A(0), b => B(0), cin => cin , sum => Sum(0) , cout => c(0));
	fa2: full_adder port map (a => A(1), b => B(1), cin => c(0), sum => Sum(1) , cout => c(1));
	fa3: full_adder port map (a => A(2), b => B(2), cin => c(1), sum => Sum(2) , cout => c(2));
	fa4: full_adder port map (a => A(3), b => B(3), cin => c(2), sum => Sum(3) , cout => cout);

end Behavioral;

