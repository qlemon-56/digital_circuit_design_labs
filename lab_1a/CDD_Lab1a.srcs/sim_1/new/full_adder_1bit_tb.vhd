library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_1bit_tb is

end full_adder_1bit_tb;

architecture Behavioral of full_adder_1bit_tb is
    
    signal addend0, addend1: STD_LOGIC;
    signal carry_in: STD_LOGIC;
    signal sum: STD_logic;
    signal carry_out: STD_LOGIC;
    
begin
    UUT: entity work.full_adder_1bit
        PORT MAP (
            addend0 => addend0,
            addend1 => addend1,
            carry_in => carry_in,
            sum => sum,
            carry_out => carry_out);

    TEST: process
    begin
        -- wait for 100 ns for global reset to finish 
        wait for 100 ns;
        
        addend0 <= '0';
        addend1 <= '0';
        carry_in <= '0';
        wait for 10 ns;
        
        addend0 <= '0';
        addend1 <= '0';
        carry_in <= '1';
        wait for 10 ns;
        
        -- all other input permutations should follow
        
        addend0 <= '0';
        addend1 <= '1';
        carry_in <= '0';
        wait for 10 ns;
        
        addend0 <= '0';
        addend1 <= '1';
        carry_in <= '1';
        wait for 10 ns;
        
        addend0 <= '1';
        addend1 <= '0';
        carry_in <= '0';
        wait for 10 ns;
        
        addend0 <= '1';
        addend1 <= '0';
        carry_in <= '1';
        wait for 10 ns;
        
        addend0 <= '1';
        addend1 <= '1';
        carry_in <= '0';
        wait for 10 ns;
        
        addend0 <= '1';
        addend1 <= '1';
        carry_in <= '1';
        wait for 10 ns;
        
        wait; -- will wiat forever
        
    end process;
end Behavioral;
