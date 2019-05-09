library ieee;
use ieee.std_logic_1164.all;

entity demux_rotation is
	port(
			selectRot	: in std_logic;
			data        : in std_logic;
			in0  			: out std_logic;
			in1			: out std_logic
		 );
end demux_rotation;

architecture arq1 of demux_rotation is
begin
	process(selectRot)
	begin
			if(selectRot = '0') then
				in0 <= data;
			else in1 <= data;
			end if;
	end process;
end arq1;