library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.STD_LOGIC_UNSIGNED.ALL;
entity Main_model is
 port(
      
      data_outpinssec1:out signed(6 downto 0);
      data_outpinssec2:out signed(6 downto 0);
      
      data_outpinsmin1:out signed(6 downto 0);
      data_outpinsmin2:out signed(6 downto 0);
      
      data_outpinshur1:out signed(6 downto 0);
      data_outpinshur2:out signed(6 downto 0)
      );
end Main_model;

architecture sim of Main_model is
 

   constant ClockFrequencyHz : integer := 100; -- 10 Hz
   constant ClockPeriod      : time := 1000 ms / ClockFrequencyHz;

   signal Clock     : std_logic := '1';
   signal reset     : std_logic := '0';
   signal Seconds : integer;
   signal Minutes : integer;
   signal Hours   : integer;
   signal Sec_pin1 : signed(3 downto 0):="0000";
   signal Sec_pin2 : signed(3 downto 0):="0000";
   signal Min_pin1 : signed(3 downto 0):="0000";
   signal Min_pin2 : signed(3 downto 0):="0000";
   signal Hur_pin1 : signed(3 downto 0):="0000";
   signal Hur_pin2 : signed(3 downto 0):="0000";
   
   

begin
  
   
   timer_module_get:entity work.Digital_clock(behavae)
   generic map(ClockFreq => ClockFrequencyHz)
   port map(
      Clock => Clock,
      reset => reset,
      Seconds => Seconds,
      Minutes => Minutes,
      Hours => Hours,
      Sec_pin1 => Sec_pin1,
      Sec_pin2 => Sec_pin2,
      Min_pin1 => Min_pin1,
      Min_pin2 => Min_pin2,
      Hur_pin1 => Hur_pin2
      
     
   );
   BCDSEGMODULE_0:entity work.BCDTOSEGM(working)port map(Sec_pin1,data_outpinssec1);
   BCDSEGMODULE_1:entity work.BCDTOSEGM(working)port map(Sec_pin2,data_outpinssec2);
   BCDSEGMODULE_2:entity work.BCDTOSEGM(working)port map(Min_pin1,data_outpinsmin1);
   BCDSEGMODULE_3:entity work.BCDTOSEGM(working)port map(Min_pin2,data_outpinsmin2);
   BCDSEGMODULE_4:entity work.BCDTOSEGM(working)port map(Hur_pin1,data_outpinshur1);
   BCDSEGMODULE_5:entity work.BCDTOSEGM(working)port map(Hur_pin2,data_outpinshur2);
    Clock <= not Clock after ClockPeriod / 2;
	
   process is
      begin
          wait until rising_edge(Clock);
          wait until rising_edge(Clock);
          reset <= '1';
          wait;
        
      end process;
      
      
   
   
    
  end architecture;
  
  
  
  