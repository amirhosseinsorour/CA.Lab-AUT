----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:18 11/09/2020 
-- Design Name: 
-- Module Name:    full_adder - Behavioral 
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

entity full_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end full_adder;

architecture Behavioral of full_adder is
	component half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
	end component half_adder;
	component or2 is
	Port(A,B: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component or2;
	
	signal internal_sum, cout1, cout2 : STD_LOGIC;
begin
	ha1: half_adder port map (a => a, b => b, sum => internal_sum, cout => cout1);
	ha2: half_adder port map (a => cin, b => internal_sum, sum => sum, cout => cout2);
	or_gate: or2 port map (A => cout1 , B => cout2 , Z => cout);
end Behavioral;

