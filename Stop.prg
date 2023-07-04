
PROC ALL_STOP;
  RESET_ALL_PRG(STOP.GOTO_INIT);
ENDPROC;

PROC GOTO_INIT;
  RESET_ALL_PRG(STOP.GOTO_INIT);
ENDPROC;

PROC OFF_ALL;
  OFF(M22);
  OFF(M24);
  OFF(M25);
  OFF(M11);
  OFF(M51);
  OFF(M54);
  OFF(M55);
  OFF(M52);
  OFF(M61);
  OFF(M12);

  OFF(YA43);
  OFF(YA11);
  OFF(YA51);
  OFF(YA52);
  OFF(YA53);
  OFF(YA61);
  OFF(YA41);
  OFF(YA42);
ENDPROC;