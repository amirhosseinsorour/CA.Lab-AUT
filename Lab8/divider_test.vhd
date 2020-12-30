--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   00:30:17 12/08/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az8/az8/divider_test.vhd
-- Project Name:  az8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divider
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
 
ENTITY divider_test IS
END divider_test;
 
ARCHITECTURE behavior OF divider_test IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divider
    PORT(
         Dividend : IN  std_logic_vector(7 downto 0);
         Division : IN  std_logic_vector(3 downto 0);
         clk : IN  std_logic;
         zero_error : OUT  std_logic;
         overflow : OUT  std_logic;
         Reminder : OUT  std_logic_vector(3 downto 0);
         Quotient : OUT  std_logic_vector(3 downto 0)
        );
    END COMPONENT;
    

   --Inputs
   signal Dividend : std_logic_vector(7 downto 0) := (others => '0');
   signal Division : std_logic_vector(3 downto 0) := (others => '0');
   signal clk : std_logic := '0';

 	--Outputs
   signal zero_error : std_logic;
   signal overflow : std_logic;
   signal Reminder : std_logic_vector(3 downto 0);
   signal Quotient : std_logic_vector(3 downto 0);

   constant clk_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divider PORT MAP (
          Dividend => Dividend,
          Division => Division,
          clk => clk,
          zero_error => zero_error,
          overflow => overflow,
          Reminder => Reminder,
          Quotient => Quotient
        );


   stim_proc: process
   begin		
      wait for 100 ns;	

      wait for clk_period*10;

      -- insert stimulus here 
		Dividend <= "01001001" , "00011100" after 200 ns , "00110011" after 400 ns ;
		Division <= "0110" , "1100" after 50 ns , "1010" after 100 ns , "1001" after 150 ns , "1111" after 200 ns ;

      wait;
		
   end process;

END;
