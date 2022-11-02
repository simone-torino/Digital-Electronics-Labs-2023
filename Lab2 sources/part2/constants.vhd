LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

PACKAGE CONSTANTS IS

    CONSTANT Q_1 : UNSIGNED(31 DOWNTO 0) := x"02faf080"; --1s 50M clock cycles (50,000000)
    CONSTANT Q_2 : UNSIGNED(31 DOWNTO 0) := x"05f5e100"; --2s 100M clock cycles (100,000000)
    CONSTANT Q_05 : UNSIGNED(31 DOWNTO 0) := x"017d7840"; --0.5s 25M clock cycles (25,000000)
    CONSTANT Q_025 : UNSIGNED(31 DOWNTO 0) := x"00bebc20"; --0.25s 12.5M clock cycles (12,500000)
    CONSTANT Q_micro : UNSIGNED(31 DOWNTO 0) := x"00000032"; --1us 50 times clock clock cycles

END CONSTANTS; 
