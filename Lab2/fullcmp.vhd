----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:25:59 08/22/2020 
-- Design Name: 
-- Module Name:    fullcmp - GateLevel 
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

entity fullcmp is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           lt_in : in  STD_LOGIC;
           eq_in : in  STD_LOGIC;
           gt_in : in  STD_LOGIC;
           lt_out : out  STD_LOGIC;
           eq_out : out  STD_LOGIC;
           gt_out : out  STD_LOGIC);
end fullcmp;

architecture GateLevel of fullcmp is
	component comparator_2bit is
		Port(
			a : in  STD_LOGIC;
         b : in  STD_LOGIC;
         lt : out  STD_LOGIC;
         eq : out  STD_LOGIC;
         gt : out  STD_LOGIC);
	end component comparator_2bit;
	Signal cmplt, cmpeq, cmpgt: STD_LOGIC;
	Signal internal : STD_LOGIC_VECTOR (1 downto 0);
begin
	cmp: comparator_2bit port map (a => a, b => b, lt => cmplt, eq => cmpeq, gt => cmpgt);
	internal(0) <= cmplt and eq_in;
	internal(1) <= cmpgt and eq_in;
	eq_out <= cmpeq and eq_in;
	lt_out <= lt_in or internal(0);
	gt_out <= gt_in or internal(1);
end GateLevel;

