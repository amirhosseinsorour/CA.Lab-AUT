----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:42:52 08/22/2020 
-- Design Name: 
-- Module Name:    encoder_1x4x2 - GateLevel 
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

entity encoder_1x4x2 is
    Port ( input : in  STD_LOGIC_VECTOR (3 downto 0);
           output : out  STD_LOGIC_VECTOR (1 downto 0);
           v : out  STD_LOGIC);
end encoder_1x4x2;

architecture GateLevel of encoder_1x4x2 is
	Signal ni2, inside : STD_LOGIC;
begin
	ni2 <= not input(2);
	inside <= ni2 and input(1);
	output(0) <= input(3) or inside;
	output(1) <= input(3) or input(2);
	v <= input(0) or input(1) or input(3) or input(2);
end GateLevel;

