PROC START_UNLOAD;
  PRG_START(PRODUCT_UNLOAD.ON_M12);
ENDPROC;

PROC STOP_UNLOAD;
  PRG_STOP(PRODUCT_UNLOAD.START_UNLOAD);
  PRG_START(PRODUCT_UNLOAD.OFF_M12);
ENDPROC;

PROC ON_M12;
  ON(M12);
  PRG_STOP(PRODUCT_UNLOAD.CHECK_M12);
  PRG_START(PRODUCT_UNLOAD.CHECK_M12);
  WAIT(,TIMER_UNLOADER, TIME_3M);
  OFF(M12);
  PRG_STOP(PRODUCT_UNLOAD.CHECK_M12);
  PRG_START(PRODUCT_UNLOAD.CHECK_M12);
  WAIT(,TIMER_UNLOADER, TIME_3M);
  LOOP;
ENDPROC;

PROC CHECK_M12;
  WAIT(,TIMER_UNLOADER_CHECK, TIME_3S);
  WAIT(M12&!M12_RUN);
  MSG
  PRG_START(PRODUCT_UNLOAD.OFF_M12);
ENDPROC;

PROC OFF_M12;
  PRG_STOP(PRODUCT_UNLOAD.CHECK_M12);
  PRG_STOP(PRODUCT_UNLOAD.ON_M12);
  OFF(M12);
ENDPROC;