----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:12:20 08/22/2020 
-- Design Name: 
-- Module Name:    mux_4x4x1 - GateLevel 
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

entity mux_4x4x1 is
   Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
		     b : in  STD_LOGIC_VECTOR (3 downto 0);
           c : in  STD_LOGIC_VECTOR (3 downto 0);
           d : in  STD_LOGIC_VECTOR (3 downto 0);
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC_VECTOR (3 downto 0)
	);
end mux_4x4x1;

architecture GateLevel of mux_4x4x1 is
	component mux_1x4x1 is 
		Port(
			a, b, c, d : in STD_LOGIC;
			sel : in STD_LOGIC_VECTOR (1 downto 0);
			output : out STD_LOGIC
		);
	end component mux_1x4x1;
begin
	mux0: mux_1x4x1 port map (a => a(0), b => b(0), c => c(0), d => d(0), sel => sel, output => output(0));
	mux1: mux_1x4x1 port map (a => a(1), b => b(1), c => c(1), d => d(1), sel => sel, output => output(1));
	mux2: mux_1x4x1 port map (a => a(2), b => b(2), c => c(2), d => d(2), sel => sel, output => output(2));
	mux3: mux_1x4x1 port map (a => a(3), b => b(3), c => c(3), d => d(3), sel => sel, output => output(3));
end GateLevel;

