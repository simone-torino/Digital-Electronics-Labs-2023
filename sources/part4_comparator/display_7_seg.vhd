LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY display_7_seg IS
      PORT (
            SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
            HEX : OUT STD_LOGIC_VECTOR(0 TO 6));
END display_7_seg;

ARCHITECTURE STRUCTURE OF display_7_seg IS
BEGIN
      HEX <= "0000001" WHEN SW = "0000" ELSE
            "1001111" WHEN SW = "0001" ELSE
            "0010010" WHEN SW = "0010" ELSE
            "0000110" WHEN SW = "0011" ELSE
            "1001100" WHEN SW = "0100" ELSE
            "0100100" WHEN SW = "0101" ELSE
            "0100000" WHEN SW = "0110" ELSE
            "0001111" WHEN SW = "0111" ELSE
            "0000000" WHEN SW = "1000" ELSE
            "0001100" WHEN SW = "1001" ELSE
            "0001000" WHEN SW = "1010" ELSE
            "1100000" WHEN SW = "1011" ELSE
            "0110001" WHEN SW = "1100" ELSE
            "1000010" WHEN SW = "1101" ELSE
            "0110000" WHEN SW = "1110" ELSE
            "0111000" WHEN SW = "1111";

END STRUCTURE;