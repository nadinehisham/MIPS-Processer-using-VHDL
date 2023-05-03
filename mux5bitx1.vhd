library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity mux5bitx1 is 
	Port ( S: in std_logic;
		i0: in std_logic_vector (4 downto 0);
		i1: in std_logic_vector (4 downto 0);
	 	o: out std_logic_vector (4 downto 0));
end mux5bitx1;
architecture Behavioral of mux5bitx1 is
begin
o <= i0 when s= '0' else
	i1 when s= '1' else
	(others => 'Z');
end behavioral;
