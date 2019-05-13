library ieee;
use ieee.std_logic_1164.all;

entity Controlador_e is
	port(
			en4	      : in std_logic;
			clk         : in std_logic;
			sp_control  : in std_logic;   --definido como botão apenas para teste
			rt_control  : in std_logic;	--definido como botão apenas para teste
			sp 			: out std_logic;
			rt				: out std_logic;
			load_reg		: out std_logic;
			enable		: out std_logic
		 );
end Controlador_e;

architecture arq1 of Controlador_e is
	TYPE State_type IS (off_controller, high_on, high_off, low_on, low_off);
	signal state_controller : State_type;

	begin

--	begin
--		process(clk,en4)
--		begin
--			if en4 = '0' then
--				state_controller <= off;
--			elsif (clk'event and clk = '0') then
--				case state_controller IS
--					
--					when off =>
--						if sp_control = '1'
--	
end arq1;