--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   01:20:03 12/22/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az9/az9/alu_test.vhd
-- Project Name:  az9
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ALU
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
 
ENTITY alu_test IS
END alu_test;
 
ARCHITECTURE behavior OF alu_test IS 
  
    COMPONENT ALU
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(2 downto 0);
         OUT_ALU : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(2 downto 0) := (others => '0');

   signal OUT_ALU : std_logic_vector(3 downto 0);
  
BEGIN
 
   uut: ALU PORT MAP (
          A => A,
          B => B,
          sel => sel,
          OUT_ALU => OUT_ALU
        );
 

   stim_proc: process
   begin		
      wait for 100 ns;	
			A <= "1010" ;
			B <= "0011";
			
			sel <= "010" , "011" after 100 ns , "100" after 200 ns , "101" after 300 ns , "000" after 400 ns , "001" after 500 ns ,
					 "110" after 600 ns , "111" after 700 ns ;

      wait;
   end process;

END;
