----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:56:43 11/30/2020 
-- Design Name: 
-- Module Name:    Top_module - Behavioral 
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

entity Top_module is
    Port ( Parallel_in : in  STD_LOGIC_VECTOR (7 downto 0);
           LR : in  STD_LOGIC_VECTOR (1 downto 0);
           LD : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
			  seg_sel : out std_logic_vector(4 downto 0);
		     seg_data : out std_logic_vector(7 downto 0) 
			  );
end Top_module;

architecture Behavioral of Top_module is
	component Reg_8bits is
		    Port ( Parallel_in : in  STD_LOGIC_VECTOR (7 downto 0);
           LR : in  STD_LOGIC_VECTOR (1 downto 0);
           LD : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           reg_out : out  STD_LOGIC_VECTOR (7 downto 0));
	end component Reg_8bits;
	
	component Freq_devidor is
		Port(
			clk_in : in std_logic ;
			clk_out : out std_logic );
	end component Freq_devidor;
	
	component Bcd2_7seg is
		Port(
			reg_out : in std_logic_vector(3 downto 0);
			seg_sel : out std_logic_vector(4 downto 0);
			seg_data : out std_logic_vector(7 downto 0) );
	end component Bcd2_7seg;
	
	signal Clk_out : std_logic;
	signal Reg_out : std_logic_vector(7 downto 0);
	
begin

	f_d : Freq_devidor port map (clk_in => clk , clk_out => Clk_out);
	REG : Reg_8bits port map (Parallel_in =>	Parallel_in , LR => LR , LD => LD , clk => Clk_out, rst => rst, reg_out => Reg_out);
	seg : Bcd2_7seg port map (reg_out => Reg_out(3 downto 0), seg_sel => seg_sel , seg_data => seg_data);


end Behavioral;

