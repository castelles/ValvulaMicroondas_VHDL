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
-- CREATED		"Mon May 27 16:28:48 2019"

LIBRARY ieee;
USE ieee.std_logic_1164.all; 

LIBRARY work;

ENTITY motor IS 
	PORT
	(
		enable :  IN  STD_LOGIC;
		key_remote :  IN  STD_LOGIC;
		key_local :  IN  STD_LOGIC;
		clk :  IN  STD_LOGIC;
		led_ctrl :  OUT  STD_LOGIC;
		led_ctrl2 :  OUT  STD_LOGIC;
		led_ctrl3 :  OUT  STD_LOGIC;
		duty_cycle :  OUT  STD_LOGIC;
		in0 :  OUT  STD_LOGIC;
		in1 :  OUT  STD_LOGIC;
		led_right :  OUT  STD_LOGIC;
		led_right2 :  OUT  STD_LOGIC;
		led_right3 :  OUT  STD_LOGIC;
		led_left :  OUT  STD_LOGIC;
		led_left2 :  OUT  STD_LOGIC;
		led_left3 :  OUT  STD_LOGIC;
		led_power :  OUT  STD_LOGIC;
		led_power2 :  OUT  STD_LOGIC;
		led_power3 :  OUT  STD_LOGIC
	);
END motor;

ARCHITECTURE bdf_type OF motor IS 

COMPONENT controlador_e
	PORT(en4 : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 remote : IN STD_LOGIC;
		 local : IN STD_LOGIC;
		 sp : OUT STD_LOGIC;
		 rt : OUT STD_LOGIC;
		 load : OUT STD_LOGIC;
		 en_count : OUT STD_LOGIC;
		 led_enable : OUT STD_LOGIC;
		 speed_high : OUT STD_LOGIC_VECTOR(7 DOWNTO 0);
		 speed_low : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT lpm_counter0
	PORT(clock : IN STD_LOGIC;
		 cnt_en : IN STD_LOGIC;
		 q : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT dsf_shiftregister
	PORT(load : IN STD_LOGIC;
		 clk : IN STD_LOGIC;
		 data : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 speed_register : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

COMPONENT demux_rotation
	PORT(selectRot : IN STD_LOGIC;
		 enable_rot : IN STD_LOGIC;
		 in0 : OUT STD_LOGIC;
		 in1 : OUT STD_LOGIC;
		 led_in0 : OUT STD_LOGIC;
		 led_in1 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT comparador_e
	PORT(en : IN STD_LOGIC;
		 rotation : IN STD_LOGIC;
		 a : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 ls : OUT STD_LOGIC;
		 led_ls : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT led_controller
	PORT(clk : IN STD_LOGIC;
		 control : IN STD_LOGIC;
		 led_out : OUT STD_LOGIC;
		 led_out2 : OUT STD_LOGIC;
		 led_out3 : OUT STD_LOGIC
	);
END COMPONENT;

COMPONENT lpm_mux0
	PORT(sel : IN STD_LOGIC;
		 data0x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 data1x : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
		 result : OUT STD_LOGIC_VECTOR(7 DOWNTO 0)
	);
END COMPONENT;

SIGNAL	SYNTHESIZED_WIRE_16 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_1 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_2 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_17 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_7 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_8 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_9 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_10 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_11 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_12 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_13 :  STD_LOGIC;
SIGNAL	SYNTHESIZED_WIRE_14 :  STD_LOGIC_VECTOR(7 DOWNTO 0);
SIGNAL	SYNTHESIZED_WIRE_15 :  STD_LOGIC_VECTOR(7 DOWNTO 0);


BEGIN 



b2v_inst : controlador_e
PORT MAP(en4 => enable,
		 clk => clk,
		 remote => key_remote,
		 local => key_local,
		 sp => SYNTHESIZED_WIRE_13,
		 rt => SYNTHESIZED_WIRE_17,
		 load => SYNTHESIZED_WIRE_1,
		 en_count => SYNTHESIZED_WIRE_16,
		 led_enable => SYNTHESIZED_WIRE_9,
		 speed_high => SYNTHESIZED_WIRE_14,
		 speed_low => SYNTHESIZED_WIRE_15);


b2v_inst10 : lpm_counter0
PORT MAP(clock => clk,
		 cnt_en => SYNTHESIZED_WIRE_16,
		 q => SYNTHESIZED_WIRE_8);


b2v_inst2 : dsf_shiftregister
PORT MAP(load => SYNTHESIZED_WIRE_1,
		 clk => clk,
		 data => SYNTHESIZED_WIRE_2,
		 speed_register => SYNTHESIZED_WIRE_7);


b2v_inst3 : demux_rotation
PORT MAP(selectRot => SYNTHESIZED_WIRE_17,
		 enable_rot => SYNTHESIZED_WIRE_16,
		 in0 => in0,
		 in1 => in1,
		 led_in0 => SYNTHESIZED_WIRE_12,
		 led_in1 => SYNTHESIZED_WIRE_11);


b2v_inst4 : comparador_e
PORT MAP(en => SYNTHESIZED_WIRE_16,
		 rotation => SYNTHESIZED_WIRE_17,
		 a => SYNTHESIZED_WIRE_7,
		 b => SYNTHESIZED_WIRE_8,
		 ls => duty_cycle,
		 led_ls => SYNTHESIZED_WIRE_10);


b2v_inst5 : led_controller
PORT MAP(clk => clk,
		 control => SYNTHESIZED_WIRE_9,
		 led_out => led_ctrl,
		 led_out2 => led_ctrl2,
		 led_out3 => led_ctrl3);


b2v_inst6 : led_controller
PORT MAP(clk => clk,
		 control => SYNTHESIZED_WIRE_10,
		 led_out => led_power3,
		 led_out2 => led_power2,
		 led_out3 => led_power);


b2v_inst7 : led_controller
PORT MAP(clk => clk,
		 control => SYNTHESIZED_WIRE_11,
		 led_out => led_left3,
		 led_out2 => led_left2,
		 led_out3 => led_left);


b2v_inst8 : led_controller
PORT MAP(clk => clk,
		 control => SYNTHESIZED_WIRE_12,
		 led_out => led_right,
		 led_out2 => led_right2,
		 led_out3 => led_right3);


b2v_inst9 : lpm_mux0
PORT MAP(sel => SYNTHESIZED_WIRE_13,
		 data0x => SYNTHESIZED_WIRE_14,
		 data1x => SYNTHESIZED_WIRE_15,
		 result => SYNTHESIZED_WIRE_2);


END bdf_type;