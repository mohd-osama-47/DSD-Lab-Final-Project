library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity array_shift is
	port(
		clk : in std_logic;
		clr : in std_logic;
		x : out std_logic_vector (15 downto 0)
	);

end array_shift;

architecture Behavioral of array_shift is

signal msg : std_logic_vector (39 downto 0);
constant student_id: std_logic_vector(39 downto 0) := X"201610372D";

begin

	process(clr, clk)
	begin
	
		if clr = '1' then 
			msg <= student_id;
		elsif rising_edge(clk) then
			msg(39 downto  4) <= msg(35 downto 0); --msg(31 downto  0) <= msg(35 downto 4)
			msg(3 downto 0) <= msg(39 downto 36); --msg(35 downto 32) <= msg(3 downto 0)
		end if;
	end process;
	
	x <= msg(15 downto 0);
	
end Behavioral;

