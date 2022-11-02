LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
ENTITY ucmp IS

    GENERIC (N : INTEGER := 32);
    PORT (
        clk, rstn : IN STD_LOGIC;
        input_c, input_p : IN UNSIGNED(31 DOWNTO 0);
        output_flag : OUT STD_LOGIC
    );
END ucmp;

ARCHITECTURE bhv OF ucmp IS

BEGIN
    PROCESS (clk, rstn)
    BEGIN

        IF (rstn = '0') THEN
            output_flag <= '0';
        ELSIF (clk'EVENT AND clk = '1') THEN
            IF (input_c = (input_p - 2)) THEN
                output_flag <= '1';
            ELSE
                output_flag <= '0';
            END IF;
        END IF;
    END PROCESS;

END bhv;
