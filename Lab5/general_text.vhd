library ieee;
use ieee.std_logic_1164.all;


entity tb_multiplier is
end entity ;

architecture test of tb_multiplier is

	-- components decleration
	component basic_multiplier is 
	port (
		A , B : in std_logic_vector (3 downto 0);
		P : out std_logic_vector (7 downto 0)
	);

	end component basic_multiplier;

	component array_multiplier is 
	port (
		A , B : in std_logic_vector (3 downto 0);
		P : out std_logic_vector (7 downto 0)
	);

	end component array_multiplier;

	component carry_save_multiplier is 
	port (
		A , B : in std_logic_vector (3 downto 0);
		P : out std_logic_vector (7 downto 0)
	);

	end component carry_save_multiplier;


	---- Internal Signals
	-- Inputs
	signal A : std_logic_vector(3 downto 0);
	signal B : std_logic_vector(3 downto 0);

	-- Outputs

	signal P_basic : std_logic_vector(7 downto 0);
	signal P_array : std_logic_vector(7 downto 0);
	signal P_carry_save  : std_logic_vector(7 downto 0);

begin

	-- Create Instances
	basic_mult: basic_multiplier
		port map (
			A => A,
			B => B,
			P => P_basic
		);

	array_mult : array_multiplier
		port map (
			A => A,
			B => B,
			P => P_array
		);

	carry_save_mult : carry_save_multiplier
		port map (
			A => A,
			B => B,
			P => P_carry_save
		);
	A <=
		X"0" after 00 ns ,
		X"3" after 10 ns ,
		X"5" after 20 ns ,
		X"7" after 30 ns ,
		X"9" after 40 ns ,
		X"4" after 50 ns ,
		X"A" after 60 ns ,
		X"B" after 70 ns ,
		X"D" after 80 ns ,
		X"F" after 90 ns ,
		X"9" after 100 ns ,
		X"3" after 110 ns ;

	B <=
		X"1" after 00 ns ,
		X"2" after 05 ns ,
		X"6" after 15 ns ,
		X"A" after 25 ns ,
		X"E" after 35 ns ,
		X"4" after 45 ns ,
		X"8" after 55 ns ,
		X"9" after 65 ns ,
		X"4" after 75 ns ,
		X"C" after 85 ns ,
		X"6" after 95 ns ,
		X"2" after 105 ns ,
		X"1" after 115 ns ;
		
end architecture test;