--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:41:22 11/16/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az7/az7/RAM2_test.vhd
-- Project Name:  az7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM2
-- 
-- Dependencies:
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
--
-- Notes: 
-- This testbench has been automatically generated using types std_logic and
-- std_logic_vector for the ports of the unit under test.  Xilinx recommends
-- that these types always be used for the top-level I/O of a design in order
-- to guarantee that the testbench will bind correctly to the post-implementation 
-- simulation model.
--------------------------------------------------------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY RAM2_test IS
END RAM2_test;
 
ARCHITECTURE behavior OF RAM2_test IS 
 
    COMPONENT RAM2
    PORT(
         w_a : IN  std_logic;
         r_a : IN  std_logic;
         w_b : IN  std_logic;
         r_b : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         addr_A : IN  std_logic_vector(3 downto 0);
         addr_B : IN  std_logic_vector(3 downto 0);
         input_A : IN  std_logic_vector(7 downto 0);
         input_B : IN  std_logic_vector(7 downto 0);
         output_A : OUT  std_logic_vector(7 downto 0);
         output_B : OUT  std_logic_vector(7 downto 0);
         is_valid_A : OUT  std_logic;
         is_valid_B : OUT  std_logic
        );
    END COMPONENT;
    

   signal w_a : std_logic := '0';
   signal r_a : std_logic := '0';
   signal w_b : std_logic := '0';
   signal r_b : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal addr_A : std_logic_vector(3 downto 0) := (others => '0');
   signal addr_B : std_logic_vector(3 downto 0) := (others => '0');
   signal input_A : std_logic_vector(7 downto 0) := (others => '0');
   signal input_B : std_logic_vector(7 downto 0) := (others => '0');

   signal output_A : std_logic_vector(7 downto 0);
   signal output_B : std_logic_vector(7 downto 0);
   signal is_valid_A : std_logic;
   signal is_valid_B : std_logic;

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: RAM2 PORT MAP (
          w_a => w_a,
          r_a => r_a,
          w_b => w_b,
          r_b => r_b,
          rst => rst,
          clk => clk,
          addr_A => addr_A,
          addr_B => addr_B,
          input_A => input_A,
          input_B => input_B,
          output_A => output_A,
          output_B => output_B,
          is_valid_A => is_valid_A,
          is_valid_B => is_valid_B
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   stim_proc: process
   begin		
      wait for 100 ns;	

      wait for clk_period*10;

		rst <= '1' ; 
		addr_A <= "0010" , "0110" after 200 ns , "1111" after 400 ns , "1010" after 600 ns , "1001" after 800 ns;
		addr_B <= "0011" , "0111" after 200 ns , "1111" after 400 ns , "1011" after 600 ns , "1101" after 800 ns;
		input_A <= "01011010" , "10100101" after 300 ns , "11111111" after 600 ns , "10001000" after 900 ns ;
		input_B <= "01111010" , "10101101" after 300 ns , "11110011" after 600 ns , "10101010" after 900 ns ;
		for i in 1 to 16 loop
			r_a <= not r_a ;
			if i > 1 then
				w_b <= not w_b ;
			end if;
			wait for 25 ns ;
			w_a <= not w_a ;
			r_b <= not r_b ;
			wait for 25 ns ;
		end loop;

      wait;
   end process;

END;
