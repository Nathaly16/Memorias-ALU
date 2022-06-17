
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity Memoria_ROM is
Port(
		salida : out std_logic_vector(1 downto 0);
		direccion: in std_logic_vector (1 downto 0));
end Memoria_ROM;

architecture arq_ROM of Memoria_ROM is

	type datos is array (0 to 3) of std_logic_vector(1 downto 0);
		constant rom : datos := (
							"11", "10", "00", "01"
							);
		begin
		salida <= rom(to_integer(unsigned(direccion)));


end arq_ROM;

