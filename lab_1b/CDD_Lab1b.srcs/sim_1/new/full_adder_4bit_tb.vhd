library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity full_adder_4bit_tb is
    
    -- no need for port declarations in testbench
    
end full_adder_4bit_tb;

architecture Behavioral of full_adder_4bit_tb is

    -- need to declare signals in testbench
    signal First_Addend : STD_LOGIC_VECTOR (3 downto 0);
    signal Second_Addend : STD_LOGIC_VECTOR (3 downto 0);
    signal carry_in : STD_LOGIC;
    signal Sum : STD_LOGIC_VECTOR (3 downto 0);
    signal carry_out : STD_LOGIC;
    
begin
    -- always need to create the UUT so you can alter the inputs
 
    UUT : entity work.full_adder_4bit 
    PORT MAP (
        
        First_Addend => First_Addend,
        Second_Addend => Second_Addend,
        carry_in => carry_in,
        Sum => Sum,
        carry_out => carry_out
    );
    
    -- this is where the test strategy goes
    
    -- test strategy evaluates if the 4bit full adder works as intended and specifically examines the proper usage of
    -- the First_Addend, Second_Addend, and carry_lines inputs
    -- conducts arithmetic operations with full adder also making sure to examine cases of bit overflow and how the Sum and carry_out 
    -- behave in response to this
    
    TEST: process
    begin
        
        -- initial wait for 100ns to let global reset finish
        wait for 100 ns;
        
        -- Sets all inputs to 0;
        First_Addend <= "0000";
        Second_Addend <= "0000";
        carry_in <= '0';
        
        wait for 10 ns;
        
        -- try 0 + 0 + 1;
        First_Addend <= "0000";
        Second_Addend <= "0000";
        carry_in <= '1';
        
        wait for 10 ns;
        
        -- try 6+4;
        First_Addend <= "0100";
        Second_Addend <= "0110";
        carry_in <= '0';
        
        wait for 10 ns;
        
        -- try 2+2;
        First_Addend <= "0010";
        Second_Addend <= "0010";
        carry_in <= '0';
        
        wait for 10ns;
        
        -- try 7+9
        First_Addend <= "0111";
        Second_Addend <= "1001";
        carry_in <= '0';
        
        wait for 10 ns;
        
        -- try 7 + 9 + 1
        First_Addend <= "0111";
        Second_Addend <= "1001";
        carry_in <= '1';
        
        -- try 15 + 15 + 1
        First_Addend <= "1111";
        Second_Addend <= "1111";
        carry_in <= '1';
        
        -- waits forever
        wait;
        
    end process;
    

end Behavioral;
