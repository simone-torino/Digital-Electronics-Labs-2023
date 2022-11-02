LIBRARY ieee;
USE ieee.std_logic_1164.all;
USE ieee.numeric_std.all;


ENTITY counter_9 IS
   PORT (CLOCK_50: IN STD_LOGIC;
         reset,one,UDn: IN STD_LOGIC;
         digits: OUT STD_LOGIC_VECTOR(3 DOWNTO 0));
END counter_9;

ARCHITECTURE structure OF counter_9 IS

   SIGNAL Q: UNSIGNED (3 DOWNTO 0);
   
BEGIN

   PROCESS (CLOCK_50,reset,one)
   
   BEGIN
   
      IF (reset='0') THEN                   
         Q <= "0000";
      ELSIF ((CLOCK_50' EVENT) AND (CLOCK_50='1')) THEN
	    IF (one='1') THEN
   		 IF (UDn='1') THEN 
           		 
            IF (Q="1001") THEN
               Q <= "0000";
            ELSE
               Q <= Q + 1; 
            END IF;
	     ELSIF (UDn='0') THEN  
           		 
            IF (Q="0000") THEN
               Q <= "1001";
            ELSE
               Q <= Q - 1; 
            END IF;                    
         END IF;
		END IF;
      END IF;
      
    END PROCESS;
    
digits <= STD_LOGIC_VECTOR(Q);        
END structure;
