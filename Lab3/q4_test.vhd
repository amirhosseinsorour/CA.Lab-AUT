--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:44:43 10/26/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az3/az3/q4_test.vhd
-- Project Name:  az3
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: sequence_detector_q4
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
 
ENTITY q4_test IS
END q4_test;
 
ARCHITECTURE behavior OF q4_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT sequence_detector_q4
    PORT(
         Input_s : IN  std_logic;
         Detec_moore : OUT  std_logic;
         Detec_mealy : OUT  std_logic;
         Clk_s : IN  std_logic;
         Rst_s : IN  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal Input_s : std_logic := '0';
   signal Clk_s : std_logic := '0';
   signal Rst_s : std_logic := '0';

 	--Outputs
   signal Detec_moore : std_logic;
   signal Detec_mealy : std_logic;

   -- Clock period definitions
   constant Clk_s_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: sequence_detector_q4 PORT MAP (
          Input_s => Input_s,
          Detec_moore => Detec_moore,
          Detec_mealy => Detec_mealy,
          Clk_s => Clk_s,
          Rst_s => Rst_s
        );

   -- Clock process definitions
   Clk_s_process :process
   begin
		Clk_s <= '0';
		wait for Clk_s_period/2;
		Clk_s <= '1';
		wait for Clk_s_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
		
		Rst_s <= '0' ;
		wait for Clk_s_period;
		Rst_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '0' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '0' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '0' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '0' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '0' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		wait for Clk_s_period;
		Input_s <= '0' ;
		wait for Clk_s_period;
		Input_s <= '1' ;
		
   end process;

END;
