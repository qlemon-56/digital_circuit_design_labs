library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity counter_4bit is
    Port ( clk : in STD_LOGIC;
           en : in STD_LOGIC;
           rst : in STD_LOGIC;
           counter_out_sync : out STD_LOGIC_VECTOR(3 downto 0);
           counter_out_async: out STD_LOGIC_VECTOR(3 downto 0);
           counter_out_sync_en : out STD_LOGIC_VECTOR(3 downto 0);
           counter_out_async_en : out STD_LOGIC_VECTOR(3 downto 0)
         );
end counter_4bit;

architecture Behavioral of counter_4bit is
    
    -- signal declarations for internal counter signals
    signal counter_sync_internal: UNSIGNED(3 downto 0);
    signal counter_async_internal: UNSIGNED(3 downto 0);
    signal counter_sync_en_internal: UNSIGNED(3 downto 0);
    signal counter_async_en_internal: UNSIGNED(3 downto 0);
        
    
begin
    
    -- synchronous reset and no enable
    syncRST_noEN_counter_4bit: process (clk, rst) 
    begin
        -- synchronous reset construct
        if (rising_edge(clk)) then
            if (rst = '1') then 
                counter_sync_internal <= (others => '0');
             else 
                counter_sync_internal <= counter_sync_internal+1;
             end if;
        end if;    
    end process syncRST_noEN_counter_4bit;
    
    -- asynchronous reset and no enable
    asyncRST_noEN_counter_4bit: process (clk, rst) 
    begin
        -- asynchronous reset construct
        if (rst='1') then
            counter_async_internal <= (others => '0');
        else
            if (rising_edge(clk)) then
                counter_async_internal <= counter_async_internal+1;
             end if;
        end if;

    end process asyncRST_noEN_counter_4bit;
    
    -- synchronous reset and enable
    syncRST_EN_counter_4bit: process (clk, rst) 
    begin
        -- synchronous reset construct
        if (rising_edge(clk)) then
            if (rst = '1') then
                counter_sync_en_internal <= (others => '0');
             else
                -- enable must always be synchronous
                if (en = '1') then
                    counter_sync_en_internal <= counter_sync_en_internal+1;
                end if;
             end if;
        end if;

    end process syncRST_EN_counter_4bit;
    
    
    -- asynchronous reset and enable
    asyncRST_EN_counter_4bit: process (clk, rst) 
    begin
        -- asynchronous reset construct
        if (rst = '1') then
            counter_async_en_internal <= (others => '0');
        else
            -- enable must always be synchronous
            if (rising_edge(clk)) then
                if (en = '1') then
                    counter_async_en_internal <= counter_async_en_internal+1;
                end if;
            end if;
        end if;
    end process asyncRST_EN_counter_4bit;

    counter_out_sync <= STD_LOGIC_VECTOR(counter_sync_internal);
    counter_out_async <= STD_LOGIC_VECTOR(counter_async_internal);
    counter_out_sync_en <= STD_LOGIC_VECTOR(counter_sync_en_internal);
    counter_out_async_en <= STD_LOGIC_VECTOR(counter_async_en_internal);

end Behavioral;
