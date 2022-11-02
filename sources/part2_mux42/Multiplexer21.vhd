LIBRARY ieee; 
USE ieee.std_logic_1164.all; 
ENTITY multiplexer21 IS

PORT (s: IN  STD_LOGIC; 
      x: IN  STD_LOGIC;
		y: IN  STD_LOGIC;
		m: OUT STD_LOGIC); 
		
		ENd multiplexer21;
		
		ARCHITECTURE Behavior OF multiplexer21 IS
BEGIN
m <= (NOT (s) AND x) OR (s AND y);
END Behavior; 