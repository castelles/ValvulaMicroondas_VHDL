library ieee;
use ieee.std_logic_1164.all;

entity Comparador_e is
	port(
			en	         : in std_logic;
			a				: in std_logic_vector(6 downto 0);    --a = 192 alta velocidade; data0 do mux
			b 				: in std_logic_vector(6 downto 0);	  --a = 64 baixa velocidade; data1 do mux
			ls				: out std_logic
		 );
end Comparador_e;

architecture arq1 of Comparador_e is
begin
	process(en)
	begin
	if(a >= b) then
		ls <= '1';
	else
		ls <= '0';
	end if;	
	end process;
end arq1;