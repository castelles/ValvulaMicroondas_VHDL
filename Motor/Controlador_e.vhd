library ieee;
use ieee.std_logic_1164.all;

entity Controlador_e is
	port(
			en4	      : in std_logic;
			clk         : in std_logic;
			sp_control  : in std_logic;
			rt_control  : in std_logic;
			sp 			: out std_logic;
			rt				: out std_logic;
			load_reg		: out std_logic;
			enable		: out std_logic
		 );
end Controlador_e;

architecture arq1 of Controlador_e is
begin
	
end arq1;