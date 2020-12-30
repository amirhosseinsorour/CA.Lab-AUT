--------------------------------------------------------------------------------
-- Copyright (c) 1995-2013 Xilinx, Inc.  All rights reserved.
--------------------------------------------------------------------------------
--   ____  ____
--  /   /\/   /
-- /___/  \  /    Vendor: Xilinx
-- \   \   \/     Version: P.20131013
--  \   \         Application: netgen
--  /   /         Filename: divider3_synthesis.vhd
-- /___/   /\     Timestamp: Tue Dec 08 10:16:05 2020
-- \   \  /  \ 
--  \___\/\___\
--             
-- Command	: -intstyle ise -ar Structure -tm divider3 -w -dir netgen/synthesis -ofmt vhdl -sim divider3.ngc divider3_synthesis.vhd 
-- Device	: xc3s400-5-pq208
-- Input file	: divider3.ngc
-- Output file	: D:\Computer Architecture\Architecture Lab\az8\az8\netgen\synthesis\divider3_synthesis.vhd
-- # of Entities	: 1
-- Design Name	: divider3
-- Xilinx	: C:\Xilinx\14.7\ISE_DS\ISE\
--             
-- Purpose:    
--     This VHDL netlist is a verification model and uses simulation 
--     primitives which may not represent the true implementation of the 
--     device, however the netlist is functionally correct and should not 
--     be modified. This file cannot be synthesized and should only be used 
--     with supported simulation tools.
--             
-- Reference:  
--     Command Line Tools User Guide, Chapter 23
--     Synthesis and Simulation Design Guide, Chapter 6
--             
--------------------------------------------------------------------------------

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
library UNISIM;
use UNISIM.VCOMPONENTS.ALL;
use UNISIM.VPKG.ALL;

entity divider3 is
  port (
    clk : in STD_LOGIC := 'X'; 
    overflow : out STD_LOGIC; 
    zero_error : out STD_LOGIC; 
    Quotient : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    Reminder : out STD_LOGIC_VECTOR ( 3 downto 0 ); 
    Dividend : in STD_LOGIC_VECTOR ( 7 downto 0 ); 
    Division : in STD_LOGIC_VECTOR ( 3 downto 0 ) 
  );
end divider3;

architecture Structure of divider3 is
  signal Dividend_0_IBUF_8 : STD_LOGIC; 
  signal Dividend_1_IBUF_9 : STD_LOGIC; 
  signal Dividend_2_IBUF_10 : STD_LOGIC; 
  signal Dividend_3_IBUF_11 : STD_LOGIC; 
  signal Dividend_4_IBUF_12 : STD_LOGIC; 
  signal Dividend_5_IBUF_13 : STD_LOGIC; 
  signal Dividend_6_IBUF_14 : STD_LOGIC; 
  signal Dividend_7_IBUF_15 : STD_LOGIC; 
  signal Division_0_IBUF_20 : STD_LOGIC; 
  signal Division_1_IBUF_21 : STD_LOGIC; 
  signal Division_2_IBUF_22 : STD_LOGIC; 
  signal Division_3_IBUF_23 : STD_LOGIC; 
  signal EAQ_0_mux0000 : STD_LOGIC; 
  signal EAQ_0_not0001 : STD_LOGIC; 
  signal EAQ_1_mux0000 : STD_LOGIC; 
  signal EAQ_2_mux0000 : STD_LOGIC; 
  signal EAQ_2_or0000_31 : STD_LOGIC; 
  signal EAQ_3_mux0000_33 : STD_LOGIC; 
  signal EAQ_3_not0001 : STD_LOGIC; 
  signal EAQ_4_mux0000 : STD_LOGIC; 
  signal EAQ_4_mux00004_37 : STD_LOGIC; 
  signal EAQ_5_mux0000 : STD_LOGIC; 
  signal EAQ_5_mux00000_40 : STD_LOGIC; 
  signal EAQ_5_mux000061_41 : STD_LOGIC; 
  signal EAQ_5_mux000069_42 : STD_LOGIC; 
  signal EAQ_5_mux00008_43 : STD_LOGIC; 
  signal EAQ_6_mux0000 : STD_LOGIC; 
  signal EAQ_6_mux00004_46 : STD_LOGIC; 
  signal EAQ_7_mux0000 : STD_LOGIC; 
  signal EAQ_7_mux000011_SW2 : STD_LOGIC; 
  signal EAQ_7_mux000011_SW21_50 : STD_LOGIC; 
  signal EAQ_7_mux00004_51 : STD_LOGIC; 
  signal EAQ_7_mux000045_52 : STD_LOGIC; 
  signal EAQ_7_mux000086_53 : STD_LOGIC; 
  signal EAQ_7_or0000 : STD_LOGIC; 
  signal EAQ_8_mux0000 : STD_LOGIC; 
  signal EAQ_8_mux000018_57 : STD_LOGIC; 
  signal EAQ_8_mux000026_58 : STD_LOGIC; 
  signal EAQ_8_mux00005_59 : STD_LOGIC; 
  signal EAQ_8_mux000076_60 : STD_LOGIC; 
  signal EAQ_8_or0000 : STD_LOGIC; 
  signal N01 : STD_LOGIC; 
  signal N02 : STD_LOGIC; 
  signal N10 : STD_LOGIC; 
  signal N111 : STD_LOGIC; 
  signal N18 : STD_LOGIC; 
  signal N19 : STD_LOGIC; 
  signal N2 : STD_LOGIC; 
  signal N21 : STD_LOGIC; 
  signal N22 : STD_LOGIC; 
  signal N24 : STD_LOGIC; 
  signal N26 : STD_LOGIC; 
  signal N29 : STD_LOGIC; 
  signal N3 : STD_LOGIC; 
  signal N30 : STD_LOGIC; 
  signal N32 : STD_LOGIC; 
  signal N33 : STD_LOGIC; 
  signal N35 : STD_LOGIC; 
  signal N37 : STD_LOGIC; 
  signal N39 : STD_LOGIC; 
  signal N4 : STD_LOGIC; 
  signal N41 : STD_LOGIC; 
  signal N45 : STD_LOGIC; 
  signal N46 : STD_LOGIC; 
  signal N5 : STD_LOGIC; 
  signal N6 : STD_LOGIC; 
  signal N61 : STD_LOGIC; 
  signal N7 : STD_LOGIC; 
  signal N81 : STD_LOGIC; 
  signal Quotient_0_98 : STD_LOGIC; 
  signal Quotient_1_99 : STD_LOGIC; 
  signal Quotient_2_100 : STD_LOGIC; 
  signal Quotient_3_101 : STD_LOGIC; 
  signal Reminder_0_106 : STD_LOGIC; 
  signal Reminder_1_107 : STD_LOGIC; 
  signal Reminder_2_108 : STD_LOGIC; 
  signal Reminder_3_109 : STD_LOGIC; 
  signal clk_BUFGP_111 : STD_LOGIC; 
  signal overflow_OBUF_113 : STD_LOGIC; 
  signal sc_not0001_120 : STD_LOGIC; 
  signal state_FSM_FFd1_121 : STD_LOGIC; 
  signal state_FSM_FFd2_122 : STD_LOGIC; 
  signal state_FSM_FFd2_In : STD_LOGIC; 
  signal state_FSM_FFd3_124 : STD_LOGIC; 
  signal state_FSM_FFd4_125 : STD_LOGIC; 
  signal state_FSM_FFd4_In : STD_LOGIC; 
  signal state_FSM_FFd5_127 : STD_LOGIC; 
  signal state_FSM_FFd6_128 : STD_LOGIC; 
  signal state_FSM_FFd6_In : STD_LOGIC; 
  signal state_FSM_FFd7_130 : STD_LOGIC; 
  signal state_FSM_FFd7_In1_131 : STD_LOGIC; 
  signal state_FSM_FFd8_132 : STD_LOGIC; 
  signal state_cmp_eq0000 : STD_LOGIC; 
  signal zero_error_OBUF_135 : STD_LOGIC; 
  signal EAQ : STD_LOGIC_VECTOR ( 8 downto 0 ); 
  signal Madd_EAQ_8_4_add0001_lut : STD_LOGIC_VECTOR ( 2 downto 1 ); 
  signal Madd_EAQ_8_4_add0002_lut : STD_LOGIC_VECTOR ( 3 downto 2 ); 
  signal sc : STD_LOGIC_VECTOR ( 2 downto 0 ); 
  signal sc_mux0001 : STD_LOGIC_VECTOR ( 2 downto 0 ); 
begin
  EAQ_1 : LD_1
    port map (
      D => EAQ_1_mux0000,
      G => EAQ_2_or0000_31,
      Q => EAQ(1)
    );
  EAQ_2 : LD_1
    port map (
      D => EAQ_2_mux0000,
      G => EAQ_2_or0000_31,
      Q => EAQ(2)
    );
  EAQ_4 : LD_1
    port map (
      D => EAQ_4_mux0000,
      G => EAQ_7_or0000,
      Q => EAQ(4)
    );
  EAQ_5 : LD_1
    port map (
      D => EAQ_5_mux0000,
      G => EAQ_7_or0000,
      Q => EAQ(5)
    );
  EAQ_6 : LD_1
    port map (
      D => EAQ_6_mux0000,
      G => EAQ_7_or0000,
      Q => EAQ(6)
    );
  EAQ_7 : LD_1
    port map (
      D => EAQ_7_mux0000,
      G => EAQ_7_or0000,
      Q => EAQ(7)
    );
  EAQ_8 : LD_1
    port map (
      D => EAQ_8_mux0000,
      G => EAQ_8_or0000,
      Q => EAQ(8)
    );
  EAQ_0 : LD
    port map (
      D => EAQ_0_mux0000,
      G => EAQ_0_not0001,
      Q => EAQ(0)
    );
  EAQ_3 : LD
    port map (
      D => EAQ_3_mux0000_33,
      G => EAQ_3_not0001,
      Q => EAQ(3)
    );
  zero_error_10 : LD
    port map (
      D => state_cmp_eq0000,
      G => state_FSM_FFd8_132,
      Q => zero_error_OBUF_135
    );
  overflow_11 : LD
    port map (
      D => EAQ(8),
      G => state_FSM_FFd5_127,
      Q => overflow_OBUF_113
    );
  sc_0 : LD
    port map (
      D => sc_mux0001(0),
      G => sc_not0001_120,
      Q => sc(0)
    );
  sc_1 : LD
    port map (
      D => sc_mux0001(1),
      G => sc_not0001_120,
      Q => sc(1)
    );
  sc_2 : LD
    port map (
      D => sc_mux0001(2),
      G => sc_not0001_120,
      Q => sc(2)
    );
  Quotient_0 : LD
    port map (
      D => EAQ(0),
      G => state_FSM_FFd7_130,
      Q => Quotient_0_98
    );
  Quotient_1 : LD
    port map (
      D => EAQ(1),
      G => state_FSM_FFd7_130,
      Q => Quotient_1_99
    );
  Quotient_2 : LD
    port map (
      D => EAQ(2),
      G => state_FSM_FFd7_130,
      Q => Quotient_2_100
    );
  Quotient_3 : LD
    port map (
      D => EAQ(3),
      G => state_FSM_FFd7_130,
      Q => Quotient_3_101
    );
  Reminder_0 : LD
    port map (
      D => EAQ(4),
      G => state_FSM_FFd7_130,
      Q => Reminder_0_106
    );
  Reminder_1 : LD
    port map (
      D => EAQ(5),
      G => state_FSM_FFd7_130,
      Q => Reminder_1_107
    );
  Reminder_2 : LD
    port map (
      D => EAQ(6),
      G => state_FSM_FFd7_130,
      Q => Reminder_2_108
    );
  Reminder_3 : LD
    port map (
      D => EAQ(7),
      G => state_FSM_FFd7_130,
      Q => Reminder_3_109
    );
  state_FSM_FFd2 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_111,
      D => state_FSM_FFd2_In,
      Q => state_FSM_FFd2_122
    );
  state_FSM_FFd4 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_111,
      D => state_FSM_FFd4_In,
      Q => state_FSM_FFd4_125
    );
  state_FSM_FFd6 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_111,
      D => state_FSM_FFd6_In,
      Q => state_FSM_FFd6_128
    );
  state_FSM_FFd3 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_111,
      D => state_FSM_FFd4_125,
      Q => state_FSM_FFd3_124
    );
  state_FSM_FFd5 : FD
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_111,
      D => state_FSM_FFd6_128,
      Q => state_FSM_FFd5_127
    );
  state_FSM_FFd8 : FD
    generic map(
      INIT => '1'
    )
    port map (
      C => clk_BUFGP_111,
      D => state_FSM_FFd7_130,
      Q => state_FSM_FFd8_132
    );
  EAQ_8_or00001 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => EAQ_7_or0000,
      I1 => state_FSM_FFd8_132,
      O => EAQ_8_or0000
    );
  EAQ_7_mux000021 : LUT2
    generic map(
      INIT => X"E"
    )
    port map (
      I0 => state_FSM_FFd6_128,
      I1 => state_FSM_FFd3_124,
      O => N3
    );
  state_FSM_FFd4_In11 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => sc(2),
      I1 => sc(1),
      I2 => sc(0),
      O => N111
    );
  sc_not000131 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => state_FSM_FFd5_127,
      I1 => state_FSM_FFd7_130,
      I2 => state_FSM_FFd6_128,
      I3 => state_FSM_FFd2_122,
      O => N10
    );
  EAQ_7_or00001 : LUT4
    generic map(
      INIT => X"FEEE"
    )
    port map (
      I0 => state_FSM_FFd2_122,
      I1 => state_FSM_FFd7_130,
      I2 => EAQ(8),
      I3 => state_FSM_FFd1_121,
      O => EAQ_7_or0000
    );
  EAQ_3_not00011 : LUT4
    generic map(
      INIT => X"2202"
    )
    port map (
      I0 => N10,
      I1 => state_FSM_FFd1_121,
      I2 => state_FSM_FFd3_124,
      I3 => EAQ(8),
      O => EAQ_3_not0001
    );
  EAQ_0_not00011 : LUT4
    generic map(
      INIT => X"2202"
    )
    port map (
      I0 => N10,
      I1 => state_FSM_FFd3_124,
      I2 => state_FSM_FFd1_121,
      I3 => EAQ(8),
      O => EAQ_0_not0001
    );
  sc_not0001_SW0 : LUT3
    generic map(
      INIT => X"2F"
    )
    port map (
      I0 => state_FSM_FFd3_124,
      I1 => EAQ(8),
      I2 => N10,
      O => N02
    );
  sc_not0001 : LUT4
    generic map(
      INIT => X"0405"
    )
    port map (
      I0 => state_FSM_FFd4_125,
      I1 => N5,
      I2 => N02,
      I3 => state_FSM_FFd8_132,
      O => sc_not0001_120
    );
  EAQ_2_or0000_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => state_FSM_FFd3_124,
      I1 => state_FSM_FFd6_128,
      I2 => state_FSM_FFd7_130,
      O => N2
    );
  EAQ_2_or0000 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => state_FSM_FFd2_122,
      I1 => state_FSM_FFd5_127,
      I2 => state_FSM_FFd1_121,
      I3 => N2,
      O => EAQ_2_or0000_31
    );
  EAQ_1_mux00001 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => state_FSM_FFd8_132,
      I1 => Dividend_1_IBUF_9,
      I2 => state_FSM_FFd4_125,
      I3 => EAQ(0),
      O => EAQ_1_mux0000
    );
  EAQ_0_mux00001 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => Dividend_0_IBUF_8,
      I1 => state_FSM_FFd8_132,
      I2 => EAQ(8),
      I3 => state_FSM_FFd1_121,
      O => EAQ_0_mux0000
    );
  EAQ_3_mux0000_SW0 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => state_FSM_FFd8_132,
      I1 => Dividend_3_IBUF_11,
      I2 => state_FSM_FFd4_125,
      I3 => EAQ(2),
      O => N4
    );
  EAQ_3_mux0000 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => N4,
      I1 => state_FSM_FFd3_124,
      I2 => EAQ(8),
      O => EAQ_3_mux0000_33
    );
  sc_mux0001_1_1 : LUT3
    generic map(
      INIT => X"82"
    )
    port map (
      I0 => state_FSM_FFd2_In,
      I1 => sc(0),
      I2 => sc(1),
      O => sc_mux0001(1)
    );
  EAQ_2_mux00001 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => state_FSM_FFd8_132,
      I1 => Dividend_2_IBUF_10,
      I2 => state_FSM_FFd4_125,
      I3 => EAQ(1),
      O => EAQ_2_mux0000
    );
  state_FSM_FFd2_In1 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => state_FSM_FFd1_121,
      I1 => EAQ(8),
      I2 => state_FSM_FFd3_124,
      O => state_FSM_FFd2_In
    );
  state_FSM_FFd4_In1 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => state_FSM_FFd2_122,
      I1 => N111,
      I2 => EAQ(8),
      I3 => state_FSM_FFd5_127,
      O => state_FSM_FFd4_In
    );
  state_FSM_FFd6_In1 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => state_FSM_FFd8_132,
      I1 => N5,
      O => state_FSM_FFd6_In
    );
  sc_mux0001_2_11 : LUT4
    generic map(
      INIT => X"FFFE"
    )
    port map (
      I0 => Division_0_IBUF_20,
      I1 => Division_1_IBUF_21,
      I2 => Division_2_IBUF_22,
      I3 => Division_3_IBUF_23,
      O => N5
    );
  state_FSM_FFd7_In_SW0 : LUT4
    generic map(
      INIT => X"8F88"
    )
    port map (
      I0 => EAQ(8),
      I1 => state_FSM_FFd5_127,
      I2 => N5,
      I3 => state_FSM_FFd8_132,
      O => N61
    );
  sc_mux0001_2_Q : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => N5,
      I1 => state_FSM_FFd8_132,
      I2 => N81,
      I3 => state_FSM_FFd2_In,
      O => sc_mux0001(2)
    );
  EAQ_4_mux00004 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => Dividend_4_IBUF_12,
      I1 => state_FSM_FFd8_132,
      I2 => EAQ(3),
      I3 => state_FSM_FFd4_125,
      O => EAQ_4_mux00004_37
    );
  EAQ_7_mux000011 : LUT3
    generic map(
      INIT => X"AE"
    )
    port map (
      I0 => state_FSM_FFd5_127,
      I1 => state_FSM_FFd1_121,
      I2 => EAQ(8),
      O => N01
    );
  Madd_EAQ_8_4_add0001_lut_2_1 : LUT2
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Division_2_IBUF_22,
      I1 => EAQ(6),
      O => Madd_EAQ_8_4_add0001_lut(2)
    );
  EAQ_5_mux00000 : LUT2
    generic map(
      INIT => X"8"
    )
    port map (
      I0 => Dividend_5_IBUF_13,
      I1 => state_FSM_FFd8_132,
      O => EAQ_5_mux00000_40
    );
  EAQ_8_mux0000102 : LUT4
    generic map(
      INIT => X"FFF8"
    )
    port map (
      I0 => EAQ_8_mux000076_60,
      I1 => Madd_EAQ_8_4_add0002_lut(3),
      I2 => EAQ_8_mux000018_57,
      I3 => EAQ_8_mux000026_58,
      O => EAQ_8_mux0000
    );
  EAQ_6_mux00004 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => state_FSM_FFd8_132,
      I1 => Dividend_6_IBUF_14,
      I2 => state_FSM_FFd4_125,
      I3 => EAQ(5),
      O => EAQ_6_mux00004_46
    );
  EAQ_7_mux00004 : LUT4
    generic map(
      INIT => X"F888"
    )
    port map (
      I0 => EAQ(6),
      I1 => state_FSM_FFd4_125,
      I2 => Dividend_7_IBUF_15,
      I3 => state_FSM_FFd8_132,
      O => EAQ_7_mux00004_51
    );
  EAQ_7_mux000089 : LUT4
    generic map(
      INIT => X"FEFC"
    )
    port map (
      I0 => N3,
      I1 => EAQ_7_mux00004_51,
      I2 => EAQ_7_mux000086_53,
      I3 => EAQ_7_mux000045_52,
      O => EAQ_7_mux0000
    );
  Dividend_7_IBUF : IBUF
    port map (
      I => Dividend(7),
      O => Dividend_7_IBUF_15
    );
  Dividend_6_IBUF : IBUF
    port map (
      I => Dividend(6),
      O => Dividend_6_IBUF_14
    );
  Dividend_5_IBUF : IBUF
    port map (
      I => Dividend(5),
      O => Dividend_5_IBUF_13
    );
  Dividend_4_IBUF : IBUF
    port map (
      I => Dividend(4),
      O => Dividend_4_IBUF_12
    );
  Dividend_3_IBUF : IBUF
    port map (
      I => Dividend(3),
      O => Dividend_3_IBUF_11
    );
  Dividend_2_IBUF : IBUF
    port map (
      I => Dividend(2),
      O => Dividend_2_IBUF_10
    );
  Dividend_1_IBUF : IBUF
    port map (
      I => Dividend(1),
      O => Dividend_1_IBUF_9
    );
  Dividend_0_IBUF : IBUF
    port map (
      I => Dividend(0),
      O => Dividend_0_IBUF_8
    );
  Division_3_IBUF : IBUF
    port map (
      I => Division(3),
      O => Division_3_IBUF_23
    );
  Division_2_IBUF : IBUF
    port map (
      I => Division(2),
      O => Division_2_IBUF_22
    );
  Division_1_IBUF : IBUF
    port map (
      I => Division(1),
      O => Division_1_IBUF_21
    );
  Division_0_IBUF : IBUF
    port map (
      I => Division(0),
      O => Division_0_IBUF_20
    );
  overflow_OBUF : OBUF
    port map (
      I => overflow_OBUF_113,
      O => overflow
    );
  zero_error_OBUF : OBUF
    port map (
      I => zero_error_OBUF_135,
      O => zero_error
    );
  Quotient_3_OBUF : OBUF
    port map (
      I => Quotient_3_101,
      O => Quotient(3)
    );
  Quotient_2_OBUF : OBUF
    port map (
      I => Quotient_2_100,
      O => Quotient(2)
    );
  Quotient_1_OBUF : OBUF
    port map (
      I => Quotient_1_99,
      O => Quotient(1)
    );
  Quotient_0_OBUF : OBUF
    port map (
      I => Quotient_0_98,
      O => Quotient(0)
    );
  Reminder_3_OBUF : OBUF
    port map (
      I => Reminder_3_109,
      O => Reminder(3)
    );
  Reminder_2_OBUF : OBUF
    port map (
      I => Reminder_2_108,
      O => Reminder(2)
    );
  Reminder_1_OBUF : OBUF
    port map (
      I => Reminder_1_107,
      O => Reminder(1)
    );
  Reminder_0_OBUF : OBUF
    port map (
      I => Reminder_0_106,
      O => Reminder(0)
    );
  state_FSM_FFd1 : FDR
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_111,
      D => state_FSM_FFd3_124,
      R => EAQ(8),
      Q => state_FSM_FFd1_121
    );
  state_FSM_FFd7 : FDS
    generic map(
      INIT => '0'
    )
    port map (
      C => clk_BUFGP_111,
      D => state_FSM_FFd7_In1_131,
      S => N61,
      Q => state_FSM_FFd7_130
    );
  EAQ_7_mux000031 : LUT4
    generic map(
      INIT => X"157F"
    )
    port map (
      I0 => Division_1_IBUF_21,
      I1 => Division_0_IBUF_20,
      I2 => EAQ(4),
      I3 => EAQ(5),
      O => N6
    );
  EAQ_5_mux000061 : LUT4
    generic map(
      INIT => X"BAEA"
    )
    port map (
      I0 => state_FSM_FFd4_125,
      I1 => Division_1_IBUF_21,
      I2 => N3,
      I3 => EAQ(5),
      O => EAQ_5_mux000061_41
    );
  EAQ_7_mux000041 : LUT4
    generic map(
      INIT => X"08AE"
    )
    port map (
      I0 => Division_1_IBUF_21,
      I1 => Division_0_IBUF_20,
      I2 => EAQ(4),
      I3 => EAQ(5),
      O => N7
    );
  EAQ_5_mux000069 : LUT4
    generic map(
      INIT => X"0082"
    )
    port map (
      I0 => N01,
      I1 => Division_0_IBUF_20,
      I2 => EAQ(4),
      I3 => N46,
      O => EAQ_5_mux000069_42
    );
  EAQ_7_mux000045 : LUT4
    generic map(
      INIT => X"B24D"
    )
    port map (
      I0 => Division_2_IBUF_22,
      I1 => EAQ(6),
      I2 => N7,
      I3 => N45,
      O => EAQ_7_mux000045_52
    );
  EAQ_5_mux000087 : LUT4
    generic map(
      INIT => X"FFAC"
    )
    port map (
      I0 => N19,
      I1 => N18,
      I2 => EAQ_5_mux000069_42,
      I3 => EAQ_5_mux00008_43,
      O => EAQ_5_mux0000
    );
  EAQ_7_mux000086_SW0_SW0 : LUT4
    generic map(
      INIT => X"C396"
    )
    port map (
      I0 => Division_2_IBUF_22,
      I1 => Division_3_IBUF_23,
      I2 => EAQ(7),
      I3 => EAQ(6),
      O => N21
    );
  EAQ_7_mux000086_SW0_SW1 : LUT4
    generic map(
      INIT => X"963C"
    )
    port map (
      I0 => Division_2_IBUF_22,
      I1 => Division_3_IBUF_23,
      I2 => EAQ(7),
      I3 => EAQ(6),
      O => N22
    );
  EAQ_6_mux000043_SW0 : LUT4
    generic map(
      INIT => X"ECCE"
    )
    port map (
      I0 => N01,
      I1 => EAQ_6_mux00004_46,
      I2 => N6,
      I3 => Madd_EAQ_8_4_add0001_lut(2),
      O => N24
    );
  EAQ_6_mux000043 : LUT4
    generic map(
      INIT => X"FF82"
    )
    port map (
      I0 => N3,
      I1 => N7,
      I2 => Madd_EAQ_8_4_add0002_lut(2),
      I3 => N24,
      O => EAQ_6_mux0000
    );
  EAQ_5_mux000043_SW0 : LUT4
    generic map(
      INIT => X"FEBA"
    )
    port map (
      I0 => EAQ_5_mux00000_40,
      I1 => EAQ(4),
      I2 => N26,
      I3 => EAQ_5_mux000061_41,
      O => N18
    );
  EAQ_5_mux000032_SW0 : LUT4
    generic map(
      INIT => X"FF28"
    )
    port map (
      I0 => N3,
      I1 => Division_1_IBUF_21,
      I2 => Division_0_IBUF_20,
      I3 => EAQ_5_mux00000_40,
      O => N29
    );
  EAQ_5_mux000032_SW1 : LUT4
    generic map(
      INIT => X"FF82"
    )
    port map (
      I0 => N3,
      I1 => Division_1_IBUF_21,
      I2 => Division_0_IBUF_20,
      I3 => EAQ_5_mux00000_40,
      O => N30
    );
  EAQ_5_mux000043_SW1 : LUT4
    generic map(
      INIT => X"FCFA"
    )
    port map (
      I0 => N29,
      I1 => N30,
      I2 => EAQ(4),
      I3 => EAQ(5),
      O => N19
    );
  EAQ_7_mux000011_SW0 : LUT4
    generic map(
      INIT => X"FAF8"
    )
    port map (
      I0 => Division_3_IBUF_23,
      I1 => state_FSM_FFd5_127,
      I2 => EAQ_8_mux00005_59,
      I3 => state_FSM_FFd1_121,
      O => N32
    );
  EAQ_7_mux000011_SW1 : LUT3
    generic map(
      INIT => X"EA"
    )
    port map (
      I0 => EAQ_8_mux00005_59,
      I1 => state_FSM_FFd5_127,
      I2 => Division_3_IBUF_23,
      O => N33
    );
  EAQ_8_mux000026 : LUT4
    generic map(
      INIT => X"0A0E"
    )
    port map (
      I0 => state_FSM_FFd5_127,
      I1 => state_FSM_FFd1_121,
      I2 => N35,
      I3 => EAQ(8),
      O => EAQ_8_mux000026_58
    );
  EAQ_4_mux000018_SW0 : LUT3
    generic map(
      INIT => X"FE"
    )
    port map (
      I0 => N01,
      I1 => state_FSM_FFd3_124,
      I2 => state_FSM_FFd6_128,
      O => N37
    );
  EAQ_4_mux000018 : LUT4
    generic map(
      INIT => X"FF28"
    )
    port map (
      I0 => N37,
      I1 => Division_0_IBUF_20,
      I2 => EAQ(4),
      I3 => EAQ_4_mux00004_37,
      O => EAQ_4_mux0000
    );
  state_FSM_FFd7_In1 : LUT4
    generic map(
      INIT => X"0100"
    )
    port map (
      I0 => sc(2),
      I1 => sc(1),
      I2 => sc(0),
      I3 => state_FSM_FFd2_122,
      O => state_FSM_FFd7_In1_131
    );
  sc_mux0001_0_1 : LUT4
    generic map(
      INIT => X"5540"
    )
    port map (
      I0 => sc(0),
      I1 => EAQ(8),
      I2 => state_FSM_FFd3_124,
      I3 => state_FSM_FFd1_121,
      O => sc_mux0001(0)
    );
  EAQ_8_mux000045_SW0 : LUT4
    generic map(
      INIT => X"464F"
    )
    port map (
      I0 => EAQ(4),
      I1 => Division_0_IBUF_20,
      I2 => state_FSM_FFd3_124,
      I3 => state_FSM_FFd6_128,
      O => N39
    );
  state_cmp_eq00001 : LUT4
    generic map(
      INIT => X"0001"
    )
    port map (
      I0 => Division_0_IBUF_20,
      I1 => Division_1_IBUF_21,
      I2 => Division_2_IBUF_22,
      I3 => Division_3_IBUF_23,
      O => state_cmp_eq0000
    );
  EAQ_8_mux00005 : LUT4
    generic map(
      INIT => X"FF28"
    )
    port map (
      I0 => state_FSM_FFd3_124,
      I1 => EAQ(7),
      I2 => Division_3_IBUF_23,
      I3 => state_FSM_FFd4_125,
      O => EAQ_8_mux00005_59
    );
  EAQ_8_mux000076_SW0 : LUT4
    generic map(
      INIT => X"40D9"
    )
    port map (
      I0 => Division_1_IBUF_21,
      I1 => EAQ(5),
      I2 => state_FSM_FFd3_124,
      I3 => N39,
      O => N41
    );
  EAQ_8_mux000076 : LUT4
    generic map(
      INIT => X"D940"
    )
    port map (
      I0 => Division_2_IBUF_22,
      I1 => EAQ(6),
      I2 => state_FSM_FFd3_124,
      I3 => N41,
      O => EAQ_8_mux000076_60
    );
  clk_BUFGP : BUFGP
    port map (
      I => clk,
      O => clk_BUFGP_111
    );
  EAQ_7_mux000011_SW21 : LUT4
    generic map(
      INIT => X"9FFF"
    )
    port map (
      I0 => EAQ(7),
      I1 => Division_3_IBUF_23,
      I2 => EAQ(6),
      I3 => Division_2_IBUF_22,
      O => EAQ_7_mux000011_SW2
    );
  EAQ_7_mux000011_SW22 : LUT4
    generic map(
      INIT => X"999F"
    )
    port map (
      I0 => EAQ(7),
      I1 => Division_3_IBUF_23,
      I2 => Division_2_IBUF_22,
      I3 => EAQ(6),
      O => EAQ_7_mux000011_SW21_50
    );
  EAQ_7_mux000011_SW2_f5 : MUXF5
    port map (
      I0 => EAQ_7_mux000011_SW21_50,
      I1 => EAQ_7_mux000011_SW2,
      S => N6,
      O => N35
    );
  sc_mux0001_2_SW0 : LUT3_L
    generic map(
      INIT => X"A9"
    )
    port map (
      I0 => sc(2),
      I1 => sc(1),
      I2 => sc(0),
      LO => N81
    );
  Madd_EAQ_8_4_add0002_lut_3_1 : LUT2_D
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => Division_3_IBUF_23,
      I1 => EAQ(7),
      LO => N45,
      O => Madd_EAQ_8_4_add0002_lut(3)
    );
  Madd_EAQ_8_4_add0002_lut_2_1 : LUT2_L
    generic map(
      INIT => X"9"
    )
    port map (
      I0 => EAQ(6),
      I1 => Division_2_IBUF_22,
      LO => Madd_EAQ_8_4_add0002_lut(2)
    );
  Madd_EAQ_8_4_add0001_lut_1_1 : LUT2_D
    generic map(
      INIT => X"6"
    )
    port map (
      I0 => Division_1_IBUF_21,
      I1 => EAQ(5),
      LO => N46,
      O => Madd_EAQ_8_4_add0001_lut(1)
    );
  EAQ_5_mux00008 : LUT4_L
    generic map(
      INIT => X"4C00"
    )
    port map (
      I0 => Division_0_IBUF_20,
      I1 => N01,
      I2 => EAQ(4),
      I3 => Madd_EAQ_8_4_add0001_lut(1),
      LO => EAQ_5_mux00008_43
    );
  EAQ_7_mux000086 : LUT4_L
    generic map(
      INIT => X"A088"
    )
    port map (
      I0 => N01,
      I1 => N21,
      I2 => N22,
      I3 => N6,
      LO => EAQ_7_mux000086_53
    );
  EAQ_5_mux000043_SW0_SW0 : LUT4_L
    generic map(
      INIT => X"9060"
    )
    port map (
      I0 => Division_0_IBUF_20,
      I1 => Division_1_IBUF_21,
      I2 => N3,
      I3 => EAQ(5),
      LO => N26
    );
  EAQ_8_mux000018 : LUT4_L
    generic map(
      INIT => X"A0C0"
    )
    port map (
      I0 => N33,
      I1 => N32,
      I2 => EAQ(7),
      I3 => EAQ(8),
      LO => EAQ_8_mux000018_57
    );

end Structure;

