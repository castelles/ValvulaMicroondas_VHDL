library ieee;
use ieee.std_logic_1164.all;

entity One_delay is
  port (
    d  : in  std_logic;
    q  : out std_logic;
	 aclear : in  std_logic;
    clk   : in  std_logic
  );
end One_delay;

architecture onedelay_arc of One_delay is
begin
	process (clk, aclear)
	begin

   if (aclear = '1') then
		q <= '0';
	elsif (clk'event and clk = '1') then
      q <= d;
    end if;

  end process;

end onedelay_arc;