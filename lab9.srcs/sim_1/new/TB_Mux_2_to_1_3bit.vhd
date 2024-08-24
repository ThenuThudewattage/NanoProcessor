----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/05/2023 02:43:08 PM
-- Design Name: 
-- Module Name: TB_Mux_2_to_1_3bit - Behavioral
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

entity TB_Mux_2_to_1_3bit is
--  Port ( );
end TB_Mux_2_to_1_3bit;

architecture Behavioral of TB_Mux_2_to_1_3bit is
component Mux_2_to_1_3bit
  Port (   pc_in : in STD_LOGIC_VECTOR (2 downto 0);
           Address_to_jmp : in STD_LOGIC_VECTOR (2 downto 0);
           Jmp_flag : in STD_LOGIC;
           Mux_out : out STD_LOGIC_VECTOR (2 downto 0));
end component;


 signal pc_in : STD_LOGIC_VECTOR (2 downto 0);
 signal Jump_address_in : STD_LOGIC_VECTOR (2 downto 0);
 signal Jump_flag_in : STD_LOGIC;
 signal Mux_out : STD_LOGIC_VECTOR (2 downto 0);
 
begin
UUT: Mux_2_to_1_3bit
 PORT MAP(
         pc_in => pc_in,
         Address_to_jmp => Jump_address_in,
         Jmp_flag => Jump_flag_in,
         Mux_out => Mux_out
 );
 
 process
 begin
        --index no 210652L - 110 011 011 011 011 100
        --index no 210326R - 110 011 010 110 010 110
        pc_in <= "100";
        Jump_address_in <= "110";
        Jump_flag_in <= '0';
        wait for 100 ns;
        
        pc_in <= "011";
        Jump_address_in <= "110";
        Jump_flag_in <= '1';
        wait for 100 ns;
        
        pc_in <= "100";
        Jump_address_in <= "110";
        Jump_flag_in <= '0';
        wait for 100 ns;
        
        pc_in <= "111";
        Jump_address_in <= "010";
        Jump_flag_in <= '1';
        wait for 100 ns;
              
        pc_in <= "101";
        Jump_address_in <= "001";
        Jump_flag_in <= '1';
        wait for 100 ns;
        
        pc_in <= "101";
        Jump_address_in <= "100";
        Jump_flag_in <= '0';
        wait for 100 ns;                  
        
        pc_in <= "010";
        Jump_address_in <= "011";
        Jump_flag_in <= '0';
        wait;
             
 end process;
end Behavioral;
