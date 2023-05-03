

library IEEE;
use IEEE.STD_LOGIC_1164.all;

package MyPackage is

component reg is
 Port ( i : in  STD_LOGIC_VECTOR (31 downto 0);
           rst : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           load : in  STD_LOGIC;
           inc : in  STD_LOGIC;
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component dec5x32 is
 Port ( I : in  STD_LOGIC_VECTOR (4 DOWNTO 0);
           E : in  STD_LOGIC;
O : out STD_LOGIC_VECTOR (31 DOWNTO 0));
end component;

component mux32x1 is
Port ( s : in  STD_LOGIC_VECTOR (4 downto 0);
           i0 : in  STD_LOGIC_VECTOR (31 downto 0);
           i1 : in  STD_LOGIC_VECTOR (31 downto 0);
           i2 : in  STD_LOGIC_VECTOR (31 downto 0);
           i3 : in  STD_LOGIC_VECTOR (31 downto 0);
           i4 : in  STD_LOGIC_VECTOR (31 downto 0);
           i5 : in  STD_LOGIC_VECTOR (31 downto 0);
           i6 : in  STD_LOGIC_VECTOR (31 downto 0);
           i7 : in  STD_LOGIC_VECTOR (31 downto 0);
           i8 : in  STD_LOGIC_VECTOR (31 downto 0);
           i9 : in  STD_LOGIC_VECTOR (31 downto 0);
           i10 : in  STD_LOGIC_VECTOR (31 downto 0);
           i11 : in  STD_LOGIC_VECTOR (31 downto 0);
           i12 : in  STD_LOGIC_VECTOR (31 downto 0);
           i13 : in  STD_LOGIC_VECTOR (31 downto 0);
           i14 : in  STD_LOGIC_VECTOR (31 downto 0);
           i15 : in  STD_LOGIC_VECTOR (31 downto 0);
           i16 : in  STD_LOGIC_VECTOR (31 downto 0);
           i17 : in  STD_LOGIC_VECTOR (31 downto 0);
           i18 : in  STD_LOGIC_VECTOR (31 downto 0);
           i19 : in  STD_LOGIC_VECTOR (31 downto 0);
           i20 : in  STD_LOGIC_VECTOR (31 downto 0);
           i21 : in  STD_LOGIC_VECTOR (31 downto 0);
           i22 : in  STD_LOGIC_VECTOR (31 downto 0);
           i23 : in  STD_LOGIC_VECTOR (31 downto 0);
           i24 : in  STD_LOGIC_VECTOR (31 downto 0);
           i25 : in  STD_LOGIC_VECTOR (31 downto 0);
           i26 : in  STD_LOGIC_VECTOR (31 downto 0);
           i27 : in  STD_LOGIC_VECTOR (31 downto 0);
           i28 : in  STD_LOGIC_VECTOR (31 downto 0);
           i29 : in  STD_LOGIC_VECTOR (31 downto 0);
           i30 : in  STD_LOGIC_VECTOR (31 downto 0);
           i31 : in  STD_LOGIC_VECTOR (31 downto 0);
           o : out  STD_LOGIC_VECTOR (31 downto 0));
end component;

component ALUControlUnit is
Port (FunctCode : in STD_LOGIC_VECTOR (5 downto 0);
		ALUOp: in STD_LOGIC_VECTOR (1 downto 0);
		ALUFunct : out STD_LOGIC_VECTOR (3 downto 0));
end component;

component muxx2x1 is
port ( s: in std_logic;
	            i0: in std_logic_vector (31 downto 0);
	            i1: in std_logic_vector (31 downto 0);
               o: out std_logic_vector (31 downto 0));
end component;
  
component INSTRMEMORY is
port(
LoadIt: in Std_logic;
DATA: out STD_LOGIC_VECTOR (31 downto 0);
ADDRESS: in STD_LOGIC_VECTOR (31 downto 0);
CLK : in STD_LOGIC);

end component;



component ControlUnit is
Port
( Opcode:in STD_LOGIC_VECTOR (5 downto 0) ;
MemRead:out STD_LOGIC;
Memwrite : out STD_LOGIC;
RegDst:out STD_LOGIC;
Branch:out STD_LOGIC;
MemtoReg:out STD_LOGIC;
ALUSrc:out STD_LOGIC;
ALUOp:out STD_LOGIC_VECTOR (1 downto 0) ;
Jump: out STD_LOGIC;
RegWrite:out STD_LOGIC);
end component;


component RegisterFile is
Port (read_sel1 : in STD_LOGIC_VECTOR (4 downto 0);
		read_sel2 : in STD_LOGIC_VECTOR (4 downto 0);
		write_sel: in STD_LOGIC_VECTOR (4 downto 0);
		write_ena : in STD_LOGIC;
		clk: in STD_LOGIC;
		write_data : in STD_LOGIC_VECTOR (31 downto 0);
		data1: out STD_LOGIC_VECTOR (31 downto 0);
		data2 : out STD_LOGIC_VECTOR (31 downto 0));
end component;


component sla2 is
port ( i: in STD_LOGIC_VECTOR (31 downto 0);
       o: out STD_LOGIC_VECTOR (31 downto 0));
end component;

component SignExtend is
port (	i: in std_logic_vector (15 downto 0);
			o: out std_logic_vector (31 downto 0));	  
end component;

component PC is 
port    (
	 clk: in std_logic;
	 rst : in std_logic;
	 address: in std_logic_vector (31 downto 0);
	 PC: out std_logic_vector (31 downto 0));
end component;

component plus4 is
port ( i: in std_logic_vector (31 downto 0);
	    o: out std_logic_vector (31 downto 0));
end component;

component JA is
Port (   leftin:in STD_LOGIC_VECTOR (31 downto 0) ;
			rightin: in STD_LOGIC_VECTOR (31 downto 0);
			Output :out STD_LOGIC_VECTOR (31 downto 0));
end component;


component mux5bitx1 is
Port ( S: in std_logic;
		i0: in std_logic_vector (4 downto 0);
		i1: in std_logic_vector (4 downto 0);
	 	o: out std_logic_vector (4 downto 0));
end component;

component datamem is
port( Loadit : in STD_LOGIC;
		INPUT : in STD_LOGIC_VECTOR (31 downto 0);
		OUTPUT : out STD_LOGIC_VECTOR (31 downto 0);
		memoryread: in STD_LOGIC;
		memorywrite: in STD_LOGIC;
		ADDRESS : in STD_LOGIC_VECTOR (31 downto 0);
		CLK : in STD_LOGIC );
end component;

component alu is
 Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           cflag : out  STD_LOGIC;
           zflag : out  STD_LOGIC;
           oflag : out  STD_LOGIC);
end component;



signal instructionAddress : std_logic_vector (31 downto 0) := X"00000000";
signal InstrAddressAdd4 : std_logic_vector (31 downto 0)  := X"00000000";

 signal instructionShifted : std_logic_vector (31 downto 0) := X"00000000";
signal jumpInstrAddress : std_logic_vector (31 downto 0) := X"00000000";

signal branchInstAddress : std_logic_vector (31 downto 0) := X"00000000";
signal immedValue16: std_logic_vector (31 downto 0) := X"00000000";
signal branchvalueShifted : std_logic_vector (31 downto 0) := X"00000000";
signal intermediateAddress : std_logic_vector (31 downto 0) := X"00000000";

signal newInstrAddress : std_logic_vector (31 downto 0) := X"00000000";
signal instruction : std_logic_vector (31 downto 0):= X"00000000";

signal MemRead: std_logic := '0';
signal MemWrite: std_logic := '0';
signal RegDst: std_logic := '0';
signal Branch: std_logic := '0';
signal MemtoReg: std_logic := '0';
signal ALUSrc: std_logic := '0';
signal ALUOp: std_logic_vector (1 downto 0) := "00";
signal Jump: std_logic := '0';
signal RegWrite: std_logic := '0';


signal WriteRegister : std_logic_vector (4 downto 0) := "00000";
signal WriteData: std_logic_vector (31 downto 0) := X"00000000";
signal ReadData1: std_logic_vector (31 downto 0) := X"00000000";
signal ReadData2: std_logic_vector (31 downto 0) := X"00000000";

signal ALUFunct : std_logic_vector (3 downto 0) := "0000";
signal ALUZero: std_logic := '0';
signal ALUMuxInput: std_logic_vector (31 downto 0):= X"00000000";
signal ALUOutTemp: std_logic_vector (31 downto 0):= X"00000000";

signal DataMemoutTemp: std_logic_vector (31 downto 0) := X"00000000";

signal BranchingSignal : std_logic := '0';

end MyPackage;


package body mypackage is

---- Example 1
--  function <function_name>  (signal <signal_name> : in <type_declaration>  ) return <type_declaration> is
--    variable <variable_name>     : <type_declaration>;
--  begin
--    <variable_name> := <signal_name> xor <signal_name>;
--    return <variable_name>; 
--  end <function_name>;

---- Example 2
--  function <function_name>  (signal <signal_name> : in <type_declaration>;
--                         signal <signal_name>   : in <type_declaration>  ) return <type_declaration> is
--  begin
--    if (<signal_name> = '1') then
--      return <signal_name>;
--    else
--      return 'Z';
--    end if;
--  end <function_name>;

---- Procedure Example
--  procedure <procedure_name>  (<type_declaration> <constant_name>  : in <type_declaration>) is
--    
--  begin
--    
--  end <procedure_name>;
 
end mypackage;
