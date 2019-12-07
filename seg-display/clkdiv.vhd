library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
USE ieee.std_logic_unsigned.all ;


entity clkdiv is
    Port ( clock_in : in  STD_LOGIC;
           clock_out : out  STD_LOGIC);
end clkdiv;

architecture Behavioral of clkdiv is

signal sig_clkdiv : std_logic_vector(23 downto 0);
begin
process(clock_in)
begin
if rising_edge(clock_in) then
         sig_clkdiv<= sig_clkdiv + 1;
			end if;
			end process;
			
clock_out<=sig_clkdiv(17);

end Behavioral;