--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   09:07:36 09/06/2020
-- Design Name:   
-- Module Name:   D:/Uni/Term 4/Computer Architecture/Lab/05/ise_project_5/bm_test.vhd
-- Project Name:  ise_project_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: basic_multiplier
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
 
ENTITY bm_test IS
END bm_test;
 
ARCHITECTURE behavior OF bm_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT basic_multiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal P : std_logic_vector(7 downto 0);
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: basic_multiplier PORT MAP (
          A => A,
          B => B,
          P => P
        );

 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      A <= "0101";
		B <= "1100";
		
		wait for 10 ns;
		
		A <= "1101";
		B <= "0111";
		
		wait for 10 ns;
		
		A <= "1001";
		B <= "1111";

      wait;
   end process;

END;
