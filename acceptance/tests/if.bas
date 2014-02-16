5 REM IF...THEN line_number; true
10 IF 0 THEN 40
20 PRINT "ok"
30 GOTO 45
40 PRINT "fail"
45 REM IF...THEN line_number; false
50 IF -1 THEN 80
60 PRINT "fail"
70 GOTO 90
80 PRINT "ok"
90 REM IF...THEN statements; true
110 IF -1 THEN PRINT "ok" : PRINT "ok"
105 REM IF...THEN statements; false
120 IF 0 THEN PRINT "fail" : PRINT "fail"
128 REM IF...GOTO
130 IF -1 GOTO 160
140 PRINT "fail"
150 GOTO 170
160 PRINT "ok"
170 REM
