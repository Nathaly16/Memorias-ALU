
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use ieee.std_logic_unsigned.all;

-- opcode     operación
--  000        Transferencia de A
--  001        Transferencia de B 
--  010        A and B
--  011        A or B
--  100        A + B
--  101        A + 1
--  110        A - 1
--  111        A - B 

entity ALU_4bits is
port
	(
		-- Pines de Entrada
		A,B      : in  std_logic_vector(3 downto 0);
		
		opcode   : in  std_logic_vector(2 downto 0);
		
		-- Pines de Salida
		Cout     : out std_logic;
		Yout	   : out std_logic_vector(3 downto 0)
	);

end ALU_4bits;

architecture arq_ALU4 of ALU_4bits is
	signal Y_tmp: std_logic_vector(4 downto 0) := (others => '0');
	begin
		 -- Para que aparezca el acarreo se debe concatenar un cero a la izquierda
		 -- Operaciones Lógicas
		 with opcode(2 downto 0) select
			Y_tmp <=  ('0' & A) when "000",
						 ('0' & B) when "001",
						 ('0' & A) and ('0' & B) when "010", 
						 ('0' & A) or  ('0' & B) when "011", 
		--Operaciones Aritméticas
						 ('0' & A) + B   when "100",
						 ('0' & A) + '1' when "101",
						 ('0' & A) - '1' when "110", 
						 ('0' & A) - B   when others;
	 
	 Cout <= Y_tmp(4);
	 Yout <= Y_tmp(3 downto 0);

end arq_ALU4;

