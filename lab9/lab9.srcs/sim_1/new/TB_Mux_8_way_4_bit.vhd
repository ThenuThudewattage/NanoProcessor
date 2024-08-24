----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/03/2023 12:34:18 PM
-- Design Name: 
-- Module Name: TB_Mux_8_way_4_bit - Behavioral
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

entity TB_Mux_8_way_4_bit is
--  Port ( );
end TB_Mux_8_way_4_bit;

architecture Behavioral of TB_Mux_8_way_4_bit is
component Mux_8_way_4_bit
Port ( Reg_0 : in STD_LOGIC_VECTOR (3 downto 0);
 Reg_1 : in STD_LOGIC_VECTOR (3 downto 0);
 Reg_2 : in STD_LOGIC_VECTOR (3 downto 0);
 Reg_3 : in STD_LOGIC_VECTOR (3 downto 0);
 Reg_4 : in STD_LOGIC_VECTOR (3 downto 0);
 Reg_5 : in STD_LOGIC_VECTOR (3 downto 0);
 Reg_6 : in STD_LOGIC_VECTOR (3 downto 0);
 Reg_7 : in STD_LOGIC_VECTOR (3 downto 0);
 Reg_select : in STD_LOGIC_VECTOR (2 downto 0);
 Y : out STD_LOGIC_VECTOR (3 downto 0));
 end component;
 
 signal Reg_0 : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_1 : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_2 : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_3 : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_4 : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_5 : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_6 : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_7 : STD_LOGIC_VECTOR (3 downto 0);
 signal Reg_select : STD_LOGIC_VECTOR (2 downto 0);
 signal Y : STD_LOGIC_VECTOR (3 downto 0);
 
begin
UUT: Mux_8_way_4_bit
 PORT MAP(
         Reg_0 => Reg_0,
         Reg_1 => Reg_1,
         Reg_2 => Reg_2,
         Reg_3 => Reg_3,
         Reg_4 => Reg_4,
         Reg_5 => Reg_5,
         Reg_6 => Reg_6,
         Reg_7 => Reg_7,
         Reg_select => Reg_select,
         Y => Y
 );
 
 process
     begin
             Reg_0 <= "0000";
             Reg_1 <= "0001";
             Reg_2 <= "0010";
             Reg_3 <= "0011";
             Reg_4 <= "0100";
             Reg_5 <= "0101";
             Reg_6 <= "0100";
             Reg_7 <= "0111";
             Reg_select <= "011";
     wait;
 
 end process;
end Behavioral;

