----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    12:49:46 12/28/2020 
-- Design Name: 
-- Module Name:    CPU - Behavioral 
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
use IEEE.numeric_std.ALL;
use ieee.std_logic_unsigned.all;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CPU is
    Port ( Data_in : in  STD_LOGIC_VECTOR (7 downto 0);
           clk : in  STD_LOGIC;
           rst : in  STD_LOGIC;
           Data_out : out  STD_LOGIC_VECTOR (7 downto 0);
           Address : out  STD_LOGIC_VECTOR (4 downto 0);
           we : out  STD_LOGIC;
           oe : out  STD_LOGIC);
end CPU;

architecture Behavioral of CPU is

	signal Akku : STD_LOGIC_VECTOR (8 downto 0);
	signal PC : STD_LOGIC_VECTOR (4 downto 0);
	signal Adreg : STD_LOGIC_VECTOR (4 downto 0);
	signal opcode : STD_LOGIC_VECTOR (2 downto 0); 
	type state_t is (si ,s0 ,s1 ,s2 ,s3 ,s4 ,s5 ,s6 ,s7 ,sr ,sw ,sf);
	signal state : state_t := si;

begin
	
	--Address <= Adreg ;
	process(clk,rst)
		begin
			if (rst = '0') then
				Akku <= "000000000";
				PC <= "00000";
				ADREG <= "00000";
				state <= si;
				oe <= '1';
				we <= '0';
			else
				if(rising_edge (clk)) then
					case state is
						when si => -- initial state : reading instructions
							opcode <= Data_in(7 downto 5);
							Adreg <= Data_in(4 downto 0);
							we <= '0' ;
							--oe <= '1' ;
							Data_out <= "ZZZZZZZZ" ;
							if(Data_in /= "ZZZZZZZZ") then
								PC <= std_logic_vector(unsigned(PC) + 1) ;
								oe <= '0';
								state <= s0;
							end if;
						when s0 => --assigning states by opcode
							case opcode is
								when "000" => -- ACC <= [ADDR]
									Address <= Adreg ;
									oe <= '1' ;
									state <= sr ;
								when "001" => -- [ADDR] <= ACC
									Address <= Adreg ; ----------------
									oe <= '0' ;
									state <=  s2;
								when "010" => -- JUMP TO ADDR
									oe <= '0';
									state <= s3;
								when "011" => -- IF CARRY ==1 : JUMP TO ADDR
									if (Akku(8) = '1') then 
										state <= s3;
									end if;
									oe <= '0';
								when "100" => -- ACC <= ACC & [ADDR]
									Address <= Adreg ;
									oe <= '1' ;
									state <= sr ;
								when "101" => -- ACC <= ACC + [ADDR]
									Address <= Adreg ;
									oe <= '1' ;
									state <= sr ;
								when "110" => -- ACC <= not ACC
									state <= s6;
									oe <= '0';
								when "111" => -- ACC <= ACC >> 1
									state <= s7;
									oe <= '0';
								when others =>
									Akku <= "000000000";
									PC <= "00000";
									ADREG <= "00000";
									state <= si;
									Adreg <= PC;
									oe <= '1';
									we <= '0';
							end case;
						when s1 => -- ACC <= [ADDR]
							Akku(8) <= '0';
							Akku(7 downto 0) <= Data_in;
							Address <= PC ;
							oe <= '1';
							state <= sf;
						when s2 => -- [ADDR] <= ACC
							Data_out <= Akku(7 downto 0);
							we <= '1';
							state <= sw;
						when s3 => -- JUMP TO ADDR --------------
							PC <= Adreg;
							Address <= Adreg;
							oe <= '1';
							state <= sf;
						when s4 => -- ACC <= ACC & [ADDR]
							Akku(8) <= '0';
							Akku(7 downto 0) <= AKKU(7 downto 0) and Data_in;
							Address <= PC ;
							oe <= '1';
							state <= sf;
						when s5 => -- ACC <= ACC + [ADDR]
							Akku <= Akku + Data_in;
							Address <= PC ;
							oe <= '1';
							state <= sf;
						when s6 => -- ACC <= not ACC
							Akku(7 downto 0) <= NOT Akku(7 downto 0);
							Address <= PC;
							oe <= '1';
							state <= sf;
						when s7 => -- ACC <= ACC >> 1
							Akku <= '0' & Akku(8 downto 1);
							Address <= PC;
							oe <= '1';
							state <= sf;
						when sr => -- Read from Memory
							oe <= '0';
							case opcode is
								when "000" => state <= s1 ;
								when "100" => state <= s4 ;
								when "101" => state <= s5 ;
								when others => Address <= PC ; oe <= '1' ; state <= sf ;
							end case;
						when sw => -- Write to Memory
							we <= '0';
							oe <= '1';
							Address <= PC;
							state <= sf;
						when sf => -- final state
							state <= si;
							we <= '0';
							oe <= '0';
						when others => state <= sf ;
					end case;
				end if;
			end if;
		end process;
		
end Behavioral;

