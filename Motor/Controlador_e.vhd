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
	TYPE State_type IS (off_controller, ed_local, inc_local, inc_remote, set_remote);
	signal state_controller : State_type;

begin
		process(clk,en4)
		begin
			if en4 = '0' then
				state_controller <= off_controller;
			elsif (clk'event and clk = '0') then
				case state_controller IS
					
					when off_controller =>
						if sp_control = '1' and rt_control = '1' then
							state_controller <= inc_local;
						elsif sp_control = '0' and  rt_control = '0' then
							state_controller <=inc_remote;
						end if;
					
					when inc_local =>
						if sp_control = '1' and rt_control = '1' then
							state_controller <= ed_local;
						end if;
					
					when inc_remote =>
						if sp_control = '0' and  rt_control = '0' then
							state_controller <= set_remote;
						end if;
					
					when set_remote =>
						if sp_control = '0' and rt_control = '0' then
							state_controller <= set_remote;
						end if;
						
					when ed_local =>
						if sp_control = '1'and rt_control = '0' then 
							state_controller <= ed_local;
						end if;
						
				end case;
			end if;
		end process;
end arq1;