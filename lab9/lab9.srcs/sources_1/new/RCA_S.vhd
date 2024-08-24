----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05/31/2023 03:13:10 PM
-- Design Name: 
-- Module Name: RCA_S - Behavioral
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

entity RCA_S is
    Port ( A : in STD_LOGIC_VECTOR (3 downto 0);
           B : in STD_LOGIC_VECTOR (3 downto 0);
           Option : in STD_LOGIC;
           S_out : out STD_LOGIC_VECTOR (3 downto 0);
           Carry : out STD_LOGIC;
           Zero : out STD_LOGIC);
end RCA_S;

architecture Behavioral of RCA_S is
component FA
port( 
          A : in STD_LOGIC;
          B : in STD_LOGIC;
          C_in : in STD_LOGIC;
          S : out STD_LOGIC;
          C_out : out STD_LOGIC);
end component;

SIGNAL S0,S1,S2,S3,C0,C1,C2,C3,I0,I1,I2,I3 :STD_LOGIC;   

begin
 I0 <= option xor B(0);
 I1 <= option xor B(1);
 I2 <= option xor B(2);
 I3 <= option xor B(3);
 
FA_0 :FA
port map(
A=>A(0),
B=>I0,
C_in=>option,
S=>S0,
C_out=>C0
);

FA_1 :FA
port map(
A=>A(1),
B=>I1,
C_in=>C0,
S=>S1,
C_out=>C1
);

FA_2 :FA
port map(
A=>A(2),
B=>I2,
C_in=>C1,
S=>S2,
C_out=>C2
);

FA_3 :FA
port map(
A=>A(3),
B=>I3,
C_in=>C2,
S=>S3,
C_out=>C3
);

Zero <=not(S0 or S1 or S2 or S3 );
Carry <= C3;
S_out(0)<= S0;
S_out(1)<= S1;
S_out(2)<= S2;
S_out(3)<= S3;

end behavioral;
































































































































































































































































































 










