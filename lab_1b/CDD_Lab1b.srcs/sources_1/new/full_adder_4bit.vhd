library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_4bit is
    Port ( First_Addend : in STD_LOGIC_VECTOR (3 downto 0);
           Second_Addend : in STD_LOGIC_VECTOR (3 downto 0);
           carry_in : in STD_LOGIC;
           Sum : out STD_LOGIC_VECTOR (3 downto 0);
           carry_out : out STD_LOGIC);
end full_adder_4bit;

architecture Behavioral of full_adder_4bit is

    -- Internal signals are defined here
    signal carry_lines: STD_LOGIC_VECTOR(2 downto 0);
    
    begin
    bit0 : entity work.full_adder_1bit
    port map(
        addend0 => First_Addend(0),
        addend1 => Second_Addend(0),
        carry_in => carry_in,
        sum => Sum(0),
        carry_out => carry_lines(0)
    );
    
    bit1: entity work.full_Adder_1bit
    port map(
        addend0 => First_Addend(1),
        addend1 => Second_Addend(1),
        carry_in => carry_lines(0),
        sum => Sum(1),
        carry_out => carry_lines(1)
    );
    
    bit2: entity work.full_Adder_1bit
    port map(
        addend0 => First_Addend(2),
        addend1 => Second_Addend(2),
        carry_in => carry_lines(1),
        sum => Sum(2),
        carry_out => carry_lines(2)
    );
    
    bit3: entity work.full_Adder_1bit
    port map(
        addend0 => First_Addend(3),
        addend1 => Second_Addend(3),
        carry_in => carry_lines(2),
        sum => Sum(3),
        carry_out => carry_out
    );
     
end Behavioral;
