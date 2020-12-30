----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    11:36:48 11/09/2020 
-- Design Name: 
-- Module Name:    half_adder - Behavioral 
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

entity half_adder is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           sum : out  STD_LOGIC;
           cout : out  STD_LOGIC);
end half_adder;

architecture Behavioral of half_adder is
	component xor2 is
		Port(
			A, B: in std_logic;
			Z : out std_logic
		);
	End component xor2;
	component and2 is
		Port(
			A, B: in std_logic;
			Z : out std_logic
		);
	End component and2;
begin
	cout <= a and b;
	sum <= a xor b;
	and2_instance0: and2 port map ( A => a, B => b, Z => cout );
	xor2_instance0: xor2 port map ( A => a, B => b, Z => sum );
end Behavioral;


