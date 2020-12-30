--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:01:39 08/22/2020
-- Design Name:   
-- Module Name:   D:/Uni/Term 4/Computer Architecture/Lab/02/ise_project/encoder_1x4x2_test.vhd
-- Project Name:  ise_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: encoder_1x4x2
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
 
ENTITY encoder_1x4x2_test IS
END encoder_1x4x2_test;
 
ARCHITECTURE behavior OF encoder_1x4x2_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT encoder_1x4x2
    PORT(
         input : IN  std_logic_vector(3 downto 0);
         output : OUT  std_logic_vector(1 downto 0);
         v : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal input : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(1 downto 0);
   signal v : std_logic;

 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: encoder_1x4x2 PORT MAP (
          input => input,
          output => output,
          v => v
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      -- insert stimulus here
		
		input <= "1000";
		wait for 10 ns;
		
		input <= "0100";
		wait for 10 ns;
		
		input <= "0010";
		wait for 10 ns;
		
		input <= "0001";
		wait for 10 ns;

      wait;
   end process;

END;
