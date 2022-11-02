LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

entity counter is

    GENERIC (N : integer := 16);

  port (
    RSTn:  in std_logic;
    CLK:   in std_logic;
	 CLEAR: in std_logic;
    EN:    in std_logic;
    UDn:   in std_logic;
    VALU  : out std_logic_vector(N-1 downto 0)
	 );
  end entity;

architecture beh of counter is
  signal rst: std_logic;
  signal count : unsigned(N-1 downto 0);
 
begin
   rst<= NOT RSTn;
  process(clk, rst)
  begin
    if rst = '1' then
      count <= X"0000";--hex
elsif (CLK'EVENT AND CLK='1') then 
      
		if (CLEAR = '1') then --CLEAR 
        
		  count <= X"0000";--hex 
		 
		else --!clear
		   if (EN = '1') then
		 
	      	 if (UDn='1') then 
				 
				 count <= count - 1;--udn
				 
				 else 
				 
				 count <= count + 1; -- not(udn)
		
         	 end if; --udn
		
	      else --!en  
			
			count <= count;
		   
			end if;	--en 
				 
      end if; --clear
    end if;

  end process;

  VALU <= std_logic_vector(count);

end beh;
 
