----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:18:00 PM
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
       Instruction_bus : out STD_LOGIC_VECTOR (11 downto 0));
end component;

signal signalMselect : std_logic_vector(2 downto 0);
signal this_Command: std_logic_vector(11 downto 0);

begin
uut :Program_rom
port map(
    Memory_select =>signalMselect,
    Instruction_bus =>this_Command);
    
process begin
    signalMselect <="000";
    wait for 40ns;
    
    signalMselect <="001";
    wait for 40ns;
    
    signalMselect <="010";
    wait for 40ns;
    
    signalMselect <="011";
    wait for 40ns;
    
    signalMselect <="100";
    wait for 40ns;
    
    signalMselect <="101";
    wait for 40ns;
    
    signalMselect <="110";
    wait for 40ns;
    
    signalMselect <="111";
    wait for 40ns;

end process;
end Behavioral;
