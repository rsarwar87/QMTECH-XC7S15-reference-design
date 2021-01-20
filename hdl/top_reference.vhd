----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 20.01.2021 21:49:03
-- Design Name: 
-- Module Name: top_reference - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity top_reference is
    Port ( 
        sys_clk_50 : in STD_LOGIC;
        sys_rst_n  : in STD_LOGIC;
        
        led : out STD_LOGIC_VECTOR(1 downto 0);
        key : in STD_LOGIC_VECTOR(0 downto 0);
        
        gpio0 : out STD_LOGIC_VECTOR(43 downto 0);
        gpio1 : out STD_LOGIC_VECTOR(43 downto 0)
    
    );
end top_reference;

architecture Behavioral of top_reference is
    signal counter : std_logic_vector (31 downto 0) := (others => '0');
begin
    process (sys_clk_50, sys_rst_n)
    begin
        if (sys_rst_n = '0') then
            counter <= (others => '0');
        elsif (rising_edge(sys_clk_50)) then
            counter <= counter + '1';
            led(0) <= counter(15);
            led(1) <= counter(25);
        end if;
    end process;

end Behavioral;
