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
	TYPE State_type IS (standby, hold, set_speed, power_engine, shutdown_plate);
	signal state_controller : State_type = standby;

begin
		process(clk,en4)
		begin
			if en4 = '0' then
				state_controller := standby;
				
			elsif clk'event and clk = '0' then
				case state_controller is
					
					when standby => if en4 = '1' and  remote = '0' and local = '0' then
											sp <= '0';
											rt <= '0';
											load <= '0';
											en_count <= '0';
											state_controller := hold;
										 end if;
					
					when hold => if en4 = '1' and  remote = '1' and local = '0' then
											sp <= '0';
											rt <= '1';
											load <= '1';
											en_count <= '0';
											state_controller := set_speed;
									 elsif en4 = '1' and remote = '0' and local = '1' then
											sp <= '1';
											rt <= '0';
											load <= '1';
											en_count <= '0';
											state_controller := set_speed;	
									 elsif en4 = '0' and  remote = '0' and local = '0' then
											sp <= '0';
											rt <= '0';
											load <= '0';
											en_count <= '0';
											state_controller := standby;
									 end if;
					
					when set_speed => en_count <= '1';
											state_controller := power_engine;
					
					when power_engine => if en4 = '1' and  remote = '0' and local = '0' then
													sp <= '0';
													rt <= '0';
													load <= '0';
													en_count <= '0';
													state_controller <= hold;
												end if;
					when 
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