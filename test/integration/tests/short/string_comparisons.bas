10 PRINT "<", "<=", "=", ">=", ">", "<>"
20 A = "A" : B = "B" : GOSUB 100
30 A = "B" : B = "B" : GOSUB 100
40 A = "C" : B = "B" : GOSUB 100
90 END
100 PRINT A < B, A <= B, A = B, A >= B, A > B, A <> B
110 RETURN
