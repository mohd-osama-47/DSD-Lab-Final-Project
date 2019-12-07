library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity mux41 is
	port (
		a,b,c,d : in std_logic_vector (3 downto 0);
		s : in std_logic_vector (1 downto 0);
		output : out std_logic_vector (3 downto 0)
	);
end mux41;

architecture Behavioral of mux41 is

begin

	output <= a when S = "00" else
				 b when S = "01" else
				 c when S = "10" else
				 d when S = "11" else
				 "ZZZZ";

end Behavioral;

