library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.STD_LOGIC_UNSIGNED.ALL;

entity Digital_clock is

generic(ClockFreq : integer := 10);
   port (
      Clock: in std_logic;
      reset: in std_logic;
      Seconds: inout integer;
      Minutes: inout integer;
      Hours: inout integer;
      Sec_pin1 :inout signed(3 downto 0):="0000";
      Sec_pin2 :inout signed(3 downto 0):="0000";
      Min_pin1 :inout signed(3 downto 0):="0000";
      Min_pin2 :inout signed(3 downto 0):="0000";
      Hur_pin1 :inout signed(3 downto 0):="0000";
      Hur_pin2 :inout signed(3 downto 0):="0000"
      
      
     
      
      
      
		
   );
end entity Digital_clock;

architecture behavae of Digital_clock is
signal counts: integer:=0;
begin
   process(Clock)
      begin
         if rising_edge(Clock) then
            if reset = '0' then
               counts  <= 0;
               Seconds <= 0;
               Minutes <= 0;
               Hours   <= 0;
             
            else
            
           
         
            counts <= counts + 1;
            
				if counts = ClockFreq -1 then
               counts <= 0;
               if Seconds = 59 then
                  Seconds <= 0;
               if Minutes = 59 then
                  Minutes <= 0;
						
						if Hours = 23 then
                                Hours <= 0;
                            else
                                Hours <= Hours + 1;
                                Hur_pin1 <= Hur_pin1 + 1;
           if Hur_pin1 = "1001" then
          
           Hur_pin2 <= Hur_pin2 + 1;
            Hur_pin1 <= "0000";
            end if; 
                            end if;
		
                  else

                  Minutes <= Minutes + 1; 
                   Min_pin1 <= Min_pin1 + 1;
           if Min_pin1 = "1001" then
          
            Min_pin2 <= Min_pin2 + 1;
            Min_pin1 <= "0000";
            end if; 
               end if ;
               else
               Seconds <= Seconds + 1;
               Sec_pin1 <= Sec_pin1 + 1;
           if Sec_pin1 = "1001" then
          
            Sec_pin2 <= Sec_pin2 + 1;
            Sec_pin1 <= "0000";
            end if; 
            end if ;
            else
            counts <= counts + 1;
            
               
            end if ;
            end if ;
         end if ;
   end process; 
   
   
   
end architecture behavae;