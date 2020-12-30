----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    04:11:02 12/29/2020 
-- Design Name: 
-- Module Name:    MBoard - Behavioral 
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

entity MBoard is
	Port (  clk : in  STD_LOGIC;
           rst : in  STD_LOGIC);
end MBoard;

architecture Behavioral of MBoard is

	component CPU is
		 Port ( Data_in : in  STD_LOGIC_VECTOR (7 downto 0);
				  clk : in  STD_LOGIC;
				  rst : in  STD_LOGIC;
				  Data_out : out  STD_LOGIC_VECTOR (7 downto 0);
				  Address : out  STD_LOGIC_VECTOR (4 downto 0);
				  we : out  STD_LOGIC;
				  oe : out  STD_LOGIC);
	end component CPU;
	
	component RAM is
		Port( w , r , rst , clk: in std_logic;
				addr : in std_logic_vector(4 downto 0);
				data_in : in std_logic_vector(7 downto 0);
				data_out : out std_logic_vector(7 downto 0);
				is_valid : out std_logic );

	end component RAM;

	signal bus_ram2cpu , bus_cpu2ram : STD_LOGIC_VECTOR (7 downto 0);
	signal address : STD_LOGIC_VECTOR (4 downto 0);
	signal sr,sw : STD_LOGIC;

begin

	CPU8bits : CPU port map (Data_in => bus_ram2cpu, clk => clk, rst => rst, Data_out => bus_cpu2ram, Address => address, we => sw, oe => sr);
	Memory : RAM port map (w => sw, r => sr, rst => rst, clk => clk, Addr => address, Data_in => bus_cpu2ram, Data_out => bus_ram2cpu);

end Behavioral;

