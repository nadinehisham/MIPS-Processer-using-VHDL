library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity SLA2 is 
      port ( i: in STD_LOGIC_VECTOR (31 downto 0);
                 o: out STD_LOGIC_VECTOR (31 downto 0));
end sla2;
architecture Behavioral of sla2 is
begin
--to keep the sign:
o(31) <=  i(31);
o(30 downto 2) <= i(28 downto 0);
o(1 downto 0) <= (others => '0');
end behavioral;


