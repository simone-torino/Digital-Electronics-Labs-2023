LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE ieee.numeric_std.ALL;
use WORK.constants.all; --used to access constants stored in constants.vhd

ENTITY prg_top IS
 GENERIC (N : integer := 32);


    PORT (
	     CLOCK_50,KEY: in std_logic;
        LEDR : OUT STD_LOGIC_VECTOR (9 DOWNTO 0)
    );
END prg_top;

architecture topstr of prg_top is

component counter is
    GENERIC (N : integer := 32);


  port (
    RSTn:  in std_logic;
    CLK:   in std_logic;
	 CLEAR: in std_logic;
    EN:    in std_logic;
    UDn:   in std_logic;
    VALU  : out std_logic_vector(N-1 downto 0)
	 );
  end component;

  
  component lfsr_part2 is 
port (
  clk           : in  std_logic;
  rstn          : in  std_logic;
  en            : in  std_logic;
  led          : out std_logic_vector (9 downto 0)
  );
  end component;

  
component ucmp IS
    GENERIC (N : integer := 32);

    port (
	     clk, rstn: in std_logic;
        input_c, input_p : IN UNSIGNED(31 DOWNTO 0);
        output_flag : OUT STD_LOGIC
    );
end component;

signal q            : std_logic_vector (N-1 downto 0); --Valu
signal flag,s_en, s_udn, s_RSTn, s_clk        : std_logic;
signal   s_led     : std_logic_vector (9 downto 0);
signal pi :UNSIGNED(31 DOWNTO 0);--period

  begin 
  s_clk<= CLOCK_50;
  s_RSTn<= KEY;
  s_en<='1';
  s_udn<='0';
  
  --***********************************--
    
	 pi<= Q_micro;  --setting interval time 
	 

	--***********************************--   
	  counter1:  counter port map(RSTn => s_RSTn, CLK => s_clk, CLEAR => flag, EN => s_en, UDn => s_udn, VALU => q);
	  
	   
     ucmp1: ucmp port map(CLK => s_clk, RSTn => s_RSTn, input_c => unsigned(q), input_p => pi, output_flag => flag);	  
	  
	  lfsr1: lfsr_part2 port map(clk => s_CLK, rstn => s_RSTn, en => flag, led => s_led);

    LEDR <= s_led;
     
     end topstr;

