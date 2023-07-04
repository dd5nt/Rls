PROC START_UNLOAD;
  IF( ! SL31 && ! SL32)
    PRG_START(PRODUCT_UNLOAD.ON_M12);
    WHITE( SL32);
    PRG_START(PRODUCT_UNLOAD.OFF_M12);
  END;
  WHITE(! SL31 && ! SL32);
  LOOP;
ENDPROC;

PROC STOP_UNLOAD;
  PRG_STOP(PRODUCT_UNLOAD.START_UNLOAD);
  PRG_START(PRODUCT_UNLOAD.OFF_M12);
ENDPROC;

PROC ON_M12;
    ON( M12);
ENDPROC;

PROC OFF_M12;
    OFF( M12);
ENDPROC;
