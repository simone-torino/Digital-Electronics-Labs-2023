LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY comparator IS
      PORT (
            SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
            LEDR : OUT STD_LOGIC_VECTOR(5 DOWNTO 0);
            HEX1, HEX0 : OUT STD_LOGIC_VECTOR(0 TO 6));
END comparator;
ARCHITECTURE behavior OF comparator IS

      COMPONENT display_7_seg IS
            PORT (
                  SW : IN STD_LOGIC_VECTOR(3 DOWNTO 0);
                  HEX : OUT STD_LOGIC_VECTOR(0 TO 6));
      END COMPONENT;

      COMPONENT ucmp IS
            PORT (
                  SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
                  lt, eq, gt : OUT STD_LOGIC
            );
      END COMPONENT;

      COMPONENT scmp IS
            PORT (
                  SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
                  lt, eq, gt : OUT STD_LOGIC
            );
      END COMPONENT;

BEGIN
      HEX_0 : display_7_seg PORT MAP(SW(3 DOWNTO 0), HEX0);
      HEX_1 : display_7_seg PORT MAP(SW(7 DOWNTO 4), HEX1);
      UCMP_0 : ucmp PORT MAP(SW, LEDR(0), LEDR(1), LEDR(2));
      SCMP_0 : scmp PORT MAP(SW, LEDR(3), LEDR(4), LEDR(5));
END behavior;