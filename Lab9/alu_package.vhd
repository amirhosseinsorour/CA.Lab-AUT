--
--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 
--
--   To use any of the example code shown below, uncomment the lines and modify as necessary
--

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package alu_package is

	 constant  inc_A_op : std_logic_vector := "000" ;
	 constant  dec_A_op : std_logic_vector := "001" ;
	 constant  add_op : std_logic_vector := "010" ;
	 constant  sub_op : std_logic_vector := "011" ;
	 constant  ror_op : std_logic_vector := "100" ;
	 constant  rol_op : std_logic_vector := "101" ;
	 constant  or_op : std_logic_vector := "110" ;
	 constant  and_op : std_logic_vector := "111" ;

	function or_4bits(A,B : in std_logic_vector(3 downto 0)) return std_logic_vector ;
	function and_4bits(A,B : in std_logic_vector(3 downto 0)) return std_logic_vector ;
	function ro_left(A : in std_logic_vector(3 downto 0)) return std_logic_vector ;
	function ro_right(A : in std_logic_vector(3 downto 0)) return std_logic_vector ;



end alu_package;

package body alu_package is

	function or_4bits(A,B : in std_logic_vector(3 downto 0)) return std_logic_vector is
		variable C : std_logic_vector(3 downto 0) ;
		begin
				C := A or B ;
			return C ;
		end or_4bits;
	
	function and_4bits(A,B : in std_logic_vector(3 downto 0)) return std_logic_vector is
		variable C : std_logic_vector(3 downto 0) ;
		begin
				C := A and B ;
			return C ;
		end and_4bits;
	
	function ro_left(A : in std_logic_vector(3 downto 0)) return std_logic_vector is
		variable ro_A : std_logic_vector(3 downto 0) ;
		begin
				ro_A(3 downto 1) := A(2 downto 0) ;
				ro_A(0) := A(3) ;
			return ro_A ;
		end ro_left;
	
	function ro_right(A : in std_logic_vector(3 downto 0)) return std_logic_vector is
		variable ro_A : std_logic_vector(3 downto 0) ;
		begin
				ro_A(2 downto 0) := A(3 downto 1) ;
				ro_A(3) := A(0) ;
			return ro_A ;
		end ro_right;

end alu_package;
