----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:40:42 AM
-- Design Name: 
-- Module Name: Mux_2_way_4bit - Behavioral
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

entity Mux_2_way_4bit is
    Port ( D0 : in STD_LOGIC_VECTOR (3 downto 0);
           D1 : in STD_LOGIC_VECTOR (3 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC_VECTOR (3 downto 0));
end Mux_2_way_4bit;

architecture Behavioral of Mux_2_way_4bit is

component Mux_2_to_1 is
    Port ( D : in STD_LOGIC_VECTOR (1 downto 0);
           S : in STD_LOGIC;
           Y : out STD_LOGIC);
end component;

begin
    
    Mux_2_to_1_0 : Mux_2_to_1
    port map(
        D(0) => D1(0),
        D(1) => D0(0),
        S => S,
        Y => Y(0));
    
    Mux_2_to_1_1 : Mux_2_to_1
    port map(
        D(0) => D1(1),
        D(1) => D0(1),
        S => S,
        Y => Y(1));
    
    Mux_2_to_1_2 : Mux_2_to_1
    port map(
        D(0) => D1(2),
        D(1) => D0(2),
        S => S,
        Y => Y(2));
            
    Mux_2_to_1_3 : Mux_2_to_1
    port map(
        D(0) => D1(3),
        D(1) => D0(3),
        S => S,
        Y => Y(3));
        
end Behavioral;