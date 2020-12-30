----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    13:32:27 08/22/2020 
-- Design Name: 
-- Module Name:    decoder_1x2x4 - GateLevel 
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

entity decoder_1x2x4 is
    Port ( sel : in  STD_LOGIC_VECTOR (1 downto 0);
           e : in  STD_LOGIC;
           output : out  STD_LOGIC_VECTOR (3 downto 0));
end decoder_1x2x4;

architecture GateLevel of decoder_1x2x4 is
	Signal not_s : STD_LOGIC_VECTOR(1 downto 0);
begin
	not_s <= not sel;
	output(0) <= e and not_s(0) and not_s(1);
	output(1) <= e and sel(0) and not_s(1);
	output(2) <= e and not_s(0) and sel(1);
	output(3) <= e and sel(0) and sel(1);
end GateLevel;

