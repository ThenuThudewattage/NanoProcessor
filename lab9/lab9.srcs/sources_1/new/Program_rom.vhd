----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:26:35 PM
-- Design Name: 
-- Module Name: Program_rom - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Program_rom is
    Port ( Memory_select : in STD_LOGIC_VECTOR (2 downto 0);
           Ins : out STD_LOGIC_VECTOR (11 downto 0));
end Program_rom;

architecture Behavioral of Program_rom is
type rom is array(0 to 7) of std_logic_vector(0 to 11);
 signal sevenSegment_ROM : rom := (
      "101110000001", --move 1 to R7
      "101100000010", --move 2 to R6
      "001111100000", --add R7, R6 and store in R7
      "110010000100", --if value in R1 = 0 line 4
      "101010000011", --move 3 to R5
      "001111010000", --add R7, R5 and store in R7
      "110010000000", --if value in R1 = 0 line 0
      "000000000000"); --null
 
begin
 Ins <= sevenSegment_ROM(to_integer(unsigned(Memory_select)));

end Behavioral;