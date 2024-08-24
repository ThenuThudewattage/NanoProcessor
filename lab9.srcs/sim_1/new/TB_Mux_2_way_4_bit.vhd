----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 03:41:48 PM
-- Design Name: 
-- Module Name: TB_Mux_2_way_4_bit - Behavioral
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

entity TB_Mux_2_way_4_bit is
--  Port ( );
end TB_Mux_2_way_4_bit;

architecture Behavioral of TB_Mux_2_way_4_bit is

component Mux_2_way_4bit
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end component;

signal S_value : STD_LOGIC_VECTOR (3 downto 0);
signal I_value : STD_LOGIC_VECTOR (3 downto 0);
signal L_select : STD_LOGIC;
signal S_out : STD_LOGIC_VECTOR (3 downto 0);
 
begin
UUT: Mux_2_way_4bit
 PORT MAP(
 D0 => S_value,
 D1 => I_value,
 S => L_select,
 Y => S_out
 );
 
 process
 begin
        --index no 210652L - 11 0011 0110 1101 1100
        --index no 210326R - 11 0011 0101 1001 0110
        
        S_value <= "1100";
        I_value <= "0110";
        L_select <= '0'; --if L_select is 0 output is immediate value
        wait for 100ns;
        
        S_value <= "1101";
        I_value <= "1001";
        L_select <= '1'; --if L_select is 1 output is add/sub value
        wait for 100ns;
        
        S_value <= "0110";
        I_value <= "0101";
        L_select <= '0'; --if L_select is 0 output is immediate value
        wait for 100ns;
        
        S_value <= "0011";
        I_value <= "0011";
        L_select <= '1'; --if L_select is 1 output is add/sub value
        wait;
 
 end process;
end Behavioral;
