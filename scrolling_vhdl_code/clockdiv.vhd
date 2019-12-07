library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_unsigned.ALL;

entity clockdiv is
	port(
		clkin : in std_logic;
		clkout : out std_logic_vector(1 downto 0)
	);
end clockdiv;

architecture Behavioral of clockdiv is

signal sig_clkdiv: std_logic_vector(23 downto 0);

begin

	process(clkin)
	begin
		if rising_edge(clkin) then
			sig_clkdiv <= sig_clkdiv + 1;
		end if;
	end process;
	
	clkout(1) <= sig_clkdiv(17);
	clkout(0) <= sig_clkdiv(23);

end Behavioral;

