--------------------------------------------------------------------------------
-- Company: 
-- Engineer:
--
-- Create Date:   23:13:06 11/15/2020
-- Design Name:   
-- Module Name:   D:/Computer Architecture/Architecture Lab/az7/az7/mem_test.vhd
-- Project Name:  az7
-- Target Device:  
-- Tool versions:  
-- Description:   
-- 
-- VHDL Test Bench Created by ISE for module: ROM
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
USE IEEE.STD_LOGIC_unsigned.ALL;
USE IEEE.STD_LOGIC_arith.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--USE ieee.numeric_std.ALL;
 
ENTITY mem_test IS
END mem_test;
 
ARCHITECTURE behavior OF mem_test IS 
 
    COMPONENT ROM
    PORT(
         clk : IN  std_logic;
         addr : IN  std_logic_vector(3 downto 0);
         data_out : OUT  std_logic_vector(7 downto 0)
        );
    END COMPONENT;
    
	 COMPONENT RAM
    PORT(
			w , r , rst , clk: IN std_logic;
			addr : IN std_logic_vector(D-1 downto 0);
			data_in : IN std_logic_vector(W1-1 downto 0);
			data_out : OUT std_logic_vector(W1-1 downto 0);
			is_valid : OUT std_logic
        );
    END COMPONENT;
	 
	 COMPONENT RAM2
    PORT(
			w_a , r_a , w_b , r_b , rst , clk: IN std_logic;
			addr_A : IN std_logic_vector(D-1 downto 0);
			addr_B : IN std_logic_vector(D-1 downto 0);
			input_A : IN std_logic_vector(W-1 downto 0);
			input_B : IN std_logic_vector(W-1 downto 0);
			output_A : OUT std_logic_vector(W-1 downto 0);
			output_B : OUT std_logic_vector(W-1 downto 0);
			is_valid_A , is_valid_B : OUT std_logic
        );
    END COMPONENT;
	 
    COMPONENT CAM
    PORT(
			w , r , rst , clk: IN std_logic;
			data_in : IN std_logic_vector(W1-1 downto 0);
			addr_out : OUT std_logic_vector(C-1 downto 0);
			hit_out : OUT std_logic;
			is_valid : OUT std_logic
        );
    END COMPONENT;


   signal clk : std_logic := '0';
	
   signal addr_ROM : std_logic_vector(3 downto 0) := (others => '0');
	signal addr_RAM : std_logic_vector(3 downto 0) := (others => '0');
	signal addr_CAM : std_logic_vector(3 downto 0) := (others => '0');
	signal addr_A_RAM2 : std_logic_vector(3 downto 0) := (others => '0');
	signal addr_B_RAM2 : std_logic_vector(3 downto 0) := (others => '0');
	
	signal data_in_RAM : std_logic_vector(3 downto 0) := (others => '0');
	signal input_A_RAM2 : std_logic_vector(7 downto 0) := (others => '0');
	signal input_B_RAM2 : std_logic_vector(7 downto 0) := (others => '0');
	
   signal data_out_ROM : std_logic_vector(7 downto 0);


   constant clk_period : time := 10 ns;
 
BEGIN
 
   clk_process :process
   begin
		clk <= '0';
		wait for clk_period/2;
		clk <= '1';
		wait for clk_period/2;
   end process;


END;
