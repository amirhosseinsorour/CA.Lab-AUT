----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    14:48:10 08/22/2020 
-- Design Name: 
-- Module Name:    fullcmp4bit - Behavioral 
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

entity fullcmp4bit is
    Port ( a : in  STD_LOGIC_VECTOR (3 downto 0);
           b : in  STD_LOGIC_VECTOR (3 downto 0);
           gt_out : out  STD_LOGIC;
           eq_out : out  STD_LOGIC;
           lt_out : out  STD_LOGIC);
end fullcmp4bit;

architecture GateLevel of fullcmp4bit is
	component fullcmp is
		Port ( 
			  a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           lt_in : in  STD_LOGIC;
           eq_in : in  STD_LOGIC;
           gt_in : in  STD_LOGIC;
           lt_out : out  STD_LOGIC;
           eq_out : out  STD_LOGIC;
           gt_out : out  STD_LOGIC);
	end component fullcmp;
	Signal lt, eq, gt : STD_LOGIC_VECTOR (2 downto 0);
begin
	cmp3: fullcmp port map (a => a(3), b => b(3), lt_in => '0', eq_in => '1', gt_in => '0', lt_out => lt(0), eq_out => eq(0), gt_out => gt(0));
	cmp2: fullcmp port map (a => a(2), b => b(2), lt_in => lt(0), eq_in => eq(0), gt_in => gt(0), lt_out => lt(1), eq_out => eq(1), gt_out => gt(1));
	cmp1: fullcmp port map (a => a(1), b => b(1), lt_in => lt(1), eq_in => eq(1), gt_in => gt(1), lt_out => lt(2), eq_out => eq(2), gt_out => gt(2));
	cmp0: fullcmp port map (a => a(0), b => b(0), lt_in => lt(2), eq_in => eq(2), gt_in => gt(2), lt_out => lt_out, eq_out => eq_out, gt_out => gt_out);
end GateLevel;

