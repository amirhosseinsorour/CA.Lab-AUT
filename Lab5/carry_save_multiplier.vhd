----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:16:09 09/06/2020 
-- Design Name: 
-- Module Name:    carry_save_multiplier - Behavioral 
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

entity carry_save_multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0));
end carry_save_multiplier;

	architecture Behavioral of carry_save_multiplier is
	component and2 is
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           o : out  STD_LOGIC);
	end component and2;
	component full_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
	end component full_adder;
	component half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
	end component half_adder;
	
	type arr4x4bit is array (0 to 3, 0 to 3) of STD_LOGIC;
	signal partials : arr4x4bit;
	signal icarry : STD_LOGIC_VECTOR(14 downto 0);
	signal isum : STD_LOGIC_VECTOR(8 downto 0);
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
	
	
	P(0) <= partials(0,0);
	
	fa0 : full_adder port map (a => partials(1,0), b => partials(0,1), cin => '0', sum => P(1), cout => icarry(0));
	fa00 : full_adder port map (a => partials(2,0), b => partials(1,1), cin => '0', sum => isum(0), cout => icarry(1));
	fa01 : full_adder port map (a => partials(3,0), b => partials(2,1), cin => '0', sum => isum(1), cout => icarry(2));
	fa02 : full_adder port map (a => '0', b => partials(3,1), cin => '0', sum => isum(2), cout => icarry(3));
	
	fa1 : full_adder port map (a => partials(0,2), b => isum(0), cin => icarry(0), sum => P(2), cout => icarry(4));
	fa10 : full_adder port map (a => isum(1), b => partials(1,2), cin => icarry(1), sum => isum(3), cout => icarry(5));
	fa11 : full_adder port map (a => isum(2), b => partials(2,2), cin => icarry(2), sum => isum(4), cout => icarry(6));
	fa12 : full_adder port map (a => '0', b => partials(3,2), cin => icarry(3), sum => isum(5), cout => icarry(7));
	
	fa2 : full_adder port map (a => partials(0,3), b => isum(3), cin => icarry(4), sum => P(3), cout => icarry(8));
	fa20 : full_adder port map (a => isum(4), b => partials(1,3), cin => icarry(5), sum => isum(6), cout => icarry(9));
	fa21 : full_adder port map (a => isum(5), b => partials(2,3), cin => icarry(6), sum => isum(7), cout => icarry(10));
	fa22 : full_adder port map (a => '0', b => partials(3,3), cin => icarry(7), sum => isum(8), cout => icarry(11));
	
	fa30 : full_adder port map (a => isum(6), b => icarry(8), cin => '0', cout => icarry(12), sum => P(4));
	fa31 : full_adder port map (a => isum(7), b => icarry(9), cin => icarry(12), cout => icarry(13), sum => P(5));
	fa32 : full_adder port map (a => isum(8), b => icarry(10), cin => icarry(13), cout => icarry(14), sum => P(6));
	fa33 : full_adder port map (a => '0', b => icarry(11), cin => icarry(14), sum => P(7));
	

end Behavioral;

