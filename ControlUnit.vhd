library IEEE;
Use IEEE.STD_LOGIC_1164.ALL;
entity ControlUnit is
Port
( 		Opcode:in STD_LOGIC_VECTOR (5 downto 0) ;
		MemRead:out STD_LOGIC;
		Memwrite : out STD_LOGIC;
		RegDst:out STD_LOGIC;
		Branch:out STD_LOGIC;
		MemtoReg:out STD_LOGIC;
		ALUSrc:out STD_LOGIC;
		ALUOp:out STD_LOGIC_VECTOR (1 downto 0) ;
		Jump: out STD_LOGIC;
		RegWrite:out STD_LOGIC);
end ControlUnit;


architecture Behavioral of ControlUnit is
begin
Process(Opcode)
BEGIN
RegWrite<= '0';
CASE OpCode Is

 

--R format--

 

WHEN "000000"=>
MemRead<= '0' ;
MemWrite <= '0' ;
RegDst <= '1' ;
Branch <= '0' ;
MemtoReg <= '0' ;
ALUSrc <= '0' ;
ALUOp <= "10";
Jump <= '0' ;
RegWrite <= '1' ;

 

--lw--

 

WHEN "100011"=>
MemRead <= '1' ;
MemWrite <= '0' ;
RegDst <= '0' ;
Branch <= '0' ;
MemtoReg <= '1' ;
ALUSrc<= '1' ;
ALUOp <= "00";
Jump <= '0';
RegWrite <= '1' ;

 

--sw--
WHEN "101011" =>
MemRead <= '0';
 MemWrite <= '1' ;
RegDst <= 'X';
Branch <= '0';
MemtoReg <= 'X';
ALUSrc <= '1' ;
ALUOp <= "00";
Jump <= '0' ;
RegWrite <= '0' ;

 

--beq--
WHEN "000100" =>
MemRead <= '0' ;
MemWrite <= '0' ;
RegDst <= 'X' ; 
Branch <= '1' ;
MemtoReg <= 'X' ;
ALUSrc <= '0' ;
ALUOp <= "01";
Jump <= '0' ;
RegWrite <= '0' ;

 

--bne--
WHEN "000101" =>
MemRead <= '0' ;
MemWrite <= '0' ;
RegDst <= 'X' ; 
Branch <= '1' ;
MemtoReg <= 'X' ;
ALUSrc <= '0' ;
ALUOp <= "01";
Jump <= '0' ;
RegWrite <= '0' ;

 

--beq--
WHEN "000010" =>
MemRead <= '0' ;
MemWrite <= '0' ;
RegDst <= 'X' ; 
Branch <= '0' ;
MemtoReg <= 'X' ;
ALUSrc <= '0' ;
ALUOp <= "00";
Jump <= '1' ;
RegWrite <= '0' ;

 

WHEN OTHERS => NULL;
MemRead <= '0' ;
MemWrite <= '0' ;
RegDst <= '0' ; 
Branch <= '0' ;
MemtoReg <= '0' ;
ALUSrc <= '0' ;
ALUOp <= "00";
Jump <= '0' ;
RegWrite <= '0' ;

 

END CASE;

 

END PROCESS;

 

end Behavioral;