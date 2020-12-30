----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:52:49 11/29/2020 
-- Design Name: 
-- Module Name:    mux_1x4x1 - Behavioral 
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

entity mux_1x4x1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC);
end mux_1x4x1;

architecture GateLevel of mux_1x4x1 is
	Signal not_s : STD_LOGIC_VECTOR(1 downto 0);
	Signal and_out : STD_LOGIC_VECTOR(3 downto 0);
begin
	not_s <= not sel;
	and_out(0) <= a and not_s(0) and not_s(1);
	and_out(1) <= b and sel(0) and not_s(1);
	and_out(2) <= c and not_s(0) and sel(1);
	and_out(3) <= d and sel(0) and sel(1);
	output <= and_out(0) or and_out(1) or and_out(2) or and_out(3);
end GateLevel;



