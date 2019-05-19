library ieee;
use ieee.std_logic_1164.all;

entity demux_rotation is
	port(
			selectRot	: in std_logic;
			enable_rot  : in std_logic;
			in0  			: out std_logic;
			in1			: out std_logic;
			led_in0     : out std_logic;
			led_in1     : out std_logic
		 );
end demux_rotation;

architecture arq1 of demux_rotation is
begin
	process(selectRot, enable_rot)
	begin 
		if enable_rot = '0' then
			in0 <= '0';
			in1 <= '0';
			led_in0 <= '0';
			led_in1 <= '0';
		else
			if(selectRot = '0') then
				in0 <= '1';
				led_in0 <= '1';
				in1 <= '0';
				led_in1 <= '0';
			else 
				in1 <= '1';
				led_in1 <= '1';
				led_in0 <= '0';
				in0 <= '0';
			end if;
		end if;
	end process;
end arq1;