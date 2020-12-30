--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   14:23:16 11/09/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az4/az4/adders_test.vhd
-- Project Name:  az4
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: carry_look_ahead_adder
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
 
ENTITY adders_test IS
END adders_test;
 
ARCHITECTURE behavior OF adders_test IS 

 
    COMPONENT carry_look_ahead_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT carry_look_ahead_adder;
	 
	 COMPONENT carry_select_adder
    PORT ( A : in  STD_LOGIC_VECTOR (3 downto 0);
           B : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           Sum : out  STD_LOGIC_VECTOR (3 downto 0);
           cout : out  STD_LOGIC);
	 END COMPONENT carry_select_adder;
	 
	 COMPONENT carry_ripple_adder
    PORT(
         A : IN  std_logic_vector(3 downto 0);
         B : IN  std_logic_vector(3 downto 0);
         cin : IN  std_logic;
         Sum : OUT  std_logic_vector(3 downto 0);
         cout : OUT  std_logic
        );
    END COMPONENT carry_ripple_adder;
    


   signal A : std_logic_vector(3 downto 0) := (others => '0');
   signal B : std_logic_vector(3 downto 0) := (others => '0');
   signal cin : std_logic := '0';

   signal Sum_CLA,Sum_CSA,Sum_CRA : std_logic_vector(3 downto 0);
   signal cout_CLA,cout_CSA,cout_CRA : std_logic;

BEGIN

	CLA : carry_look_ahead_adder port map (A => A , B => B , cin => cin , Sum => Sum_CLA , cout => cout_CLA);
	CSA : carry_select_adder port map (A => A , B => B , cin => cin , Sum => Sum_CSA , cout => cout_CSA);
	CRA : carry_ripple_adder port map (A => A , B => B , cin => cin , Sum => Sum_CRA , cout => cout_CRA);
	A <= "1001" , "1010" after 400 ns , "1100" after 800 ns;
	B <= "0001" , "0010" after 200 ns , "0011" after 400 ns , "0100" after 600 ns , "0101" after 800 ns;
	
--	clk_process : process
--		begin
--			clk_in <= '0';
--			wait for	clk_period/2;
--			clk_in <= '1';
--			wait for	clk_period/2;
--		end process
		
END;
