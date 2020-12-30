--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   08:32:12 12/08/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az8/az8/divider_test2.vhd
-- Project Name:  az8
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: divider2
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
USE ieee.numeric_std.ALL;
 
-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY divider_test2 IS
END divider_test2;
 
ARCHITECTURE behavior OF divider_test2 IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    COMPONENT divider3
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

   -- Clock period definitions
   constant clk_period : time := 1 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: divider3 PORT MAP (
          Dividend => Dividend,
          Division => Division,
          clk => clk,
          zero_error => zero_error,
          overflow => overflow,
          Reminder => Reminder,
          Quotient => Quotient
        );

   -- Clock process definitions
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      --wait for clk_period*10;
		
		dividend <=
		X"0A" after 00 ns ,
		X"30" after 100 ns ,
		X"18" after 200 ns ,
		X"20" after 300 ns ,
		X"39" after 400 ns ,
		X"53" after 500 ns ,
		X"62" after 600 ns ,
		X"15" after 700 ns ,
		X"6D" after 800 ns ,
		X"FF" after 900 ns ,
		X"08" after 1000 ns ;

		division <=
		X"2" after 000 ns ,
		X"5" after 100 ns ,
		X"6" after 150 ns ,
		X"0" after 250 ns ,
		X"E" after 350 ns ,
		X"4" after 450 ns ,
		X"8" after 550 ns ,
		X"9" after 650 ns ,
		X"7" after 750 ns ,
		X"3" after 850 ns ,
		X"A" after 950 ns ,
		X"B" after 1050 ns ;

      wait;
   end process;

END;
