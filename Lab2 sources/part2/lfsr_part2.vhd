LIBRARY IEEE;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
entity lfsr_part2 is 
port (
  clk           : in  std_logic;
  rstn          : in  std_logic;
  en            : in  std_logic;
  led          : out std_logic_vector (9 downto 0));
end lfsr_part2;

architecture behav of lfsr_part2 is  
signal r_lfsr           : UNSIGNED (9 downto 0);
begin  
	 process (clk,rstn) 
	 begin 
 
        if (rstn = '0') then 
            r_lfsr   <= "1111111111";
  
  
        elsif (clk'EVENT AND clk='1') then 
      
         	if (en = '1') then 
               r_lfsr(9) <= r_lfsr(0);
         	   r_lfsr(8) <= r_lfsr(9);
         	   r_lfsr(7) <= r_lfsr(8);
               r_lfsr(6) <= r_lfsr(7) xor r_lfsr(0);
               r_lfsr(5) <= r_lfsr(6);
               r_lfsr(4) <= r_lfsr(5);
               r_lfsr(3) <= r_lfsr(4);
               r_lfsr(2) <= r_lfsr(3);
               r_lfsr(1) <= r_lfsr(2);
         	   r_lfsr(0) <= r_lfsr(1);
               end if; 
        end if; 
    end process; 

led <= std_logic_vector(r_lfsr);

end architecture behav;
