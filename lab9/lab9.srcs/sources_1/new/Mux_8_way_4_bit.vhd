----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 11:27:50 AM
-- Design Name: 
-- Module Name: Mux_8_way_4_bit - Behavioral
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

entity Mux_8_way_4_bit is
    Port (   Reg_0 : in STD_LOGIC_VECTOR (3 downto 0);
             Reg_1 : in STD_LOGIC_VECTOR (3 downto 0);
             Reg_2 : in STD_LOGIC_VECTOR (3 downto 0);
             Reg_3 : in STD_LOGIC_VECTOR (3 downto 0);
             Reg_4 : in STD_LOGIC_VECTOR (3 downto 0);
             Reg_5 : in STD_LOGIC_VECTOR (3 downto 0);
             Reg_6 : in STD_LOGIC_VECTOR (3 downto 0);
             Reg_7 : in STD_LOGIC_VECTOR (3 downto 0);
             Reg_select : in STD_LOGIC_VECTOR (2 downto 0);
             Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_8_way_4_bit;
architecture Behavioral of Mux_8_way_4_bit is
begin
 process(Reg_select)
begin 
 
 if ( Reg_select = "000") then 
 Y <= Reg_0;
 elsif ( Reg_select = "001") then 
 Y <= Reg_1;
 elsif ( Reg_select = "010") then
 Y <= Reg_2;
 elsif ( Reg_select = "011") then 
 Y <= Reg_3;
 elsif( Reg_select = "100") then 
 Y <= Reg_4;
 elsif ( Reg_select = "101") then 
 Y <= Reg_5;
 elsif ( Reg_select = "110") then 
 Y <= Reg_6;
 else 
 Y <= Reg_7;
 end if;
 
 end process;
 
end Behavioral;
