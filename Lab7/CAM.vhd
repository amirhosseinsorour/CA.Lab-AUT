----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    10:56:57 11/15/2020 
-- Design Name: 
-- Module Name:    CAM - Behavioral 
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

entity CAM is

generic(
	W1 : integer := 8;
	D : integer := 4;
	C : integer := 16
	);

port(
	w , r , rst , clk: in std_logic;
	data_in : in std_logic_vector(W1-1 downto 0);
	addr_out : out std_logic_vector(C-1 downto 0);
	hit_out : out std_logic;
	is_valid : out std_logic
	);

end CAM;

architecture CAM_arch of CAM is

type mem_type is array (C-1 downto 0) of std_logic_vector(W1-1 downto 0);
signal CAM_block : mem_type := (   "00001111" ,
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
signal data_found : std_logic;

begin

	process (clk)
		begin
			if rst = '0' then
				for i in 0 to C-1 loop
					CAM_block(i) <= conv_std_logic_vector(i,W1);
				end loop;
			elsif rising_edge(clk) then
				for i in 0 to C-1 loop
					if data_in = CAM_block(i) then
						hit_out <= '1';
						data_found <= '1';
						if (w xor r) = '1' then
							addr_out <= conv_std_logic_vector(i,C) ;
							is_valid <= '1' ;
						else
							is_valid <= '0';
						exit;
						end if;
					end if;
					hit_out <= '0';
					data_found <= '0';
				end loop;
				if (data_found = '0') and (w = '1') and (r = '0') then
					for i in 0 to C-1 loop
						if CAM_block(i) = conv_std_logic_vector(i,W1) then
							CAM_block(i) <= data_in ;
						exit;
						end if;
					end loop;
				end if;
			end if;
		end process;

end CAM_arch;

