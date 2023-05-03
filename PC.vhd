library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity PC is
port    (
	 clk: in std_logic;
	 rst : in std_logic;
	 address: in std_logic_vector (31 downto 0);
	 PC: out std_logic_vector (31 downto 0));
end PC;

architecture Behavioral of PC is

signal instAddress: std_logic_vector (31 downto 0) := x"00000000";

begin

PC_Process: process (clk, rst)

begin
if rising_edge(clk) then
	instaddress <= address;
	end if;
if rst= '1' then
	instaddress <= x"00000000";
	end if;
end process;

PC <= instaddress;
end behavioral;
