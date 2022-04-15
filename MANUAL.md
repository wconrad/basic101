# BASIC101 language manual

basic101 is a circa 1980 BASIC interpreter written in Ruby.  It
supports a modified subset of Microsoft's BASIC-80 v. 5 and runs the
games published in Basic Computer Games, Microcomputer Edition by
David H. Ahl.  It also contains a few other features not needed to run
those games.

# Limitations

Program size - Unlimited
Integer range - Unlimited
Float range - IEEE 64-bit float
            - About 15 decimal digits
            - Exponent range about -308 to 308
Line numbers - Unlimited
Identifier length - Unlimited
Array dimension - Unlimited
Array indices - Unlimited

# Statements

## GOTO statement

    GOTO line-number

Example:

    100 GOTO 120

Transfer control to the indicated line number.

## REM (Remark) statement

    REM stuff that gets ignored

Everything after REM up to the end of the line is ignored.

Examples:

    10 REM
    20 REM A comment on its own
    30 A=A+1 : REM A comment at the end of a line

## PRINT stattement

    PRINT expression [(;|,) expression]+

Prints the result of the expressions.  When separated with a
semicolon, no spaces are added between expressions.  A comma separator
is the equivalent of printing a tab.  Tabs are 14 columns apart.

Examples:

    10 PRINT 1, 2, 3
    20 PRINT 100; "%"

## IF statement

    IF expression [THEN] (line_number | statements) [ELSE (line_number | statements)]

If the result of the expression is truthy (not zero), then the "THEN"
part is executed.  The "ELSE" part, if present, ie executed if the
"THEN" part is not executed.

Examples:

    10 IF A THEN 1080
    20 IF B 1100
    30 IF C PRINT "C" : PRINT
    40 IF D PRINT "D" ELSE PRINT "NOT D"
    50 IF E PRINT "E" ELSE 1000

## RANDOMIZE statement

    RANDOMIZE

Randomizes the random number generator.

Example:

    10 RANDOMIZE

## INPUT statement

    INPUT [prompt (;|,)] reference+

Read variables from the console.  If a prompt is present, it is
printed first.  If the prompt is delimited with a ";", then "? " is
printed at the end of the prompt.  If the prompt is delimited with
",", then nothing is printed at the end of the prompt.

Examples:

    10 INPUT "Your name"; N$
    20 INPUT "Your name: "; N$
    30 INPUT "Width, height", W, H

## END statement

    END

Ends the program.  In this interpreter, is it a no-op that does
nothing.  The program may continue after the END statement.

## DIM statement

    DIM array_reference+

Sets the dimensions of an array.

Note: An array may be used without setting its dimensions, in which
case each of its dimensions has size 10.

Examples:

   10 DIM A$(10)
   20 DIM B(4, 4), C(2, 2, 2)

## FOR statement

    FOR reference = expression TO expression [STEP expression]

When coupled with the NEXT statement, performs iteration over a range.
The loop will always be executed at least once.

Examples:

    10 FOR I = 1, 10
    20 PRINT I
    30 NEXT I

    10 FOR I=10 TO 1 STEP -1
    20 FOR J=1 TO 3 STEP 2
    30 PRINT I, J
    40 NEXT J, I

## NEXT statement

    NEXT reference*

When coupled with the FOR statement, performs iteration over a range.

Examples:

    10 FOR I=1 TO 10
    20 NEXT

    10 FOR I=1 TO 10
    20 NEXT I

    10 FOR I=1 TO 10
    20 FOR J=1 TO 10
    20 NEXT J, I

## ON GOTO statement

    ON expression GOTO line_number+

If the expression's result is 1, then goto the first line number.  If
the result is 2, then goto the second line number.  And so on.

If the result of the expression is less than 1 or greater than the
number of line numbers, do nothing.

Examples:

    10 ON I GOTO 100, 200

## DATA statement

    DATA (float | integer | quoted_string | unquoted_string)+

Add to the list of data items that may be read using READ statements,
and seeked to using RESTORE statements.

Examples:

    10 DATA foo, bar, baz
    20 DATA "foo", "bar", "baz"
    30 DATA 1, 2.3, "FRED"

## READ statement

    READ reference [, reference]+

Read one or more variables from DATA statements.  The internal data
pointer is advanced after every read.

An error results if there are no more data items to read.

See also: DATA, RESTORE

Example:

    10 DATA 1, 2, 3
    20 FOR I=1 TO 3
    30 READ A(I)
    40 NEXT I

## GOSUB statement

    GOSUB line_number

Call a subroutine, then resume execution here.  GOSUB pushes the
location of the statement after the GOSUB onto the call stack, then
transfer control to the indicated line number.  When the next RETURN
is encoutered, it transfers control back to the statement after the
GOSUB.

Example:

    10 GOSUB 100 : PRINT "After the gosub" : STOP
    100 RETURN

## RETURN statement

    RETURN

Return from a subroutine.  See GOSUB.

## STOP statement

    STOP

Stop execution of the program.

Examples:

    10 STOP

## RESTORE statement

    RESTORE [line_number]

If a line number is present, set the internal data pointer to that
line.  Otherwise, set the internal data pointer to the first DATA
statement in the program.

Examples:

    10 DATA 1
    20 DATA 2
    30 RESTORE 20
    40 READ A : REM reads 2
    50 RESTORE
    60 READ B : REM reads 1

# DEF (Define Function) statement

    DEF function_identifier (reference*) = expression

Define a user-defined function that can then be used in expressions.
The function identifier must being with "FN".  The function may take
zero or more arguments.

If an argument has the same name as a global variable, the global
variable is preserved when the function is called.

Examples:

    10 DEF FNSQR(X) = X * X
    20 PRINT FNSQR(2)

    10 DEF FNPCT$(S) = STR(X) + "%"
    20 PRINT FNPCT(100)

## LET statement

    [LET] reference = expression

Set the value of a variable.

Examples:

    10 LET A = 1
    20 S$ = "Foo"
    30 T = A * 2 / 3

# Operators

    OPERATOR    PRECEDENCE    TYPES    MEANING
       (...)        1         NS       Force order of evaluation
       ^            2         N        Exponentiation (power)
       - (unary)    3         N        Arithmetic negation
       *            4         N        Multiplication
       /            4         N        Division
       +            5         NS       Addition (numeric) or concatenation (string)
       - (binary)   5         N        Subtraction
       =            6         NS       Equal to
       <>           6         NS       Unequal to
       >=           6         NS       Greater than or equal to
       <=           6         NS       Less than or equal to
       <            6         NS       Less than
       >            6         NS       Greater than
       not          7         N        Bitwise not
       and          8         N        Bitwise and
       or           9         N        Bitwise or

Types:

* N - Numeric
* S = String

Operators with the same precedence are evaluated from left to right.

# Built-In Functions

## String functions

    Numeric    ASC(s) - ASCII value of the first character of s
    String     CHR$(n) - A string with a single ASCII character n
    String     LCASE$(s) - Convert string to lowercase
    String     LEFT(s,count) - Leftmost count characters of s
    Numeric    LEN(s) - Length of string s
    String     MID$(s,start,count) - Substring of s
    String     RIGHT$(s,count) - Rightmost count characters of s
    String     STR$(n) - Convert n to a string
    Special    TAB(n) - When printing, advance to column n
    String     UCASE$(n) - Convert string to uppercase
    Numeric    VAL(s) - Return numeric value of string

## Math functions

    Numeric    ABS(n) - Absolue value of n
    Numeric    COS(n) - Cosin of n
    Numeric    EXP(n) - e to the power of n
    Numeric    INT(n) - Round towards negative infinity
    Numeric    LOG(n) - Natural log of n
    Numeric    RND() - Return the previous random number
    Numeric    RND(n) - Return a new random number between 0 and 1
    Numeric    SGN(n) - Sign of n (-1, 0, +1)
    Numeric    SIN(n) - Sin of n
    Numeric    SQR(n) - n times n
    Numeric    TAN(n) - Tangent of n
