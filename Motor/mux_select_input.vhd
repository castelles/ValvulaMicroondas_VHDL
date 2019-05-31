library ieee;
use ieee.std_logic_1164.all;

entity mux_select_input is
	port(
			in0  			: in std_logic;     -- in0 É O SINAL DAS ENTRADAS START
			in1			: in std_logic;     -- in1 É O SINAL DAS ENTRADAS CANCEL
			enable      : out std_logic
		 );
end mux_select_input;


architecture arq1 of mux_select_input is
begin
	process(in0, in1)
	begin
		if (in1 = '0' and in0 = '1') then
			enable <= '1';       -- O ÚNICO CASO EM QUE VAI ESTAR ACIONADO É QUANDO O START(in0) FOR 1
			                     -- E CANCEL FOR 0
		else
			enable <= '0';       -- QUANDO O CANCEL ESTÁ ACIONADO, NÃO INPORTA O VALOR DE START(in0)
		end if;
	end process;
end arq1;