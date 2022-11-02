LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;

entity t_counter is
GENERIC (N : integer := 16);
end t_counter;

architecture tb of t_counter is

    component counter
        GENERIC (N : integer := 16);

  port (
    RSTn:  in std_logic;
    CLK:   in std_logic;
	 CLEAR: in std_logic;
    EN:    in std_logic;
    UDn:   in std_logic;
    VALU  : out std_logic_vector(N-1 downto 0)
	 );
  end component;

    signal rstn_tb   : std_logic;
    signal clk_tb   : std_logic;
    signal clear_tb : std_logic;
	 signal en_tb    : std_logic;
	 signal udn_tb    : std_logic;
	 signal valu_tb    : std_logic_vector (15 downto 0);
	
	 
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
rstn_tb <= '0'; -- initial
clear_tb<='1';
en_tb<='0';
udn_tb<='0';


WAIT FOR 20 ns;
rstn_tb <= '1';  --active enable
clear_tb<='0'; 
en_tb<='1';
udn_tb<='0';

WAIT FOR 200 ns;
 rstn_tb <= '1'; -- active low
clear_tb<='0'; 
en_tb<='1';
udn_tb<='1';
WAIT FOR 200 ns;
 rstn_tb <= '1'; -- active low
clear_tb<='0'; 
en_tb<='0';
udn_tb<='1';
WAIT FOR 20 ns;
 rstn_tb <= '1'; -- active low
clear_tb<='1'; 
en_tb<='1';
udn_tb<='0';
WAIT FOR 60 ns;
 rstn_tb <= '1'; -- active low
clear_tb<='1'; 
en_tb<='0';
udn_tb<='0';
WAIT FOR 200 ns;
 rstn_tb <= '1'; -- active low
clear_tb<='0'; 
en_tb<='1';
udn_tb<='0';
WAIT FOR 200 ns;
 rstn_tb <= '1'; -- active low
clear_tb<='0'; 
en_tb<='1';
udn_tb<='1';

WAIT;

END PROCESS;

dut: counter port map (RSTn=>rstn_tb, 
    CLK=>clk_tb,
     CLEAR=>clear_tb,
    EN=>en_tb,
    UDn=>udn_tb,
    VALU => valu_tb );

end tb;
 
