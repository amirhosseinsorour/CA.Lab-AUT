----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:25:05 12/08/2020 
-- Design Name: 
-- Module Name:    divider4 - Behavioral 
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
use IEEE.STD_LOGIC_unsigned.ALL;
use IEEE.NUMERIC_STD.ALL;


-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity divider4 is
	PORT(
		  Dividend : in std_logic_vector(7 downto 0);
		  Division : in std_logic_vector(3 downto 0);
		  clk : in std_logic ;
		  zero_error : out std_logic ;
		  overflow : out std_logic ;
		  Reminder : out std_logic_vector(3 downto 0) ;
		  Quotient : out std_logic_vector(3 downto 0) 
		  );
end divider4;

architecture Behavioral of divider4 is

type state_t is (s0 , s1 , s2 , s3, s4, s5, sf,finish);
		signal state : state_t := sf;
		signal nxtstate : state_t := sf;
		signal EAQ :std_logic_vector(8 downto 0);
		signal sc :unsigned(2 downto 0);

begin

	CMB: process(state,Dividend,Division)
		begin
		case state is
		when sf =>
				EAQ(7 downto 0) <= Dividend;
				if(Division = "0000") then
					zero_error <= '1';
					nxtstate <= finish ;
				else
					zero_error <= '0' ;
					nxtstate <= s0;
					sc <= "100";
				end if;
			when s0=>
				EAQ(8 downto 4) <=  EAQ(7 downto 4) + NOT(Division) + "00001";
				nxtstate <= s1;
			when s1 =>  
				if EAQ(8) = '0' then
				EAQ(8 downto 4) <= EAQ(7 downto 4) + std_logic_vector(resize(unsigned(Division),5));
					overflow <= '0';
					nxtstate <= s2;
				else 
				EAQ(8 downto 4) <= EAQ(7 downto 4) +std_logic_vector(resize(unsigned(Division),5));
					overflow <= '1';
					nxtstate <= finish;
				end if;
			when s2 =>
				EAQ(8 downto 0) <= EAQ(7 downto 0)&'0';
				nxtstate <= s3;
			when s3 =>
				if EAQ(8) = '1' then 
					EAQ(8 downto 4) <=  EAQ(7 downto 4) + std_logic_vector(resize(unsigned(not(Division)),5)) + "00001";
					EAQ (3) <= '1';
					sc <= sc - 1;
					nxtstate <= s5;
				else 
					EAQ(8 downto 4) <= EAQ(7 downto 4)  + std_logic_vector(resize(unsigned(not(Division)),5)) + "00001";
					nxtstate <= s4;
				end if;
			when s4 =>
				if EAQ(8) = '1' then 
					EAQ (0) <= '1';
					sc <= sc - 1;
					nxtstate <= s5;
				else 
					EAQ(8 downto 4) <= EAQ(7 downto 4) + std_logic_vector(resize(unsigned(Division),5));
					sc <= sc - 1;
					nxtstate <= s5;
				end if;
			when s5 =>
				if sc = 0 then 
					nxtstate <= finish;
				else
					nxtstate <= s2;
				end if;
			when finish =>
				Quotient <= EAQ(3 downto 0);
				Reminder <= EAQ(7 downto 4);
				nxtstate <= sf ;

		end case;			

		end process;

 process(clk)
			begin 
			  if (rising_edge(clk)) then
            state <= nxtstate;
					end if;
		end process;

end Behavioral;

