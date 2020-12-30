----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    00:32:21 10/26/2020 
-- Design Name: 
-- Module Name:    sequence_detector_q4 - Behavioral 
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

entity sequence_detector_q4 is
	port(
		Input_s : in std_logic ;
		Detec_moore , Detec_mealy : out std_logic;
		Clk_s : in std_logic;
		Rst_s : in std_logic
		);
end sequence_detector_q4;

architecture Behavioral of sequence_detector_q4 is

	component q4_mealy is
			port(
		input : in std_logic ;
		detected : out std_logic;
		clk : in std_logic;
		rst : in std_logic
		);
	end component q4_mealy;
	
	component q4_moore is
			port(
		input : in std_logic ;
		detected : out std_logic;
		clk : in std_logic;
		rst : in std_logic
		);
	end component q4_moore;

begin

	mealy_state_machine: q4_mealy port map(input => Input_s , detected => Detec_mealy , clk => Clk_s , rst => Rst_s);
	moore_state_machine: q4_moore port map(input => Input_s , detected => Detec_moore , clk => Clk_s , rst => Rst_s);

end Behavioral;

