--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   13:36:08 08/22/2020
-- Design Name:   
-- Module Name:   D:/Uni/Term 4/Computer Architecture/Lab/02/ise_project/decoder_1x2x4_test.vhd
-- Project Name:  ise_project
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: decoder_1x2x4
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
 
ENTITY decoder_1x2x4_test IS
END decoder_1x2x4_test;
 
ARCHITECTURE behavior OF decoder_1x2x4_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT decoder_1x2x4
    PORT(
         sel : IN  std_logic_vector(1 downto 0);
         e : IN  std_logic;
         output : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal sel : std_logic_vector(1 downto 0) := (others => '0');
   signal e : std_logic := '0';

 	--Outputs
   signal output : std_logic_vector(3 downto 0);
 
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: decoder_1x2x4 PORT MAP (
          sel => sel,
          e => e,
          output => output
        );

   -- Stimulus process
   stim_proc: process
   begin		
      -- hold reset state for 100 ns.
      wait for 100 ns;	

		e <= '0';
		
		sel <= "00";
		wait for 10 ns;
		sel <= "01";
		wait for 10 ns;
		sel <= "10";
		wait for 10 ns;
		sel <= "11";
		wait for 10 ns;
		
		
		e <= '1';
		
		sel <= "00";
		wait for 10 ns;
		sel <= "01";
		wait for 10 ns;
		sel <= "10";
		wait for 10 ns;
		sel <= "11";
		wait for 10 ns;

      wait;
   end process;

END;
