Library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE IEEE.NUMERIC_STD.ALL;

entity plus4 is 
	port ( i: in std_logic_vector (31 downto 0);
	           o: out std_logic_vector (31 downto 0));
end plus4;
architecture Behavioral of plus4 is
begin
o <= std_logic_vector(signed(i)+4);
end behavioral;
