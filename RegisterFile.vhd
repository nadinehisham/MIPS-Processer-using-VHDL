
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;
use work.mypackage.all;


entity RegisterFile is
    Port ( read_sel1 : in  STD_LOGIC_VECTOR (4 downto 0);
           read_sel2 : in  STD_LOGIC_VECTOR (4 downto 0);
           write_sel : in  STD_LOGIC_VECTOR (4 downto 0);
           write_ena : in  STD_LOGIC;
           clk : in  STD_LOGIC;
           write_data : in  STD_LOGIC_VECTOR (31 downto 0);
           data1 : out  STD_LOGIC_VECTOR (31 downto 0);
           data2 : out  STD_LOGIC_VECTOR (31 downto 0));
end RegisterFile;

architecture Behavioral of RegisterFile is
signal L, out0, out1, out2, out3, out4, out5, out6,
out7, out8, out9, out10, out11, out12, out13, out14, out15,
out16, out17, out18, out19, out20, out21, out22, out23, out24,
out25, out26, out27, out28, out29, out30, out31: std_logic_vector (31 downto 0);
begin

decoo: dec5x32 port map (write_sel, write_ena, L);
reg0:  reg  port map (x"00000000", '0', clk, L(0), '0', out0);
reg1:  reg  port map (write_data, '0', clk, L(1), '0', out1);
reg2:  reg  port map (write_data, '0', clk, L(2), '0', out2);
reg3:  reg  port map (write_data, '0', clk, L(3), '0', out3);
reg4:  reg  port map (write_data, '0', clk, L(4), '0', out4);
reg5:  reg  port map (write_data, '0', clk, L(5), '0', out5);
reg6:  reg  port map (write_data, '0', clk, L(6), '0', out6);
reg7:  reg  port map (write_data, '0', clk, L(7), '0', out7);
reg8:  reg  port map (write_data, '0', clk, L(8), '0', out8);
reg9:  reg  port map (write_data, '0', clk, L(9), '0', out9);
reg10:  reg  port map (write_data, '0', clk, L(10), '0', out10);
reg11:  reg  port map (write_data, '0', clk, L(11), '0', out11);
reg12:  reg  port map (write_data, '0', clk, L(12), '0', out12);
reg13:  reg  port map (write_data, '0', clk, L(13), '0', out13);
reg14:  reg  port map (write_data, '0', clk, L(14), '0', out14);
reg15:  reg  port map (write_data, '0', clk, L(15), '0', out15);
reg16:  reg  port map (write_data, '0', clk, L(16), '0', out16);
reg17:  reg  port map (write_data, '0', clk, L(17), '0', out17);
reg18:  reg  port map (write_data, '0', clk, L(18), '0', out18);
reg19:  reg  port map (write_data, '0', clk, L(19), '0', out19);
reg20:  reg  port map (write_data, '0', clk, L(20), '0', out20);
reg21:  reg  port map (write_data, '0', clk, L(21), '0', out21);
reg22:  reg  port map (write_data, '0', clk, L(22), '0', out22);
reg23:  reg  port map (write_data, '0', clk, L(23), '0', out23);
reg24:  reg  port map (write_data, '0', clk, L(24), '0', out24);
reg25:  reg  port map (write_data, '0', clk, L(25), '0', out25);
reg26:  reg  port map (write_data, '0', clk, L(26), '0', out26);
reg27:  reg  port map (write_data, '0', clk, L(27), '0', out27);
reg28:  reg  port map (write_data, '0', clk, L(28), '0', out28);
reg29:  reg  port map (write_data, '0', clk, L(29), '0', out29);
reg30:  reg  port map (write_data, '0', clk, L(30), '0', out30);
reg31:  reg  port map (write_data, '0', clk, L(31), '0', out31);

mux1: mux32x1 port map (read_sel1, out0, out1, out2, out3, out4, out5, out6,
								out7, out8, out9, out10, out11, out12, out13, out14, out15,
								out16, out17, out18, out19, out20, out21, out22, out23, out24,
								out25, out26, out27, out28, out29, out30, out31, data1); 
								
mux2: mux32x1 port map (read_sel2, out0, out1, out2, out3, out4, out5, out6,
								out7, out8, out9, out10, out11, out12, out13, out14, out15,
								out16, out17, out18, out19, out20, out21, out22, out23, out24,
								out25, out26, out27, out28, out29, out30, out31, data2); 

end Behavioral;

