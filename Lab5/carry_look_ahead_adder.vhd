----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:15:36 11/09/2020 
-- Design Name: 
-- Module Name:    carry_look_ahead_adder - Behavioral 
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

entity carry_look_ahead_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end carry_look_ahead_adder;

architecture Behavioral of carry_look_ahead_adder is
	component full_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           cin : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
	end component full_adder;
		component or2 is
	Port(A,B: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component or2;
		component or3 is
	Port(A,B,C: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component or3;
		component or4 is
	Port(A,B,C,D: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component or4;
		component or5 is
	Port(A,B,C,D,E: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component or5;
		component and2 is
	Port(in1,in2: in STD_LOGIC;
			 o: out STD_LOGIC);
	end component and2;
		component and3 is
	Port(A,B,C: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component and3;
		component and4 is
	Port(A,B,C,D: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component and4;
		component and5 is
	Port(A,B,C,D,E: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component and5;
		component xor2 is
	Port(A,B: in STD_LOGIC;
			 Z: out STD_LOGIC);
	end component xor2;

	signal g,p : STD_LOGIC_VECTOR (3 downto 0);
	signal c : STD_LOGIC_VECTOR (3 downto 1);
	signal w : STD_LOGIC_VECTOR (9 downto 0);
begin
	and_gate1 : and2 port map(in1 =>A(0) , in2 =>B(0) , o=>g(0));
	and_gate2 : and2 port map(in1 =>A(1) , in2 =>B(1) , o=>g(1));
	and_gate3 : and2 port map(in1 =>A(2) , in2 =>B(2) , o=>g(2));
	and_gate4 : and2 port map(in1 =>A(3) , in2 =>B(3) , o=>g(3));
	xor_gate1 : xor2 port map(A =>A(0) , B =>B(0) , Z=>p(0));
	xor_gate2 : xor2 port map(A =>A(1) , B =>B(1) , Z=>p(1));
	xor_gate3 : xor2 port map(A =>A(2) , B =>B(2) , Z=>p(2));
	xor_gate4 : xor2 port map(A =>A(3) , B =>B(3) , Z=>p(3));
	
	and_gate5 : and2 port map(in1 => p(0) , in2 => cin  , o => w(0));
	and_gate6 : and2 port map(in1 => g(0) , in2 => p(1) , o => w(1));
	and_gate7 : and2 port map(in1 => g(1) , in2 => p(2) , o => w(2));
	and_gate8 : and2 port map(in1 => g(2) , in2 => p(3) , o => w(3));
	and_gate9  : and3 port map(A => cin  , B => p(0) , C => p(1) , Z => w(4));
	and_gate10 : and3 port map(A => g(0) , B => p(1) , C => p(2) , Z => w(5));
	and_gate11 : and3 port map(A => g(1) , B => p(2) , C => p(3) , Z => w(6));
	and_gate12 : and4 port map(A => cin  , B => p(0) , C => p(1) , D => p(2) , Z => w(7));
	and_gate13 : and4 port map(A => g(0) , B => p(1) , C => p(2) , D => p(3) , Z => w(8));
	and_gate14 : and5 port map(A => cin  , B => p(0) , C => p(1) , D => p(2) , E => p(3) , Z => w(9));
	
	or_gate1 : or2 port map(A => g(0) , B => w(0) , Z => c(1));
	or_gate2 : or3 port map(A => g(1) , B => w(1) , C => w(4) , Z => c(2));
	or_gate3 : or4 port map(A => g(2) , B => w(2) , C => w(5) , D => w(7) , Z => c(3));
	or_gate4 : or5 port map(A => g(3) , B => w(3) , C => w(6) , D => w(8) , E => w(9) , Z => cout);
	
	fa1: full_adder port map (a => A(0), b => B(0), cin => cin , sum => Sum(0));
	fa2: full_adder port map (a => A(1), b => B(1), cin => c(1), sum => Sum(1));
	fa3: full_adder port map (a => A(2), b => B(2), cin => c(2), sum => Sum(2));
	fa4: full_adder port map (a => A(3), b => B(3), cin => c(3), sum => Sum(3));
	
end Behavioral;

