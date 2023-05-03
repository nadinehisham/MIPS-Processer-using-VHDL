library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
entity ALUControlUnit is
Port ( Functcode : in STD_LOGIC_VECTOR (5 downto 0);
ALUOp:in STD_LOGIC_VECTOR (1 downto 0);
ALUFunct:out STD_LOGIC_VECTOR (3 downto 0));
end ALUControlUnit;
architecture Behavioral of ALUControlUnit is
begin

 

ALUFunct(3) <= (ALUOp(1) AND FunctCode (0) AND FunctCode (1) AND FunctCode (5));

 

ALUFunct (2) <= ALUOp (0) OR (ALUOp(1) AND Functcode (1)) ;

 

ALUFunct (1) <= NOT ALUOp(1) OR ((NOT FunctCode (2)) AND NOT (FunctCode (0))); 

 

ALUFunct (0) <= (FunctCode (3) OR FunctCode (0)) AND (NOT (FunctCode(1) AND FunctCode (0) )) AND ALUOp(1);

 

end Behavioral;