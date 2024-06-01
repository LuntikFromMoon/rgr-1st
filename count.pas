PROGRAM CountWords(INPUT, OUTPUT);
USES 
  TreeSort, ReadWordModule;

VAR
  Str: STRING;
  InputList, OutputList: TEXT;  

BEGIN
  Str := '';
  ASSIGN(InputList, 'InputFile.txt');
  ASSIGN(OutputList, 'OutputFile.txt');
  RESET(InputList);
  REWRITE(OutputList);
  WHILE NOT EOF(InputList)
  DO
    BEGIN
      ReadWord2(InputList, Str);
      IF Str <> ''
      THEN
        MainInsert(Str);
      Str := ''
    END;
  MainPrintTree(OutputList)
END.
