----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:34:00 11/09/2020 
-- Design Name: 
-- Module Name:    mux2x1 - Behavioral 
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

entity mux2x1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           s : in  STD_LOGIC;
           en : in  STD_LOGIC;
           o : out  STD_LOGIC);
end mux2x1;

architecture Behavioral of mux2x1 is
	component not1 is
	Port(A: in STD_LOGIC;
		  N: out STD_LOGIC);
	end component not1;
	component and3 is
	Port(A,B,C: in STD_LOGIC;
			   Z: out STD_LOGIC);
	end component and3;
	component or2 is
	Port(A,B: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component or2;
	
	signal nots : STD_LOGIC;
	signal w1,w2,w3 : STD_LOGIC;
begin
	not_gate : not1 port map (A => s , N => nots);
	and_gate1 : and3 port map (A => nots ,B => I0 ,C => en ,Z => w1);
	and_gate2 : and3 port map (A => s ,B => I1 ,C => en ,Z => w2);
	or_gate : or2 port map (A => w1 , B => w2 , Z => o);
end Behavioral;

