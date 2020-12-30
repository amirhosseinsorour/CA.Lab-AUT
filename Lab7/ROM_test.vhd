--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   12:44:51 11/16/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az7/az7/ROM_test.vhd
-- Project Name:  az7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
USE IEEE.STD_LOGIC_unsigned.ALL;
USE IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY ROM_test IS
END ROM_test;
 
ARCHITECTURE behavior OF ROM_test IS 
  
    COMPONENT ROM
    PORT(
         clk : IN  std_logic;
         addr : IN  std_logic_vector(3 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   signal clk : std_logic := '0';
   signal addr : std_logic_vector(3 downto 0) := (others => '0');
   signal data_out : std_logic_vector(7 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN

   uut: ROM PORT MAP (
          clk => clk,
          addr => addr,
          data_out => data_out
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
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      wait for clk_period*10;
		
		addr <= "0010" , "0110" after 200 ns , "1010" after 400 ns , "1111" after 600 ns , "1001" after 800 ns;

      wait;
   end process;

END;
