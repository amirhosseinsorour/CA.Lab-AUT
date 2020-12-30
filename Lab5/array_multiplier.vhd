----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:55:46 11/23/2020 
-- Design Name: 
-- Module Name:    array_multiplier - Behavioral 
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

entity array_multiplier is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           P : out  STD_LOGIC_VECTOR (7 downto 0)
			  );
end array_multiplier;

architecture Behavioral of array_multiplier is

component carry_look_ahead_adder is
    Port ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
end component carry_look_ahead_adder;

component and2 is
    Port ( in1 : in  STD_LOGIC;
           in2 : in  STD_LOGIC;
           o : out  STD_LOGIC);
end component and2;

signal S1,S2,S3 : STD_LOGIC_VECTOR (3 downto 0);
signal B0A,B1A,B2A,B3A : STD_LOGIC_VECTOR (3 downto 0) ;
signal C1,C2,C3 : STD_LOGIC;
signal in1,in2,in3 : STD_LOGIC_VECTOR (3 downto 0);

begin

	and_gate1  : and2 port map(in1 =>A(0) , in2 =>B(0) , o=>B0A(0));
	and_gate2  : and2 port map(in1 =>A(1) , in2 =>B(0) , o=>B0A(1));
	and_gate3  : and2 port map(in1 =>A(2) , in2 =>B(0) , o=>B0A(2));
	and_gate4  : and2 port map(in1 =>A(3) , in2 =>B(0) , o=>B0A(3));
	and_gate5  : and2 port map(in1 =>A(0) , in2 =>B(1) , o=>B1A(0));
	and_gate6  : and2 port map(in1 =>A(1) , in2 =>B(1) , o=>B1A(1));
	and_gate7  : and2 port map(in1 =>A(2) , in2 =>B(1) , o=>B1A(2));
	and_gate8  : and2 port map(in1 =>A(3) , in2 =>B(1) , o=>B1A(3));
	and_gate9  : and2 port map(in1 =>A(0) , in2 =>B(2) , o=>B2A(0));
	and_gate10 : and2 port map(in1 =>A(1) , in2 =>B(2) , o=>B2A(1));
	and_gate11 : and2 port map(in1 =>A(2) , in2 =>B(2) , o=>B2A(2));
	and_gate12 : and2 port map(in1 =>A(3) , in2 =>B(2) , o=>B2A(3));
	and_gate13 : and2 port map(in1 =>A(0) , in2 =>B(3) , o=>B3A(0));
	and_gate14 : and2 port map(in1 =>A(1) , in2 =>B(3) , o=>B3A(1));
	and_gate15 : and2 port map(in1 =>A(2) , in2 =>B(3) , o=>B3A(2));
	and_gate16 : and2 port map(in1 =>A(3) , in2 =>B(3) , o=>B3A(3));
	
	in1 <= '0' & B0A(3 downto 1) ;
	in2 <=  C1 &  S1(3 downto 1) ;
	in3 <=  C2 &  S2(3 downto 1) ;
	
	CLA1 : carry_look_ahead_adder port map(A => in1 , B => B1A , cin => '0' , Sum => S1 , cout => C1);
	CLA2 : carry_look_ahead_adder port map(A => in2 , B => B2A , cin => '0' , Sum => S2 , cout => C2);
	CLA3 : carry_look_ahead_adder port map(A => in3 , B => B3A , cin => '0' , Sum => S3 , cout => C3);
	
	P(0) <= B0A(0);
	P(1) <= S1(0);
	P(2) <= S2(0);
	P(6 downto 3) <= S3 ;
	P(7) <= C3 ;

end Behavioral;

