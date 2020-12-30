--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:02:27 10/26/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az3/az3/q5_test.vhd
-- Project Name:  az3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: q5_mealy
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
 
ENTITY q5_test IS
END q5_test;
 
ARCHITECTURE behavior OF q5_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT q5_mealy
    PORT(
         input : IN  std_logic;
         detected : OUT  std_logic;
         clk : IN  std_logic;
         rst : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic := '0';
   signal clk : std_logic := '0';
   signal rst : std_logic := '0';

 	--Outputs
   signal detected : std_logic;

   -- Clock period definitions
   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: q5_mealy PORT MAP (
          input => input,
          detected => detected,
          clk => clk,
          rst => rst
        );

   -- Clock process definitions
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
		
		rst <= '0' ;
		wait for clk_period;
		rst <= '1' ;
		wait for clk_period;
		input <= '0' ;
		wait for clk_period;
		input <= '1' ;
		wait for clk_period;
		input <= '1' ;
		wait for clk_period;
		input <= '0' ;
		wait for clk_period;
		input <= '1' ;
		wait for clk_period;
		input <= '1' ;
		wait for clk_period;
		input <= '0' ;
		wait for clk_period;
		input <= '1' ;
		wait for clk_period;
		input <= '0' ;
		wait for clk_period;
		input <= '1' ;
		wait for clk_period;
		input <= '0' ;
		wait for clk_period;
		input <= '1' ;
		wait for clk_period;
		input <= '1' ;
		wait for clk_period;
		input <= '0' ;
		wait for clk_period;
		input <= '1' ;
		
   end process;

END;
