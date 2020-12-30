----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:35:20 10/25/2020 
-- Design Name: 
-- Module Name:    q5_mealy - Behavioral 
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

entity q5_mealy is
	port(
		input : in std_logic ;
		detected : out std_logic;
		clk : in std_logic;
		rst : in std_logic
		);
end q5_mealy;

architecture Behavioral of q5_mealy is
	type state_t is (s0 , s1 , s2 , s3 , s4);
	signal present_state : state_t := s0;
	signal next_state : state_t := s0;

	begin
	
	clock_process : process(clk)
			begin
				if(clk'event and clk = '1') then
					if(rst = '0') then
						present_state <= s0;
					else
						present_state <= next_state;
					end if;
				end if;
			end process clock_process;
	
	mealy_process : process(present_state , input)
		begin
			case present_state is
				when s0=>
					if(input = '0') then
						detected <= '0';
						next_state <= s1;
					elsif(input = '1') then
						detected <= '0';
						next_state <= s0 ;
					end if;
				when s1=>
					if(input = '0') then
						detected <= '0';
						next_state <= s1;
					elsif(input = '1') then
						detected <= '0';
						next_state <= s2 ;
					end if;
				when s2=>
					if(input = '0') then
						detected <= '0';
						next_state <= s3;
					elsif(input = '1') then
						detected <= '0';
						next_state <= s4 ;
					end if;
				when s3=>
					if(input = '0') then
						detected <= '0';
						next_state <= s1;
					elsif(input = '1') then
						detected <= '1';
						next_state <= s0 ;
					end if;
				when s4=>
					if(input = '0') then
						detected <= '1';
						next_state <= s1;
					elsif(input = '1') then
						detected <= '0';
						next_state <= s0 ;
					end if;
				when others=>
					detected <= '0';
					next_state <= s0;
			end case;
		end process mealy_process;
		
	end Behavioral;