----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:43:31 09/06/2020 
-- Design Name: 
-- Module Name:    basic_multiplier - Behavioral 
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

entity basic_multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end basic_multiplier;

architecture Behavioral of basic_multiplier is
	component full_adder_8bit is
    Port ( A : in  STD_LOGIC_VECTOR (7 downto 0);
           B : in  STD_LOGIC_VECTOR (7 downto 0);
           cin : in  STD_LOGIC;
           cout : out  STD_LOGIC;
           sum : out  STD_LOGIC_VECTOR (7 downto 0));
	end component full_adder_8bit;
	
	component and2 is
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           o : out  STD_LOGIC);
	end component and2;
	
	type arr4x4bit is array (0 to 3, 0 to 3) of STD_LOGIC;
	signal partials : arr4x4bit;
	signal isum0 : STD_LOGIC_VECTOR(7 downto 0);
	signal isum1 : STD_LOGIC_VECTOR(7 downto 0);
	signal isum2 : STD_LOGIC_VECTOR(7 downto 0);
	signal isum3 : STD_LOGIC_VECTOR(7 downto 0);
	signal isum4 : STD_LOGIC_VECTOR(7 downto 0);
	signal isum5 : STD_LOGIC_VECTOR(7 downto 0);
	
begin
	a00 : and2 port map (in1 => A(0), in2 => B(0), o => partials(0,0));
	a01 : and2 port map (in1 => A(0), in2 => B(1), o => partials(0,1));
	a02 : and2 port map (in1 => A(0), in2 => B(2), o => partials(0,2));
	a03 : and2 port map (in1 => A(0), in2 => B(3), o => partials(0,3));
	
	a10 : and2 port map (in1 => A(1), in2 => B(0), o => partials(1,0));
	a11 : and2 port map (in1 => A(1), in2 => B(1), o => partials(1,1));
	a12 : and2 port map (in1 => A(1), in2 => B(2), o => partials(1,2));
	a13 : and2 port map (in1 => A(1), in2 => B(3), o => partials(1,3));
	
	a20 : and2 port map (in1 => A(2), in2 => B(0), o => partials(2,0));
	a21 : and2 port map (in1 => A(2), in2 => B(1), o => partials(2,1));
	a22 : and2 port map (in1 => A(2), in2 => B(2), o => partials(2,2));
	a23 : and2 port map (in1 => A(2), in2 => B(3), o => partials(2,3));
	
	a30 : and2 port map (in1 => A(3), in2 => B(0), o => partials(3,0));
	a31 : and2 port map (in1 => A(3), in2 => B(1), o => partials(3,1));
	a32 : and2 port map (in1 => A(3), in2 => B(2), o => partials(3,2));
	a33 : and2 port map (in1 => A(3), in2 => B(3), o => partials(3,3));
	
	isum0 <= "0000" & partials(3,0) & partials(2,0) & partials(1,0) & partials (0,0);
	isum1 <= "000" & partials(3,1) & partials(2,1) & partials(1,1) & partials (0,1) & '0';
	isum2 <= "00" & partials(3,2) & partials(2,2) & partials(1,2) & partials (0,2) & "00";
	isum3 <= '0' & partials(3,3) & partials(2,3) & partials(1,3) & partials (0,3) & "000";
	
	fa0 : full_adder_8bit port map (A => isum0, B => isum1, cin => '0', sum => isum4);
	fa1 : full_adder_8bit port map (A => isum2, B => isum3, cin => '0', sum => isum5);
	fa2 : full_adder_8bit port map (A => isum4, B => isum5, cin => '0', sum => P);

end Behavioral;

