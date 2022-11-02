LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;

ENTITY counter_27 IS
   PORT (CLOCK_50: IN STD_LOGIC;
         period: IN STD_LOGIC_VECTOR(1 DOWNTO 0);
         reset: IN STD_LOGIC;
		 one: OUT STD_LOGIC);
END counter_27;

ARCHITECTURE structure OF counter_27 IS

   SIGNAL Qi,Q2,Q1,Q500,Q250: UNSIGNED (26 DOWNTO 0);
BEGIN

   Q2 <= "101111101011110000100000000";  -- 100000000 in binary
   Q1 <="010111110101111000010000000";   -- 50000000 in binary
   Q500 <= "001011111010111100001000000";-- 25000000 in binary
   Q250 <= "000101111101011110000100000";-- 12500000 in binary

PROCESS (CLOCK_50,reset)
BEGIN

    IF (reset='0') THEN     
         one <= '0';
         Qi <= (OTHERS => '0');
    ELSIF ((CLOCK_50' EVENT) AND (CLOCK_50='1')) THEN	     
         IF (period="00") THEN     --2 SEC

            IF (Qi=Q2) THEN

               one <= '1';

               Qi <= (OTHERS => '0');

             ELSE
               one <= '0';
               Qi <= Qi + 1;
             END IF;
          END IF;

         IF (period="01") THEN     --1 SEC

            IF (Qi=Q1) THEN

               one <= '1';

               Qi <= (OTHERS => '0');
			ELSIF (Qi>Q1) THEN
			   
			   one <= '0';
			   
               Qi <= (OTHERS => '0');

            ELSE
               one <= '0';
               Qi <= Qi + 1;
            END IF;
          END IF;
		  
         IF (period="10") THEN     --500 MS

            IF (Qi=Q500) THEN

               one <= '1';

               Qi <= (OTHERS => '0');

            ELSIF (Qi>Q500) THEN
			   
			   one <= '0';
			   
               Qi <= (OTHERS => '0');

            ELSE
               one <= '0';
               Qi <= Qi + 1;
            END IF;
          END IF;
		  
         IF (period="11") THEN     --250 MS

            IF (Qi=Q250) THEN+

               one <= '1';

               Qi <= (OTHERS => '0');

            ELSIF (Qi>Q250) THEN
			   
			   one <= '0';
			   
               Qi <= (OTHERS => '0');

            ELSE
               one <= '0';
               Qi <= Qi + 1;
            END IF;
          END IF;
    END IF;   
END PROCESS;
	
END structure;
