library ieee;
use ieee.std_logic_1164.all;

-- 											DESCONECTEI OS LEDS PARA O DIAGRAMA DE BLOCOS FICAR MENOS POLUIDO
--												E FACILITAR O ENTENDIMENTO 

entity led_controller is
	port (
			clk       : in std_logic;
			control   : in BIT;
			led_out   : out BIT;
			led_out2  : out BIT;
			led_out3  : out BIT
	);
end led_controller;

architecture controller of led_controller is
begin
	process(control,clk)
	begin
		if rising_edge(clk) then
			if control = '0' then
				led_out <= '1';
				led_out2 <= '1';
				led_out3 <= '1';
			elsif control = '1' then
				led_out <= '0';
				led_out2 <= '0';
				led_out3 <= '0';
			end if;
		end if;
	end process;
end controller;