--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:45:36 11/24/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az5/azz5/ise_project_5/multipliers_test.vhd
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
 
ENTITY multipliers_test IS
END multipliers_test;
 
ARCHITECTURE behavior OF multipliers_test IS 
  
    COMPONENT array_multiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT basic_multiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
	 
	 COMPONENT carry_save_multiplier
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         P : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;

   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');

   signal bm_P : std_logic_vector(7 downto 0);
	signal am_P : std_logic_vector(7 downto 0);
	signal csm_P : std_logic_vector(7 downto 0);
 
BEGIN
 
   am: array_multiplier PORT MAP (
          A => A,
          B => B,
          P => am_P
        );
	bm: basic_multiplier PORT MAP (
          A => A,
          B => B,
          P => bm_P
        );
	csm: carry_save_multiplier PORT MAP (
          A => A,
          B => B,
          P => csm_P
        );
		  
   stim_proc: process
   begin		
      --wait for 50 ns;	
		
			A <=
		X"0" after 00 ns ,
		X"3" after 10 ns ,
		X"5" after 20 ns ,
		X"7" after 30 ns ,
		X"9" after 40 ns ,
		X"4" after 50 ns ,
		X"A" after 60 ns ,
		X"B" after 70 ns ,
		X"D" after 80 ns ,
		X"F" after 90 ns ,
		X"9" after 100 ns ,
		X"3" after 110 ns ;

	B <=
		X"1" after 00 ns ,
		X"2" after 05 ns ,
		X"6" after 15 ns ,
		X"A" after 25 ns ,
		X"E" after 35 ns ,
		X"4" after 45 ns ,
		X"8" after 55 ns ,
		X"9" after 65 ns ,
		X"4" after 75 ns ,
		X"C" after 85 ns ,
		X"6" after 95 ns ,
		X"2" after 105 ns ,
		X"1" after 115 ns ;
		
      wait;
   end process;

END;
