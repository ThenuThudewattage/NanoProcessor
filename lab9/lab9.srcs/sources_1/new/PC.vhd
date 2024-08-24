----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 07:39:43 PM
-- Design Name: 
-- Module Name: PC - Behavioral
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
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity PC is
    Port ( Mux_in : in STD_LOGIC_VECTOR (2 downto 0);
           Res : in STD_LOGIC;
           Clk : in STD_LOGIC;
           Memory_select : out STD_LOGIC_VECTOR (2 downto 0));
end PC;

architecture Behavioral of PC is

signal memoryZero: STD_LOGIC_VECTOR (2 downto 0) := "000";
signal memory_selc: STD_LOGIC_VECTOR (2 downto 0);
begin
 process(Clk)
 begin
     if (rising_edge(Clk)) then
             if (Res = '0') then
                     memory_selc(0) <= Mux_in(0);
                     memory_selc(1) <= Mux_in(1);
                     memory_selc(2) <= Mux_in(2);
             else
                     memory_selc <= "000";
             end if;
     end if;
 end process;
 
 Memory_select <= memory_selc;

end Behavioral;
