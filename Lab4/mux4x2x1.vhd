----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:52:34 11/09/2020 
-- Design Name: 
-- Module Name:    mux4x2x1 - Behavioral 
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

entity mux4x2x1 is
    Port ( I0 : in  STD_LOGIC_VECTOR (3 downto 0);
           I1 : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC;
           en : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (3 downto 0));
end mux4x2x1;

architecture Behavioral of mux4x2x1 is
	component mux2x1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           s : in  STD_LOGIC;
           en : in  STD_LOGIC;
           o : out  STD_LOGIC);
	end component mux2x1;
begin
	m0: mux2x1 port map (I0 => I0(0), I1 => I1(0), s => s, en => en, o => o(0));
	m1: mux2x1 port map (I0 => I0(1), I1 => I1(1), s => s, en => en, o => o(1));
	m2: mux2x1 port map (I0 => I0(2), I1 => I1(2), s => s, en => en, o => o(2));
	m3: mux2x1 port map (I0 => I0(3), I1 => I1(3), s => s, en => en, o => o(3));

end Behavioral;

