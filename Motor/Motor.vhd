-- Copyright (C) 1991-2013 Altera Corporation
-- Your use of Altera Corporation's design tools, logic functions 
-- and other software and tools, and its AMPP partner logic 
-- functions, and any output files from any of the foregoing 
-- (including device programming or simulation files), and any 
-- associated documentation or information are expressly subject 
-- to the terms and conditions of the Altera Program License 
-- Subscription Agreement, Altera MegaCore Function License 
-- Agreement, or other applicable license agreement, including, 
-- without limitation, that your use is for the sole purpose of 
-- programming logic devices manufactured by Altera and sold by 
-- Altera or its authorized distributors.  Please refer to the 
-- applicable agreement for further details.

-- PROGRAM		"Quartus II 32-bit"
-- VERSION		"Version 13.0.1 Build 232 06/12/2013 Service Pack 1 SJ Web Edition"
-- CREATED		"Thu May 09 17:51:39 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY Motor IS 
	PORT
	(
		clk :  IN  STD_LOGIC;
		enable :  IN  STD_LOGIC;
		sp_control :  IN  STD_LOGIC;
		rt_control :  IN  STD_LOGIC;
		speed_H :  IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
		speed_L :  IN  STD_LOGIC_VECTOR(6 DOWNTO 0);
		in0 :  OUT  STD_LOGIC;
		in1 :  OUT  STD_LOGIC
	);
END Motor;

ARCHITECTURE bdf_type OF Motor IS 

COMPONENT controlador_e
	PORT(en4 : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 sp_control : IN STD_LOGIC;
		 rt_control : IN STD_LOGIC;
		 sp : OUT STD_LOGIC;
		 rt : OUT STD_LOGIC;
		 load_reg : OUT STD_LOGIC;
		 enable : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT comparador_e
	PORT(en : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 ls : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT lpm_counter0
	PORT(clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_mux0
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_shiftreg0
	PORT(load : IN STD_LOGIC;
		 clock : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(6 DOWNTO 0);
		 q : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
	);
END COMPONENT;

COMPONENT one_delay
	PORT(d : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 q : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT demux_rotation
	PORT(selectRot : IN STD_LOGIC;
		 data : IN STD_LOGIC;
		 in0 : OUT STD_LOGIC;
		 in1 : OUT STD_LOGIC
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_3 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_4 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_5 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_6 :  STD_LOGIC_VECTOR(6 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;


BEGIN 



b2v_inst : controlador_e
PORT MAP(en4 => enable,
		 clk => clk,
		 sp_control => sp_control,
		 rt_control => rt_control,
		 sp => SYNTHESIZED_WIRE_4,
		 rt => SYNTHESIZED_WIRE_8,
		 load_reg => SYNTHESIZED_WIRE_5,
		 enable => SYNTHESIZED_WIRE_10);


b2v_inst2 : comparador_e
PORT MAP(en => SYNTHESIZED_WIRE_10,
		 a => SYNTHESIZED_WIRE_1,
		 b => SYNTHESIZED_WIRE_2,
		 ls => SYNTHESIZED_WIRE_9);


b2v_inst3 : lpm_counter0
PORT MAP(clock => clk,
		 cnt_en => SYNTHESIZED_WIRE_3,
		 q => SYNTHESIZED_WIRE_2);


b2v_inst4 : lpm_mux0
PORT MAP(sel => SYNTHESIZED_WIRE_4,
		 data0x => speed_H,
		 data1x => speed_L,
		 result => SYNTHESIZED_WIRE_6);


b2v_inst5 : lpm_shiftreg0
PORT MAP(load => SYNTHESIZED_WIRE_5,
		 clock => clk,
		 data => SYNTHESIZED_WIRE_6,
		 q => SYNTHESIZED_WIRE_1);


b2v_inst6 : one_delay
PORT MAP(d => SYNTHESIZED_WIRE_10,
		 clk => clk,
		 q => SYNTHESIZED_WIRE_3);


b2v_inst7 : demux_rotation
PORT MAP(selectRot => SYNTHESIZED_WIRE_8,
		 data => SYNTHESIZED_WIRE_9,
		 in0 => in0,
		 in1 => in1);


END bdf_type;