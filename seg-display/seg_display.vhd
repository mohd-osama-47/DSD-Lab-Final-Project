library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

entity seg_display is 
port(
    clock, reset : in std_logic;
	 dp : out std_logic;
	 I : out std_logic_vector ( 6 downto 0 );
	 an: out std_logic_vector ( 3 downto 0)

);
end seg_display;

architecture behv of seg_display is 

component clkdiv is 
port (
    clock_in : in std_logic;
    clock_out : out std_logic
);
end component;


component counter is 
port (
    clock, reset: in std_logic;
    q : out std_logic_vector (1 downto 0)
);
end component;

signal wire : std_logic;
signal switching_order : std_logic_vector (1 downto 0);

signal msg: std_logic_vector (27 downto 0);

begin
	 dp <= '1';
	 
	 msg <= "0010010000000110011110100000"; --0372

     u0 : clkdiv port map (clock, wire);
	 u1 : counter  port map ( wire, reset, switching_order);
	 
	 process(switching_order)
	 begin
		
		if switching_order = "00" then
			an <= "0111";
			I <= msg (27 downto 21);
		elsif switching_order = "01" then
			an <= "1011";
			I <= msg (20 downto 15);
		elsif switching_order = "10" then
			an <= "1101";
			I <= msg (14 downto 8);
		elsif switching_order = "11" then
			an <= "1110";
			I <= msg (7 downto 0);
		else
			an <= "1111";
		end if;
	
	end process;

end behv;