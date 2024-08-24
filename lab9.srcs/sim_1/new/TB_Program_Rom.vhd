----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:41:36 PM
-- Design Name: 
-- Module Name: TB_Program_Rom - Behavioral
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

entity TB_Program_Rom is
--  Port ( );
end TB_Program_Rom;

architecture Behavioral of TB_Program_Rom is
component Program_rom
Port ( Memory_select : in STD_LOGIC_VECTOR (2 downto 0);
       Ins : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal Memory_select : std_logic_vector(2 downto 0);
signal Ins: std_logic_vector(11 downto 0);

begin
uut :Program_rom
port map(
    Memory_select =>Memory_select,
    Ins =>Ins);
    
process begin
    Memory_select <="000";
    wait for 50ns;
    
    Memory_select <="001";
    wait for 50ns;
    
    Memory_select <="010";
    wait for 50ns;
    
    Memory_select <="011";
    wait for 50ns;
    
    Memory_select <="100";
    wait for 50ns;
    
    Memory_select <="101";
    wait for 50ns;
    
    Memory_select <="110";
    wait for 50ns;
    
    Memory_select <="111";
    wait for 50ns;

end process;
end Behavioral;
