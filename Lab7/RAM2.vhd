----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    22:17:21 11/15/2020 
-- Design Name: 
-- Module Name:    RAM2 - Behavioral 
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
use IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity RAM2 is

generic(
	W : integer := 8;
	D : integer := 4;
	C : integer := 16
	);
	
port(
	w_a , r_a , w_b , r_b , rst , clk: in std_logic;
	addr_A : in std_logic_vector(D-1 downto 0);
	addr_B : in std_logic_vector(D-1 downto 0);
	input_A : in std_logic_vector(W-1 downto 0);
	input_B : in std_logic_vector(W-1 downto 0);
	output_A : out std_logic_vector(W-1 downto 0);
	output_B : out std_logic_vector(W-1 downto 0);
	is_valid_A , is_valid_B : out std_logic
	);
	
end RAM2;

architecture RAM2_arch of RAM2 is

type mem_type is array (C-1 downto 0) of std_logic_vector(W-1 downto 0);
signal RAM2_block : mem_type := (  "00001111" ,
											  "00001110" ,
											  "00001101" ,
											  "00001100" ,
											  "00001011" ,
											  "00001010" ,
											  "00001001" ,
											  "00001000" ,
											  "00000111" ,
											  "00000110" ,
											  "00000101" ,
											  "00000100" ,
											  "00000011" ,
											  "00000010" ,
											  "00000001" ,
											  "00000000" );
begin
		
	process (clk)
		begin
			if rst = '0' then
				for i in 0 to C-1 loop
					RAM2_block(i) <= conv_std_logic_vector(i,W);
				end loop;
			elsif rising_edge(clk) then
				if addr_A = addr_B then
					if (w_a xor r_a) = '1' then
						is_valid_A <= '1' ;
						is_valid_B <= '0' ;
						if w_a = '1' then
							RAM2_block(conv_integer(addr_A)) <= input_A;
						elsif r_a = '1' then
							output_A <= RAM2_block(conv_integer(addr_A));
						end if;
					elsif (w_b xor r_b) = '1' then
						is_valid_B <= '1' ;
						is_valid_A <= '0' ;
						if w_b = '1' then
							RAM2_block(conv_integer(addr_B)) <= input_B;
						elsif r_b = '1' then
							output_B <= RAM2_block(conv_integer(addr_B));
						end if;
					else
						is_valid_A <= '0' ;
						is_valid_B <= '0' ;
					end if;
				else
					if (w_a = '1') and (r_a = '0') then
						RAM2_block(conv_integer(addr_A)) <= input_A;
						is_valid_A <= '1' ;
					elsif (w_a = '0') and (r_a = '1') then
						output_A <= RAM2_block(conv_integer(addr_A));
						is_valid_A <= '1' ;
					else
						is_valid_A <= '0';
					end if;
					if (w_b = '1') and (r_b = '0') then
						RAM2_block(conv_integer(addr_B)) <= input_B;
						is_valid_B <= '1' ;
					elsif (w_b = '0') and (r_b = '1') then
						output_B <= RAM2_block(conv_integer(addr_B));
						is_valid_B <= '1' ;
					else
						is_valid_B <= '0';
					end if;
				end if;
			end if;
		end process;

end RAM2_arch;

