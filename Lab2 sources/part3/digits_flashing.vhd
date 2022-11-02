LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY digits_flashing IS
   PORT (CLOCK_50: IN STD_LOGIC;
         SW: IN STD_LOGIC_VECTOR(2 DOWNTO 0);
		 KEY0: IN STD_LOGIC;
         HEX0: OUT STD_LOGIC_VECTOR(0 TO 6));
END digits_flashing;


ARCHITECTURE structure OF digits_flashing IS

   COMPONENT counter_27 IS
      PORT (CLOCK_50: IN STD_LOGIC;
            period: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
            reset: IN STD_LOGIC;
		    one: OUT STD_LOGIC);
   END COMPONENT;
   
   COMPONENT counter_9 IS
      PORT (CLOCK_50: IN STD_LOGIC;
            reset,one,UDn: IN STD_LOGIC;
            digits: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
   END COMPONENT; 
   
   COMPONENT display IS
      PORT (digits: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            HEX0: OUT STD_LOGIC_VECTOR(0 TO 6));
   END COMPONENT; 
   
   SIGNAL one: STD_LOGIC;
   SIGNAL digits: STD_LOGIC_VECTOR(3 DOWNTO 0);
   
BEGIN
   
   counter_27_output: counter_27 PORT MAP (CLOCK_50,SW(1 DOWNTO 0),KEY0,one);
   counter_9_output: counter_9 PORT MAP (CLOCK_50,KEY0,one,SW(2),digits);
   display_output: display PORT MAP (digits,HEX0);
   
END structure;   
 
