
LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
 
 
ENTITY TB_ALU8bits IS
END TB_ALU8bits;
 
ARCHITECTURE arq_ALU8 OF TB_ALU8bits IS 
 
    -- Component Declaration for the Unit Under Test (UUT)
 
    component ALU_8bits is
  port (
         a_i      : in std_logic_vector(7 downto 0);
         b_i      : in std_logic_vector(7 downto 0);
         opcode_i : in std_logic_vector(1 downto 0);
         d_o      : out std_logic_vector(7 downto 0)
  );
end component;

signal  a_s      : std_logic_vector(7 downto 0);
signal  b_s      : std_logic_vector(7 downto 0);
signal  opcode_s : std_logic_vector(1 downto 0);
signal  d_s      : std_logic_vector(7 downto 0);

begin
  UUT: ALU_8bits port map(a_s, b_s, opcode_s, d_s);
  a_s <= "00010001", "01100101" after 5 ns;
  b_s <= "00100011", "00000010" after 5 ns, "00111001" after 20 ns;
  opcode_s <= "00", "01" after 5 ns;

END;
