--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:25:10 11/30/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az6/az6/Top_module_test.vhd
-- Project Name:  az6
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: Top_module
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
 
ENTITY Top_module_test IS
END Top_module_test;
 
ARCHITECTURE behavior OF Top_module_test IS 
  
    COMPONENT Top_module
    PORT(
         Parallel_in : IN  std_logic_vector(7 downto 0);
         LR : IN  std_logic_vector(1 downto 0);
         LD : IN  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic;
         seg_sel : OUT  std_logic_vector(4 downto 0);
         seg_data : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Parallel_in : std_logic_vector(7 downto 0) := (others => '0');
   signal LR : std_logic_vector(1 downto 0) := (others => '0');
   signal LD : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal seg_sel : std_logic_vector(4 downto 0);
   signal seg_data : std_logic_vector(7 downto 0);

   -- Clock period definitions
   constant clk_period : time := 2.5 ms;
	constant clk_period2 : time := 1000 ms ;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: Top_module PORT MAP (
          Parallel_in => Parallel_in,
          LR => LR,
          LD => LD,
          clk => clk,
          rst => rst,
          seg_sel => seg_sel,
          seg_data => seg_data
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
      wait for clk_period*2;

		 rst <= '1';

      wait for clk_period2;

      Parallel_in <= "10110111";
		LD <= '1';
		
		wait for clk_period2;
		
		 LR <= "11";
		 wait for clk_period2;
		 
		 LR <= "00";
		 wait for clk_period2;
		 
		 LR <= "10";
		 wait for clk_period2;
		 
		 LR <= "01";
		 wait for clk_period2;
		 
		 LD <= '0';
		 wait for clk_period2;
	 
		 LR <= "00";
			wait for clk_period2;
			 
		 LR <= "11";

      wait;
   end process;

END;
