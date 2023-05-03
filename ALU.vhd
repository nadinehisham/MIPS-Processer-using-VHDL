----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    18:39:27 08/12/2022 
-- Design Name: 
-- Module Name:    ALU - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_signed.all;

entity ALU is
    Port ( data1 : in  STD_LOGIC_VECTOR (31 downto 0);
           data2 : in  STD_LOGIC_VECTOR (31 downto 0);
           aluop : in  STD_LOGIC_VECTOR (3 downto 0);
           cin : in  STD_LOGIC;
           dataout : out  STD_LOGIC_VECTOR (31 downto 0);
           cflag : out  STD_LOGIC;
           zflag : out  STD_LOGIC;
           oflag : out  STD_LOGIC);
end ALU;

architecture Behavioral of ALU is

begin
process (data1, data2, aluop, cin)
variable tmp: std_logic_vector (32 downto 0);
variable outv: std_logic_vector (31 downto 0);
variable cvar, zvar, cintmp: std_logic;
begin
cflag <= '0';
oflag <= '0';
tmp := "000000000000000000000000000000000";
zvar := '0';

case aluop is

when "0010" => 
cintmp := cin;
tmp := ('0' & data1) + ('0' & data2) + cintmp;
outv:= tmp (31 downto 0);
cvar := tmp(32);
oflag <= (data1(31) and  data2(31) and not (outv(31))) or (not(data1(31)) and not (data2(31)) and outv(31));
cflag <= cvar;


when "0110" =>
cintmp := '1';
tmp := ('0' & data1) + ('0' & not(data2)) + cintmp;
outv := tmp (31 downto 0);
cvar := not (tmp(32));
oflag <= (data1(31) and not (data2(31)) and not (outv(31))) or (not(data1(31)) and data2(31) and outv(31));
cflag <= cvar;

when "0000" =>
outv := data1 and data2;
when "0001" =>
outv := data1 or data2;
when "1100" =>
outv := data1 nor data2;


when "0111" =>
if(data1 < data2) Then
outv := x"00000001";
else
outv := x"00000000";
end if;



when others =>
outv := "ZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZZ";

end case;

for i in 0 to 31 loop
zvar := zvar or outv(i);
end loop;

dataout <= outv;
zflag <= not zvar;
end process;

end Behavioral;

