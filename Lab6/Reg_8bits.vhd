----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:50:52 11/29/2020 
-- Design Name: 
-- Module Name:    Reg_8bits - Behavioral 
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

entity Reg_8bits is
    Port ( Parallel_in : in  STD_LOGIC_VECTOR (7 downto 0);
           LR : in  STD_LOGIC_VECTOR (1 downto 0);
           LD : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           reg_out : out  STD_LOGIC_VECTOR (7 downto 0));
end Reg_8bits;

architecture Behavioral of Reg_8bits is
	component mux_1x4x1 is
    Port ( a : in  STD_LOGIC;
           b : in  STD_LOGIC;
           c : in  STD_LOGIC;
           d : in  STD_LOGIC;
           sel : in  STD_LOGIC_VECTOR (1 downto 0);
           output : out  STD_LOGIC);
	end component mux_1x4x1;
	component DFF is
    Port ( D : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Q : out  STD_LOGIC);
	end component DFF;
	signal reg_val, in_t : STD_LOGIC_VECTOR(7 downto 0);
	signal in_clk : STD_LOGIC;
begin
	reg_out <= reg_val;
	
	mux_0 : mux_1x4x1 port map (a => '0', b => reg_val(1), c => reg_val(1), d => parallel_in(0), sel => LR, output => in_t(0));
	mux_1 : mux_1x4x1 port map (a => reg_val(0), b => reg_val(2), c => reg_val(2), d => parallel_in(1) , sel => LR, output => in_t(1));
	mux_2 : mux_1x4x1 port map (a => reg_val(1), b => reg_val(3), c => reg_val(3), d => parallel_in(2), sel => LR, output => in_t(2));
	mux_3 : mux_1x4x1 port map (a => reg_val(2), b => reg_val(4), c => reg_val(4), d => parallel_in(3), sel => LR, output => in_t(3));
	mux_4 :mux_1x4x1 port map  (a => reg_val(3), b => reg_val(5), c => reg_val(5), d => parallel_in(4), sel => LR, output => in_t(4));
	mux_5 :mux_1x4x1 port map  (a => reg_val(4), b => reg_val(6), c => reg_val(6), d => parallel_in(5), sel => LR, output => in_t(5));
	mux_6 :mux_1x4x1 port map  (a => reg_val(5), b =>reg_val(7), c => reg_val(7), d => parallel_in(6), sel => LR, output => in_t(6));
	mux_7 :mux_1x4x1 port map  (a => reg_val(6), b => '0', c => reg_val(7) ,d => parallel_in(7), sel => LR, output => in_t(7));
	
	in_clk <= clk and LD;
	DFF_0 : DFF port map (D => in_t(0), clk => in_clk, rst => rst, Q => reg_val(0));
	DFF_1 : DFF port map (D => in_t(1), clk => in_clk, rst => rst, Q => reg_val(1));
	DFF_2 : DFF port map (D => in_t(2), clk => in_clk, rst => rst, Q => reg_val(2));
	DFF_3 : DFF port map (D => in_t(3), clk => in_clk, rst => rst, Q => reg_val(3));
	DFF_4 : DFF port map (D => in_t(4), clk => in_clk, rst => rst, Q => reg_val(4));
	DFF_5 : DFF port map (D => in_t(5), clk => in_clk, rst => rst, Q => reg_val(5));
	DFF_6 : DFF port map (D => in_t(6), clk => in_clk, rst => rst, Q => reg_val(6));
	DFF_7 : DFF port map (D => in_t(7), clk => in_clk, rst => rst, Q => reg_val(7));
 

end Behavioral;

