--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:10:17 10/11/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az1/full_adder_test.vhd
-- Project Name:  az1
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: full_adder
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

ENTITY full_adder_test IS
END full_adder_test;
 
ARCHITECTURE test OF full_adder_test IS 
  
    COMPONENT full_adder
    PORT(
         i0 : IN  std_logic;
         i1 : IN  std_logic;
         cin : IN  std_logic;
         s : OUT  std_logic;
         cout : OUT  std_logic
        );
    END COMPONENT;
    
   signal i0_t : std_logic;
   signal i1_t : std_logic;
   signal cin_t : std_logic;
   signal s_t : std_logic;
   signal cout_t : std_logic;

	begin
		FA: full_adder port map(i0 => i0_t,i1 => i1_t,cin => cin_t,s => s_t,cout => cout_t);
		i0_t <= '0' , '1' after 400 ns , '0' after 800 ns ;
		i1_t <= '0' , '1' after 200 ns , '0' after 400 ns , '1' after 600 ns , '0' after 800 ns ;
		cin_t <= '0' , '1' after 100 ns , '0' after 200 ns , '1' after 300 ns , '0' after 400 ns ,
			 '1' after 500 ns , '0' after 600 ns , '1' after 700 ns , '0' after 800 ns ;
   end test;
