library ieee;
use ieee.std_logic_1164.all;

entity Controlador_e is
	port(
			en4	      : in std_logic;
			clk         : in std_logic;
			remote      : in std_logic;   --definido como chave apenas para teste
			local       : in std_logic;	--definido como chave apenas para teste
			sp 			: out std_logic;
			rt				: out std_logic;
			load   		: out std_logic;
			en_count		: out std_logic
		 );
end Controlador_e;

architecture arq1 of Controlador_e is
	TYPE State_type IS (standby, set_speed, power_engine, shutdown_plate);
	signal state_controller : State_type;

begin
		process(clk,en4)
		begin
			if en4 = '1' and  remote = '0' and local = '0' then
				sp <= '0';
				rt <= '0';
				load <= '0';
			   en_count <= '0';
				state_controller <= standby;
			elsif en4 ='1' and remote = '1' and local = '0' then
				sp <= '0';
				rt <= '1';
				load <= '1';
				en_count <= '0';
				state_controller <= set_speed;
			elsif en4 = '1' and remote = '0' and local = '1' then
				sp <= '1';
				rt <= '0';
				load <= '1';
				en_count <= '0';
				state_controller <= set_speed;
			end if;
			
			if state_controller = set_speed then
				en_count <= '1';
			elsif en4 = '1' and  remote = '0' and local = '0' then
				sp <= '0';
				rt <= '0';
				load <= '0';
				en_count <= '0';
				state_controller <= shutdown_plate;
			elsif en4 = '0' and  remote = '0' and local = '0' then
				sp <= '0';
				rt <= '0';
				load <= '0';
				en_count <= '0';
				state_controller <= standby;
			end if;
			
		end process;
end arq1;