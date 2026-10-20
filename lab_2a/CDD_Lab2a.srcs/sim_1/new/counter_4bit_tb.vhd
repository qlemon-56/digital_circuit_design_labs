library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

entity counter_4bit_tb is

end counter_4bit_tb;

architecture Behavioral of counter_4bit_tb is
    
    signal counter_out_sync : STD_LOGIC_VECTOR(3 downto 0);
    signal counter_out_async: STD_LOGIC_VECTOR(3 downto 0);
    signal  counter_out_sync_en : STD_LOGIC_VECTOR(3 downto 0);
    signal counter_out_async_en : STD_LOGIC_VECTOR(3 downto 0);
    signal clk, en, rst: STD_LOGIC;
    constant clk_period : time := 10ns;
    
begin
    
    -- UUT instantiation
    UUT: entity work.counter_4bit
        Port Map(
            counter_out_sync => counter_out_sync,
            counter_out_async => counter_out_async,
            counter_out_sync_en => counter_out_sync_en,
            counter_out_async_en => counter_out_async_en,
            clk => clk,
            rst => rst,
            en => en
            );
       
    -- clock process
    clk_process : process
    begin
        clk <= '0';
        wait for clk_period/2;
        clk <= '1';
        wait for clk_period/2;
    end process;
    
    test: process 
    begin
        -- description of test strategy
        
        -- setup begins
        -- global reset
        wait for 100ns;
        
        -- synchronise with clk faling edge
        wait until falling_edge(clk);
        
        -- initialise all inputs to 0
        en <= '0';
        rst <= '0';
        
        wait for clk_period;
        rst <= '0';
        
        wait for clk_period;
        rst <= '1';
        
        wait for clk_period;
        rst <= '0';
        -- setup ends
        
        -- test starts
        
        -- wait for full count
        wait for clk_period*16; -- let the clock increment
        
        en <= '1';
        
        -- set rst high
        rst <= '1';
        wait for clk_period;
        rst <= '0';
        
        wait for clk_period*6;
        rst <= '1';
        wait for clk_period;
        rst <= '0';
        
        wait; -- wait forever
        
    end process;
    
end Behavioral;
