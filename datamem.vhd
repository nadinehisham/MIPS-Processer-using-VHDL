library IEEE;
use IEEE.STD_LOGIC_1164.all;
use IEEE.STD_LOGIC_UNSIGNED.all;

entity datamem is

port( Loadit : in STD_LOGIC;
		INPUT : in STD_LOGIC_VECTOR (31 downto 0);
		OUTPUT : out STD_LOGIC_VECTOR (31 downto 0);
		memoryread: in STD_LOGIC;
		memorywrite: in STD_LOGIC;
		ADDRESS : in STD_LOGIC_VECTOR (31 downto 0);
		CLK : in STD_LOGIC );

 

end datamem;

 

Architecture BEHAVIORAL Of datamem is type MEM is array (0 to 63) of STD_LOGIC_VECTOR (31 downto 0) ;
signal MEMORY : MEM;
signal OUTS: STD_LOGIC_VECTOR (31 downto 0) ;
signal ADDRover4: STD_LOGIC_VECTOR (29 downto 0) ;
signal ADDR_int: integer;

 

begin

 

process( memoryread, memorywrite, CLK, ADDRESS, INPUT) is 

 

begin 

 

if Loadit = '1' then

 

memory (0)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (1)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (2)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (3)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (4)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (5)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (6)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (7)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (8)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (9)  <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (10) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (11) <= "XXXXXXXXXXXXXXXXXXXXXXXXXXXXXXXX";
memory (12) <= "00000000000000000000000000001100";
memory (13) <= "00000000000000000000000000000001";
memory (14) <= "00000000000000000000000000000100";

 

else 
 

 

if FALLING_EDGE (CLK) then
if memorywrite = '1' then 
MEMORY (ADDR_int) <= INPUT;
end if;
end if;
end if;
end process;
ADDRover4 <= ADDRESS (31 downto 2);
ADDR_int <= CONV_INTEGER(ADDRover4);
OUTS <= MEMORY (ADDR_int) when memoryread = '1' and (ADDR_int < 64) else
(others => 'Z') when memoryread = '0';
OUTPUT <= OUTS;
end BEHAVIORAL;