PROC START_LOV;
  PRG_STOP(LOV.STOP_LOV);
  PRG_START(LOV.ON_M54_M55);
  PRG_START(LOV.ON_M61);
  PRG_START(LOV.ON_M52);
ENDPROC

PROC STOP_LOV;
  MSG(3502);
  PRG_STOP(LOV.START_LOV);
  PRG_START(LOV.OFF_M54_M55);
  PRG_START(LOV.OFF_M61);
  PRG_START(LOV.OFF_M52);
ENDPROC

PROC ON_M54_M55;
  PRG_STOP(LOV.OFF_M54_M55);
  OFF(M55);
  IF( MEM_ON_M54_M55) 
    ON(M54);
    WAIT(,TIMER_M54_M55,TIME_1H);
  END;
  OFF(M54);
  ON(M55);
  OFF(MEM_ON_M54_M55);
  WAIT(,TIMER_M54_M55,TIME_1H);
  ON(MEM_ON_M54_M55);
  LOOP;  
ENDPROC

PROC OFF_M54_M55;
  PRG_STOP(LOV.CHECK_M54_M55);
  PRG_STOP(LOV.ON_M54_M55);
  OFF(M54);
  OFF(M55);
ENDPROC

PROC CHECK_M54_M55;
  WAIT(,TIMER_M54_M55_CHECK,TIME_5S);
  WAIT(M54|M55&BV52<20);
  PRG_STOP(LOV.ON_M54_M55);
  MSG('0000','Too low level on pump M54 or M55');
  SET(ALERT_BEEP_COUNT,3);
  PRG_START(ALERT.BEEP);
  ON(M54);
  ON(M55);
  WAIT(BV52>20);
  PRG_START(LOV.ON_M54_M55);
  MSG('0000','Normal level on pump M54 or M55');
ENDPROC

PROC ON_M61;
  MSG(3505);
  ON(M61);
ENDPROC

PROC OFF_M61;
  MSG(3506);
  OFF(M61);
ENDPROC

PROC ON_M52;
  MSG(3507);
  ON(M52);
ENDPROC

PROC OFF_M52;
  MSG(3508);
  OFF(M52);
ENDPROC

PROC ON_M51;
  PRG_STOP(LOV.OFF_M51);
  ON(M51);
  WAIT(,TIMER_M51,TIME_10M);
  PRG_START(LOV.OFF_M51);
ENDPROC

PROC OFF_M51;
  PRG_STOP(LOV.ON_M51);
  OFF(M51);
ENDPROC
