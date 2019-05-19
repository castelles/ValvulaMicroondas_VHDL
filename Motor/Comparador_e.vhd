library ieee;
use ieee.std_logic_1164.all;

entity Comparador_e is
	port(
			en	         : in std_logic;
			rotation    : in std_logic;
			a				: in std_logic_vector(7 downto 0);    --a = 192 alta velocidade; data0 do mux
			b 				: in std_logic_vector(7 downto 0);	  --a = 64 baixa velocidade; data1 do mux
			ls				: out std_logic;
			led_ls      : out std_logic
		 );
end Comparador_e;

architecture arq1 of Comparador_e is
begin
	process(en)
	begin
	if en = '0' then
		led_ls <= '0';
	else
		if(a > b) then
			ls <= '1';
			led_ls <= '1';
		elsif (a <= b) then
			ls <= '0';
			led_ls <= '0';
		end if;
	end if;	
	end process;
end arq1;