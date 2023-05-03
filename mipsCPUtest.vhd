
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

 
ENTITY mipsCPUtest IS
END mipsCPUtest;
 
ARCHITECTURE behavior OF mipsCPUtest IS 
 
 
    COMPONENT MIPSCPU
    PORT(
         START : IN  std_logic;
         CLK : IN  std_logic;
         RegFileO1 : OUT  std_logic_vector(31 downto 0);
         RegFileO2 : OUT  std_logic_vector(31 downto 0);
         ALUO : OUT  std_logic_vector(31 downto 0);
         PCO : OUT  std_logic_vector(31 downto 0);
         DataMemO : OUT  std_logic_vector(31 downto 0)
			);
    END COMPONENT;
    

   --Inputs
   signal START : std_logic := '0';
   signal CLK : std_logic := '0';

 	--Outputs
   signal RegFileO1 : std_logic_vector(31 downto 0);
   signal RegFileO2 : std_logic_vector(31 downto 0);
   signal ALUO : std_logic_vector(31 downto 0);
   signal PCO : std_logic_vector(31 downto 0);
   signal DataMemO : std_logic_vector(31 downto 0);
   
			

   -- Clock period definitions
   constant CLK_period : time := 10 ns;
 
BEGIN
 
	-- Instantiate the Unit Under Test (UUT)
   uut: MIPSCPU PORT MAP (
          START => START,
          CLK => CLK,
          RegFileO1 => RegFileO1,
          RegFileO2 => RegFileO2,
          ALUO => ALUO,
          PCO => PCO,
          DataMemO => DataMemO
        );

   -- Clock process definitions
   CLK_process :process
   begin
		CLK <= '0';
		wait for CLK_period/2;
		CLK <= '1';
		wait for CLK_period/2;
   end process;
 

   -- Stimulus process
   stim_proc: process
   begin		
      start <= '1';
		wait for 30 ns;
		start <='0';
		wait for 30 ns;

      wait;
   end process;

END;
