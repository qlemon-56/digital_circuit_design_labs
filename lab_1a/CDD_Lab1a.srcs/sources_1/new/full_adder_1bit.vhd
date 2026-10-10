library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_1bit is
    Port ( addend0 : in STD_LOGIC;
           addend1 : in STD_LOGIC;
           carry_in : in STD_LOGIC;
           sum : out STD_LOGIC;
           carry_out : out STD_LOGIC);
end full_adder_1bit;

architecture Behavioral of full_adder_1bit is

signal prop, gen, c_prop: STD_LOGIC;

begin

    gen <= addend0 and addend1;
    prop <= addend0 xor addend1;
    c_prop <= prop and carry_in;
    
    carry_out <= c_prop or gen;
    sum <= prop xor carry_in;
    
end Behavioral;
