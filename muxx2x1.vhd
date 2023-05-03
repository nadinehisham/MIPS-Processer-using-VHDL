library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity muxx2x1 is
	port ( s: in std_logic;
	           i0: in std_logic_vector (31 downto 0);
	            i1: in std_logic_vector (31 downto 0);
                            o: out std_logic_vector (31 downto 0));
end muxx2x1;
architecture Behavioral of muxx2x1 is
begin
o <= 	i0 when s = '0' else
	i1 when s = '1' else
	(others => 'Z');
end Behavioral;
