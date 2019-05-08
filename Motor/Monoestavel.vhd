library IEEE;
use IEEE.STD_LOGIC_1164.all;

entity Monoestavel is
generic (
  TIME_ON : in natural range 0 to 50000000 := 50000000
);

port (
  trigger  : in  std_logic;
  q        : out std_logic;
  clk      : in  std_logic
);
end Monoestavel;

architecture behavior of Monoestavel is
begin

  process (clk)
    variable cont : natural range 0 to TIME_ON := 0;
    variable triggered : std_logic := '0';

  begin
    if (clk'event and clk = '0') then
      if (triggered = '1') then
	    cont := cont + 1;
	    if (cont = TIME_ON) then
		  triggered := '0';
		end if; 
	  else
	    if (trigger = '1') then
		  triggered := '1';
		  cont := 0;
		end if;
	  end if;
    end if;
  
    q <= triggered;
  
  end process;

end behavior;
