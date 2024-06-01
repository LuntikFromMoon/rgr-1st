UNIT ReadWordModule;

INTERFACE

{FUNCTION ReadWord(VAR InF: TEXT; VAR Word: STRING): STRING;   }
PROCEDURE ReadWord2(VAR InF: TEXT; VAR Word: STRING);

IMPLEMENTATION

PROCEDURE LowerCaseCh(VAR Ch: CHAR);
BEGIN
  CASE Ch OF
    'A' : Ch := 'a';
    'B' : Ch := 'b';
    'C' : Ch := 'c';
    'D' : Ch := 'd';
    'E' : Ch := 'e';
    'F' : Ch := 'f';
    'G' : Ch := 'g';
    'H' : Ch := 'h';
    'I' : Ch := 'i';
    'J' : Ch := 'j';
    'K' : Ch := 'k';
    'L' : Ch := 'l';
    'M' : Ch := 'm';
    'N' : Ch := 'n';
    'O' : Ch := 'o';
    'P' : Ch := 'p';
    'Q' : Ch := 'q';
    'R' : Ch := 'r';
    'S' : Ch := 's';
    'T' : Ch := 't';
    'U' : Ch := 'u';
    'V' : Ch := 'v';
    'W' : Ch := 'w';
    'X' : Ch := 'x';
    'Y' : Ch := 'y';
    'Z' : Ch := 'z';

    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�';
    '�' : Ch := '�'
  END
END;

FUNCTION IsRight(Ch: CHAR): BOOLEAN;
BEGIN
  IF (Ch IN ['�'..'�']) OR (Ch IN ['a'..'z']) OR (Ch = '�') OR (Ch = '-') OR (Ch = '''')
  THEN
    IsRight := True
  ELSE
    IsRight := False
END;

FUNCTION ReadWord(VAR InF: TEXT; VAR Word: STRING): STRING;
VAR
  Ch: CHAR;                           
BEGIN
  READ(InF, Ch);
  LowerCaseCh(Ch);
  IF IsRight(Ch)
  THEN
    BEGIN
      Word := Word + Ch;
      IF EOLN(InF)
      THEN
        BEGIN
          ReadWord := Word; 
          Word := ''
        END
    END
  ELSE
    IF Word <> ''
    THEN
      BEGIN
        ReadWord := Word;
        Word := ''
      END
END;

PROCEDURE ReadWord2(VAR InF: TEXT; VAR Word: STRING);
VAR
  Ch: CHAR;
  WFounD: BOOLEAN;
BEGIN
  WFounD:= FALSE;
  WHILE NOT EOLN(InF) AND (NOT WFounD)
  DO
    BEGIN                  
      READ(InF, Ch);
      LowerCaseCh(Ch);
      IF IsRight(Ch)
      THEN
        IF (Word = '') AND ((Ch = '-') OR (Ch = ''''))
        THEN
          Word := ''
        ELSE
          Word := Word + Ch
      ELSE
        IF Word <> ''
        THEN
          WFound := TRUE
    END;
  IF EOLN(InF) AND (Word <> '')
  THEN
    WFound := TRUE;
  IF NOT WFound AND EOLN(InF)
  THEN
    BEGIN
      READLN(InF);
      IF NOT EOF(InF)
      THEN
        ReadWord2(InF, Word)
    END
END;

BEGIN
END.
