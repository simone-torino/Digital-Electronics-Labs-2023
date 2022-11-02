LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY Testbench_FD IS

END Testbench_FD;

ARCHITECTURE structure OF Testbench_FD IS
   COMPONENT digits_flashing IS
      PORT (CLOCK_50: IN STD_LOGIC;
            SW: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		    KEY0: IN STD_LOGIC;
			HEX0: OUT STD_LOGIC_VECTOR(0 TO 6));
   END COMPONENT;

SIGNAL clock: STD_LOGIC;
SIGNAL S: STD_LOGIC_VECTOR(2 DOWNTO 0);
SIGNAL K0: STD_LOGIC;
SIGNAL H0: STD_LOGIC_VECTOR(0 TO 6);
BEGIN
     
PROCESS
 BEGIN
clock <= '1';
WAIT FOR 10 ns;
clock <= '0';
WAIT FOR 10 ns;
END PROCESS;

PROCESS
BEGIN
K0 <= '0';
S <= "111";
WAIT FOR 50 ns;
K0 <= '1';
WAIT FOR 1 sec;
S <= "110";
WAIT FOR 800 ms;
K0 <= '0';
WAIT;
END PROCESS;

 flashing_digits_output: digits_flashing PORT MAP(clock,S,K0,H0);
END structure;
 
