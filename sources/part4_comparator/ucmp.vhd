LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

ENTITY ucmp IS
    PORT (
        SW : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
        lt, eq, gt : OUT STD_LOGIC
    );
END ucmp;

ARCHITECTURE bhv OF ucmp IS
BEGIN
    gt <= '1' WHEN (unsigned(SW(7 DOWNTO 4)) > unsigned(SW(3 DOWNTO 0)))
        ELSE
        '0';
    eq <= '1' WHEN (unsigned(SW(7 DOWNTO 4)) = unsigned(SW(3 DOWNTO 0)))
        ELSE
        '0';
    lt <= '1' WHEN (unsigned(SW(7 DOWNTO 4)) < unsigned(SW(3 DOWNTO 0)))
        ELSE
        '0';
END bhv;