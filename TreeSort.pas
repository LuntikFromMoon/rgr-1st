UNIT TreeSort;

INTERFACE
 
PROCEDURE MainInsert(VAR Word: STRING);  {тёђртър}
PROCEDURE MainPrintTree(VAR OutF: TEXT);                 {яхїрђќ}

IMPLEMENTATION 

TYPE 
  Tree = ^NodeType;
  NodeType = RECORD
               Str: STRING;
               Count: INTEGER;
               LLink, RLink: Tree
             END; 

VAR
  Root: Tree;
  Str: STRING;
  
PROCEDURE CompareStr(Str1, Str2: STRING; VAR Result: CHAR);
VAR
  i, MinLen: INTEGER;
BEGIN
  Result := '0';
  MinLen := Length(Str1);
  IF Length(Str2) < MinLen 
  THEN
    MinLen := Length(Str2);
  FOR i := 1 TO MinLen
  DO
    BEGIN
      IF (Str1[i] <> 'И') AND (Str2[i] <> 'И')
      THEN
        BEGIN
          IF (Str1[i] > Str2[i]) AND (Result = '0')
          THEN
            Result := '>';
          IF (Str1[i] < Str2[i]) AND (Result = '0')
          THEN
            Result := '<'
        END
      ELSE
        IF (((Str1[i] = 'И') AND (Str2[i] IN ['ц'..'џ'])) OR ((Str2[i] = 'И') AND (Str1[i] IN ['р'..'х']))) AND (Result = '0')
        THEN
          Result := '<'
        ELSE
          IF (((Str2[i] = 'И') AND (Str1[i] IN ['ц'..'џ'])) OR ((Str1[i] = 'И') AND (Str2[i] IN ['р'..'х']))) AND (Result = '0')
          THEN
            Result := '>'
    END;
  IF Result = '0'
  THEN
    IF (Length(Str1) = Length(Str2))
    THEN
      Result := '='
    ELSE
      IF (length(Str1) < length(Str2))
      THEN
        Result := '<'
      ELSE
        Result := '>'
END;
  
PROCEDURE CompareTree(VAR Ptr: Tree; VAR Data: STRING);
BEGIN{CompareStr}
  {FOR i TO MIN(lenght(Ptr^.Str); lenght(Data))
  DO
    BEGIN
      {IF (Ptr^.Str[i] <> 'И') AND (Data[i] <> 'И')
      IF (Ptr^.Str[i] IN ['р'..'х']) AND (Data[i] IN ['р'..'х'])) OR \
      ((Ptr^.Str[i] IN ['ц'..'џ']) AND (Data[i] IN ['ц'..'џ']))
      THEN
        IF Ptr^.Str > Data
        THEN
          Insert(Ptr^.LLink, Data)
        ELSE
          IF Ptr^.Str < Data
          THEN
            Insert(Ptr^.RLink, Data)
          ELSE
            
        ELSE 
        
    END}
END;{CompareStr} 

PROCEDURE Insert(VAR Ptr: Tree; Data: STRING);
VAR
  CompareResult: CHAR;
BEGIN {Insert}
  IF Ptr = NIL
  THEN
    BEGIN 
      NEW(Ptr);
      Ptr^.Str := Data;
      Ptr^.Count := 1;
      Ptr^.LLink := NIL;
      Ptr^.RLink := NIL
    END
  ELSE
    BEGIN
    {CompareTree(Ptr, Data) }
      CompareStr(Ptr^.Str, Data, CompareResult);
      IF CompareResult = '>'
      THEN
        Insert(Ptr^.LLink, Data)
      ELSE
        IF CompareResult = '<'
        THEN
          Insert(Ptr^.RLink, Data)
        ELSE
          Ptr^.Count := Ptr^.Count + 1
    END
END;  {Insert}

PROCEDURE MainInsert(VAR Word: STRING);
BEGIN
  Insert(Root, Word)
END;  

PROCEDURE PrintTree(VAR OutF: TEXT; Ptr: Tree);
BEGIN {PrintTree}
  IF Ptr <> NIL
  THEN
    BEGIN
      PrintTree(OutF, Ptr^.LLink);
      WRITELN(OutF, Ptr^.Str, ' ', Ptr^.Count);
      PrintTree(OutF, Ptr^.RLink)
    END
END;  {PrintTree}

PROCEDURE MainPrintTree(VAR OutF: TEXT); 
BEGIN
  PrintTree(OutF, Root) 
END; 

BEGIN {TreeSort}
  Root := NIL
END.  {TreeSort}
