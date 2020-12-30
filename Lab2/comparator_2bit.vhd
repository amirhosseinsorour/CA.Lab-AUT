----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:17:46 08/22/2020 
-- Design Name: 
-- Module Name:    comparator_2bit - GateLevel 
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

entity comparator_2bit is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           lt : out  STD_LOGIC;
           eq : out  STD_LOGIC;
           gt : out  STD_LOGIC);
end comparator_2bit;

architecture GateLevel of comparator_2bit is
	Signal internal : STD_LOGIC_VECTOR (1 downto 0);
	Signal nota, notb: STD_LOGIC;
begin
	nota <= not a;
	notb <= not b;
	internal(0) <= nota and b;
	internal(1) <= a and notb;
	lt <= internal(0);
	eq <= internal(0) nor internal(1);
	gt <= internal(1);
end GateLevel;

