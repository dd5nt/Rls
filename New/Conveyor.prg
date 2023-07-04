PROC START_CONVEYOR;
  MSG(3101);
  PRG_STOP(CONVEYOR.STOP_CONVEYOR);
  IF( SL13 ) MSG(2101); END;
  IF( ! SL13 ) MSG(1101); END;
  WAIT( ! SL11 && ! SL12);
  PRG_STOP(CONVEYOR.OFF_CONVEYOR);
  PRG_START(CONVEYOR.ON_CONVEYOR);
  WAIT(SL12);
  PRG_STOP(CONVEYOR.ON_CONVEYOR);
  PRG_START(CONVEYOR.OFF_CONVEYOR);
  LOOP;
ENDPROC

PROC STOP_CONVEYOR;
  MSG(3102);
  PRG_STOP(CONVEYOR.START_CONVEYOR);
  PRG_STOP(CONVEYOR.ON_CONVEYOR);
  PRG_START(CONVEYOR.OFF_CONVEYOR);
ENDPROC

PROC ON_CONVEYOR;
  PRG_STOP(CONVEYOR.OFF_CONVEYOR);
  MSG(3107);
  ON(M22);
  MSG(3109);
  ON(M24);
  WAIT(,TIMER_CONVEYOR,TIME_2S);
  MSG(3105);
  ON(M25);
  MSG(3103);
  ON(M11);
  WAIT(,TIMER_CONVEYOR,TIME_5M);
  PRG_START(CONVEYOR.OFF_CONVEYOR);
  WAIT(,TIMER_CONVEYOR,TIME_1M);
  LOOP;  
ENDPROC;

PROC OFF_CONVEYOR;
  MSG(3108);
  OFF(M22);
  MSG(3110);
  OFF(M24);
  WAIT(,TIMER_CONVEYOR,TIME_2S);
  MSG(3106);
  OFF(M25);
  MSG(3104);
  OFF(M11);
ENDPROC;