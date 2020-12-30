--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:14:11 11/24/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az5/azz5/ise_project_5/am_test.vhd
-- Project Name:  ise_project_5
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: array_multiplier
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
 
ENTITY am_test IS
END am_test;
 
ARCHITECTURE behavior OF am_test IS 
  
    COMPONENT array_multiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

   signal P : std_logic_vector(7 downto 0);
  
BEGIN
 
   uut: array_multiplier PORT MAP (
          A => A,
          B => B,
          P => P
        );


   stim_proc: process
   begin		
      wait for 50 ns;	
			
	   A <= "1000";
		B <= "1101";
		
		wait for 150 ns;
		
		A <= "0100";
		B <= "1010";
		
		wait for 150 ns;
		
		A <= "1111";
		B <= "0001";
		
		wait for 150 ns;
		
	   A <= "1011";
		B <= "0000";
		
		wait for 150 ns;
		
		A <= "0001";
		B <= "1000";
		
      wait;
   end process;

END;
