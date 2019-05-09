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
begin
--	process(clk)
--	begin
--		if(clock'event and clock='0') then
--			sp <= sp_control;        
--			rt <= rt_control;
--			enable, load_reg <= en4;
--	end process;
end arq1;