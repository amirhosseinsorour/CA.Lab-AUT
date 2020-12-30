--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:23:02 11/30/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az6/az6/Reg_8bits_test.vhd
-- Project Name:  az6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Reg_8bits
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
 
ENTITY Reg_8bits_test IS
END Reg_8bits_test;
 
ARCHITECTURE behavior OF Reg_8bits_test IS 
  
    COMPONENT Reg_8bits
    PORT(
         Parallel_in : IN  std_logic_vector(7 downto 0);
         LR : IN  std_logic_vector(1 downto 0);
         LD : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         reg_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal Parallel_in : std_logic_vector(7 downto 0) := (others => '0');
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal LD : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

   signal reg_out : std_logic_vector(7 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
   uut: Reg_8bits PORT MAP (
          Parallel_in => Parallel_in,
          LR => LR,
          LD => LD,
          clk => clk,
          rst => rst,
          reg_out => reg_out
        );

   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      wait for clk_period*2;

		 rst <= '1';

      wait for clk_period*4;

      Parallel_in <= "10110111";
		LD <= '1';
		
		wait for clk_period;
		
		 LR <= "11";
		 wait for clk_period;
		 
		 LR <= "00";
		 wait for clk_period;
		 
		 LR <= "10";
		 wait for clk_period;
		 
		 LR <= "01";
		 wait for clk_period;
		 
		 LD <= '0';
		 wait for clk_period;
	 
		 LR <= "00";
			wait for clk_period;
			 
		 LR <= "11";

      wait;
   end process;


END;
