LIBRARY ieee;
USE ieee.std_logic_1164.ALL;

ENTITY mux42 IS

	PORT (
		SW : IN STD_LOGIC_VECTOR(8 DOWNTO 0);
		LEDR : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
	);

END mux42;

ARCHITECTURE behavior OF mux42 IS
	-- PORT (s: IN  STD_LOGIC; 
	--x: IN  STD_LOGIC;
	--y: IN  STD_LOGIC;
	--m: OUT STD_LOGIC); 

	COMPONENT multiplexer21 IS

		PORT (
			s : IN STD_LOGIC;
			x : IN STD_LOGIC;
			y : IN STD_LOGIC;
			m : OUT STD_LOGIC);

	END COMPONENT;

BEGIN

	mux0 : multiplexer21 --MUX0
	PORT MAP(
		s => SW(8),
		x => SW(0),
		y => SW(4),
		m => LEDR(0)
	);

	mux1 : multiplexer21 --MUX1
	PORT MAP(
		s => SW(8),
		x => SW(1),
		y => SW(5),
		m => LEDR(1)
	);

	mux2 : multiplexer21 --MUX2
	PORT MAP(
		s => SW(8),
		x => SW(2),
		y => SW(6),
		m => LEDR(2)
	);

	mux3 : multiplexer21 --MUX3
	PORT MAP(
		s => SW(8),
		x => SW(3),
		y => Sw(7),
		m => LEDR(3)
	);
END behavior;