----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:16:18 11/09/2020 
-- Design Name: 
-- Module Name:    carry_select_adder - Behavioral 
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

entity carry_select_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end carry_select_adder;

architecture Behavioral of carry_select_adder is
	component mux4x2x1 is
    Port ( I0 : in  STD_LOGIC_VECTOR (3 downto 0);
           I1 : in  STD_LOGIC_VECTOR (3 downto 0);
           s : in  STD_LOGIC;
           en : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (3 downto 0));
	end component mux4x2x1;
	component mux2x1 is
    Port ( I0 : in  STD_LOGIC;
           I1 : in  STD_LOGIC;
           s : in  STD_LOGIC;
           en : in  STD_LOGIC;
           o : out  STD_LOGIC);
	end component mux2x1;
	component carry_ripple_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
	end component carry_ripple_adder;
	signal sum0, sum1 : STD_LOGIC_VECTOR (3 downto 0);
	signal inc0, inc1 : STD_LOGIC;
begin
	cra1 : carry_ripple_adder port map (A => A, B => B, cin => '0', Sum => sum0, cout => inc0);
	cra2 : carry_ripple_adder port map (A => A, B => B, cin => '1', Sum => sum1, cout => inc1);
	m4x2to1 : mux4x2x1 port map (I0 => sum0, I1 => sum1, s => cin, en => '1', o => sum);
	m2to1 : mux2x1 port map (I0 => inc0, I1 => inc1, s => cin, en => '1', o => cout);
end Behavioral;


