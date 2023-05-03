library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use work.MyPackage.all;

entity MIPSCPU is 
	Port (START: in STD_LOGIC; 
			CLK: in STD_LOGIC; 
			RegFileO1 : out STD_LOGIC_VECTOR (31 downto 0);
			RegFileO2 : out STD_LOGIC_VECTOR (31 downto 0); 
			ALUO: out STD_LOGIC_VECTOR (31 downto 0); 
			PCO : out STD_LOGIC_VECTOR (31 downto 0); 
			DataMemO: out STD_LOGIC_VECTOR (31 downto 0)
			);
end MIPSCPU;

architecture Behavioral of MIPSCPU is
begin

-- PC operations
	
	PC_Adder: plus4 					port map (i => instructionAddress, o => InstrAddressAdd4);

-- branches
	
	Branch_PC_Sign: SignExtend    port map (i => instruction (15 downto 0), o => immedValue16); 
	
	Branch_PC_Shift : sla2 			port map (i => immedValue16, o => branchValueShifted);
	
	Branch_PC_Adder : ALU  			port map (data1 => InstrAddressAdd4, data2 => branchvalueShifted, aluop => "0010", cin =>'0'
							                      ,dataout => branchInstAddress, cflag => open, zflag =>open, oflag =>open);
														 
 BranchingSignal <= Branch AND ((ALUZero AND NOT (instruction (26))) OR (NOT (ALUZero) AND instruction (26)));


	PC_BranchMux : muxx2x1    		port map (S => BranchingSignal, i0 => InstrAddressAdd4, i1 => branchInstAddress, O => intermediateAddress);

-- jumps							
	
	PC_Shifter: sla2 					port map (I => instruction, O => instructionShifted);
	
	PC_JumpConc: JA				   port map (leftin => InstrAddressAdd4, rightin => instructionShifted,
															Output => jumpInstrAddress); 
					
	PC_JumpMux:  muxx2x1  		   port map (S => Jump, i0 => intermediateAddress, i1 => JumpInstrAddress,
															o => newInstrAddress);
--	PC			
	Program_Counter : PC   		   port map (CLK => CLK, RST => START, Address => newInstrAddress, PC => instructionAddress);
	
	

--Instruction memory
Instr_Memory: INSTRMEMORY 			port map (LoadIt => START, DATA => instruction, ADDRESS => instructionAddress, CLK => CLK);
	
					
--Main Control Unit
Control_Unit: ControlUnit 			port map(OpCode => instruction (31 downto 26), MemRead => MemRead, MemWrite =>
														MemWrite, RegDst =>RegDst, Branch=> Branch, MemtoReg => MemtoReg, ALUSrc => ALUSrc,
														ALUOp => ALUOp,Jump => Jump, RegWrite => RegWrite);

--RegisterFile
CPU_WriteRegMUx : Mux5bitx1      port map (S => RegDst, i0 => instruction (20 downto 16), i1 => instruction (15 downto 11),
															o => WriteRegister);



CPU_Registers: RegisterFile	   port map (read_sel1 => instruction (25 downto 21), read_sel2 => instruction (20 downto 16),
															write_sel => WriteRegister, write_ena => RegWrite, clk => CLK,
															write_data => WriteData, data1 => ReadData1, data2 => ReadData2);


--ALU & ALU Control unit
ALU_Control : ALUControlUnit     port map (FunctCode => instruction (5 downto 0), ALUOp => ALUOp, ALUFunct => ALUFunct);

ALU_InputMux: muxx2x1            port map (s => ALUSrc, i0 => ReadData2, i1 => immedValue16,
															o => ALUMuxInput);

ALU_Unit: ALU 							port map (data1 => ReadData1, data2 => ALUMuxInput,
															aluop => ALUFunct, cin => '0', dataout => ALUOutTemp, cflag => open,
															zflag => ALUZero, oflag =>open );

--Data memory

Data_Memory:DATAMEM  				port map (LoadIt => START, INPUT => ReadData2,
														   OUTPUT => DataMemOutTemp, memoryread => MemRead, MEMORYWRITE => MemWrite,
															ADDRESS => ALUOutTemp, CLK => CLK);


Data_MemMuxOut : muxx2x1 			port map (s => MemtoReg, i0 => ALUOutTemp, i1 => DataMemOutTemp, o => WriteData);


--Outputs--

RegFileO1 <= ReadData1;
RegFileO2 <= ReadData2;
ALUO <= ALUOutTemp;
PCO <= instructionAddress;
DataMemO <= DataMemOutTemp;



end Behavioral;





	