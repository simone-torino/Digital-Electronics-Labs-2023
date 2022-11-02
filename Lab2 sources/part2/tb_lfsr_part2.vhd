LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use WORK.constants.all;


entity tb_prg_top is

end tb_prg_top;

architecture tb of tb_prg_top is

    component prg_top
        port (CLOCK_50  : in std_logic;
              KEY  : in std_logic;
              LEDR : out std_logic_vector (9 downto 0));
    end component;

    signal clk_tb  : std_logic;
    signal key_tb  : std_logic;
    signal ledr_tb : std_logic_vector (9 downto 0);
begin
PROCESS
 BEGIN
clk_tb <= '1';
WAIT FOR 10 ns;
clk_tb <= '0';
WAIT FOR 10 ns;
END PROCESS;

   PROCESS
   BEGIN
key_tb <= '0'; --key --> active low


WAIT FOR 20 ns;
key_tb<='1';

WAIT;

END PROCESS;

dut: prg_top port map (CLOCK_50=>clk_tb,KEY=>key_tb,LEDR=>ledr_tb);

end tb;
