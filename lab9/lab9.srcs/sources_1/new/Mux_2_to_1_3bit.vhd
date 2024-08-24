----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 06/01/2023 10:58:59 AM
-- Design Name: 
-- Module Name: Mux_2_to_1_3bit - Behavioral
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

entity Mux_2_to_1_3bit is
    Port (   pc_in : in STD_LOGIC_VECTOR (2 downto 0);
             Address_to_jmp : in STD_LOGIC_VECTOR (2 downto 0);
             Jmp_flag : in STD_LOGIC;
             Mux_out : out STD_LOGIC_VECTOR (2 downto 0));
end Mux_2_to_1_3bit;

architecture Behavioral of Mux_2_to_1_3bit is


begin
    process (Jmp_flag, pc_in, Address_to_jmp)
    begin
        if (Jmp_flag = '1') then
            Mux_out <= Address_to_jmp;
        else
            Mux_out <= pc_in;
        end if;
    end process; 



end Behavioral;
