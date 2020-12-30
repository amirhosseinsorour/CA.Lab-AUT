----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    09:33:11 09/06/2020 
-- Design Name: 
-- Module Name:    full_adder_8bit - Behavioral 
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

entity full_adder_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0));
end full_adder_8bit;

architecture Behavioral of full_adder_8bit is
	component full_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
	end component full_adder;
	signal carry : STD_LOGIC_VECTOR(6 downto 0);
begin
	fa0 : full_adder port map (a => A(0), b => B(0), cin => '0', cout => carry(0), sum => sum(0));
	fa1 : full_adder port map (a => A(1), b => B(1), cin => carry(0), cout => carry(1), sum => sum(1));
	fa2 : full_adder port map (a => A(2), b => B(2), cin => carry(1), cout => carry(2), sum => sum(2));
	fa3 : full_adder port map (a => A(3), b => B(3), cin => carry(2), cout => carry(3), sum => sum(3));
	fa4 : full_adder port map (a => A(4), b => B(4), cin => carry(3), cout => carry(4), sum => sum(4));
	fa5 : full_adder port map (a => A(5), b => B(5), cin => carry(4), cout => carry(5), sum => sum(5));
	fa6 : full_adder port map (a => A(6), b => B(6), cin => carry(5), cout => carry(6), sum => sum(6));
	fa7 : full_adder port map (a => A(7), b => B(7), cin => carry(6), cout => cout, sum => sum(7));
end Behavioral;

