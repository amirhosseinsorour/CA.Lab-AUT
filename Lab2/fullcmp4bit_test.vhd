--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   10:10:19 08/23/2020
-- Design Name:   
-- Module Name:   D:/Uni/Term 4/Computer Architecture/Lab/02/ise_project/fullcmp4bit_test.vhd
-- Project Name:  ise_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: fullcmp4bit
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
 
ENTITY fullcmp4bit_test IS
END fullcmp4bit_test;
 
ARCHITECTURE behavior OF fullcmp4bit_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT fullcmp4bit
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         gt_out : OUT  std_logic;
         eq_out : OUT  std_logic;
         lt_out : OUT  std_logic
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');

 	--Outputs
   signal gt_out : std_logic;
   signal eq_out : std_logic;
   signal lt_out : std_logic;

BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: fullcmp4bit PORT MAP (
          a => a,
          b => b,
          gt_out => gt_out,
          eq_out => eq_out,
          lt_out => lt_out
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

      a <= "1011";
		b <= "1000";
		wait for 10 ns;
		
		a <= "1010";
		b <= "1010";
		wait for 10 ns;
		
      a <= "0011";
		b <= "1000";
		wait for 10 ns;

      wait;
   end process;

END;
