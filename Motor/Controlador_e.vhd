library ieee;
use ieee.std_logic_1164.all;

entity Controlador_e is
	port(
			en4	      : in std_logic;
			clk         : in std_logic;
			remote      : in std_logic;   --definido como botão apenas para teste
			local       : in std_logic;	--definido como botão apenas para teste
			sp 			: out std_logic;
			rt				: out std_logic;
			load   		: out std_logic;
			enable		: out std_logic
		 );
end Controlador_e;

architecture arq1 of Controlador_e is
	TYPE State_type IS (standby, ed_local, inc_local, inc_remote, set_remote);
	signal state_controller : State_type;

begin
		process(clk,en4)
		begin
			if en4 = '1' and  remote = '0' and local = '0' then
				sp = '0';
				rt = '0';
				load = '0'
				enable = '0';
				state_controller <= standby;
			elsif en4 ='1' and remote = '1' and local = '0' then
				sp = '0';
				rt = '1';
				load = '1';
				enable = '1';
				
			end if;
		end process;
end arq1;