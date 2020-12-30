--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:21:03 08/22/2020
-- Design Name:   
-- Module Name:   D:/Uni/Term 4/Computer Architecture/Lab/02/ise_project/mux_4x4x1_test.vhd
-- Project Name:  ise_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: mux_4x4x1
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
 
ENTITY mux_4x4x1_test IS
END mux_4x4x1_test;
 
ARCHITECTURE behavior OF mux_4x4x1_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT mux_4x4x1
    PORT(
         a : IN  std_logic_vector(3 downto 0);
         b : IN  std_logic_vector(3 downto 0);
         c : IN  std_logic_vector(3 downto 0);
         d : IN  std_logic_vector(3 downto 0);
         sel : IN  std_logic_vector(1 downto 0);
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal a : std_logic_vector(3 downto 0) := (others => '0');
   signal b : std_logic_vector(3 downto 0) := (others => '0');
   signal c : std_logic_vector(3 downto 0) := (others => '0');
   signal d : std_logic_vector(3 downto 0) := (others => '0');
   signal sel : std_logic_vector(1 downto 0) := (others => '0');

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: mux_4x4x1 PORT MAP (
          a => a,
          b => b,
          c => c,
          d => d,
          sel => sel,
          output => output
        );
 

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 90 ns;	

      -- insert stimulus here 
		a <= "0001";
		b <= "0011";
		c <= "0111";
		d <= "1111";
		
		wait for 10 ns;
		sel <= "00";
		
		wait for 10 ns;
		sel <= "01";
		
		wait for 10 ns;
		sel <= "10";
		
		wait for 10 ns;
		sel <= "11";

      wait;
   end process;

END;
