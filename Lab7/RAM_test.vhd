--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:00:34 11/16/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az7/az7/RAM_test.vhd
-- Project Name:  az7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: RAM
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
 
ENTITY RAM_test IS
END RAM_test;
 
ARCHITECTURE behavior OF RAM_test IS 
  
    COMPONENT RAM
    PORT(
         w : IN  std_logic;
         r : IN  std_logic;
         rst : IN  std_logic;
         clk : IN  std_logic;
         addr : IN  std_logic_vector(3 downto 0);
         data_in : IN  std_logic_vector(7 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0);
         is_valid : OUT  std_logic
        );
    END COMPONENT;
    
   signal w : std_logic := '0';
   signal r : std_logic := '0';
   signal rst : std_logic := '0';
   signal clk : std_logic := '0';
   signal addr : std_logic_vector(3 downto 0) := (others => '0');
   signal data_in : std_logic_vector(7 downto 0) := (others => '0');

   signal data_out : std_logic_vector(7 downto 0);
   signal is_valid : std_logic;

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: RAM PORT MAP (
          w => w,
          r => r,
          rst => rst,
          clk => clk,
          addr => addr,
          data_in => data_in,
          data_out => data_out,
          is_valid => is_valid
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
		addr <= "0010" , "0110" after 200 ns , "1010" after 400 ns , "1111" after 600 ns , "1001" after 800 ns;
		data_in <= "01011010" , "10100101" after 300 ns , "11111111" after 600 ns , "10001000" after 900 ns ;
		for i in 1 to 16 loop
			r <= not r ;
			wait for 25 ns;
			w <= not w ;
			wait for 25 ns;
		end loop;

      wait;
   end process;

END;
