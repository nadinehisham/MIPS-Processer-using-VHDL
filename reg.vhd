
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;
use IEEE.NUMERIC_STD.ALL;


entity reg is
    Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           load : in  STD_LOGIC;
           inc : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end reg;

architecture Behavioral of reg is
signal tmp: std_logic_vector (31 downto 0) :=x"00000000";
begin
process (clk, rst)
begin
if (rst = '1') then
tmp <= (others => '0');
	elsif (Falling_edge(clk) and load = '1') then
	tmp <= i;
		elsif (falling_edge(clk) and inc = '1') then
		tmp <= std_logic_vector(signed(tmp)+1);
end if;
end process;
o <= tmp;

end Behavioral;

