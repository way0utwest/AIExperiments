CREATE FUNCTION dbo.GetAsciiArt(@char CHAR(1))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX)
    
    SET @char = UPPER(@char)
    
    SET @result = CASE @char
        WHEN 'A' THEN 
            '  ***  ' + CHAR(13) + CHAR(10) +
            ' *   * ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*******' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *'
        WHEN 'B' THEN 
            '****** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '****** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '****** '
        WHEN 'C' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN 'D' THEN 
            '****** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '****** '
        WHEN 'E' THEN 
            '*******' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '****   ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*******'
        WHEN 'F' THEN 
            '*******' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '****   ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      '
        WHEN 'G' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*  ****' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN 'H' THEN 
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*******' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *'
        WHEN 'I' THEN 
            '*******' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '*******'
        WHEN 'J' THEN 
            '*******' + CHAR(13) + CHAR(10) +
            '    *  ' + CHAR(13) + CHAR(10) +
            '    *  ' + CHAR(13) + CHAR(10) +
            '    *  ' + CHAR(13) + CHAR(10) +
            '    *  ' + CHAR(13) + CHAR(10) +
            '*   *  ' + CHAR(13) + CHAR(10) +
            ' ***   '
        WHEN 'K' THEN 
            '*    * ' + CHAR(13) + CHAR(10) +
            '*   *  ' + CHAR(13) + CHAR(10) +
            '*  *   ' + CHAR(13) + CHAR(10) +
            '***    ' + CHAR(13) + CHAR(10) +
            '*  *   ' + CHAR(13) + CHAR(10) +
            '*   *  ' + CHAR(13) + CHAR(10) +
            '*    * '
        WHEN 'L' THEN 
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*******'
        WHEN 'M' THEN 
            '*     *' + CHAR(13) + CHAR(10) +
            '**   **' + CHAR(13) + CHAR(10) +
            '* * * *' + CHAR(13) + CHAR(10) +
            '*  *  *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *'
        WHEN 'N' THEN 
            '*     *' + CHAR(13) + CHAR(10) +
            '**    *' + CHAR(13) + CHAR(10) +
            '* *   *' + CHAR(13) + CHAR(10) +
            '*  *  *' + CHAR(13) + CHAR(10) +
            '*   * *' + CHAR(13) + CHAR(10) +
            '*    **' + CHAR(13) + CHAR(10) +
            '*     *'
        WHEN 'O' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN 'P' THEN 
            '****** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '****** ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '*      '
        WHEN 'Q' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*   * *' + CHAR(13) + CHAR(10) +
            '*    * ' + CHAR(13) + CHAR(10) +
            ' **** *'
        WHEN 'R' THEN 
            '****** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '****** ' + CHAR(13) + CHAR(10) +
            '*   *  ' + CHAR(13) + CHAR(10) +
            '*    * ' + CHAR(13) + CHAR(10) +
            '*     *'
        WHEN 'S' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            ' ***** ' + CHAR(13) + CHAR(10) +
            '      *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN 'T' THEN 
            '*******' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   '
        WHEN 'U' THEN 
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN 'V' THEN 
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' *   * ' + CHAR(13) + CHAR(10) +
            '  * *  ' + CHAR(13) + CHAR(10) +
            '   *   '
        WHEN 'W' THEN 
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*  *  *' + CHAR(13) + CHAR(10) +
            '* * * *' + CHAR(13) + CHAR(10) +
            '**   **' + CHAR(13) + CHAR(10) +
            '*     *'
        WHEN 'X' THEN 
            '*     *' + CHAR(13) + CHAR(10) +
            ' *   * ' + CHAR(13) + CHAR(10) +
            '  * *  ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '  * *  ' + CHAR(13) + CHAR(10) +
            ' *   * ' + CHAR(13) + CHAR(10) +
            '*     *'
        WHEN 'Y' THEN 
            '*     *' + CHAR(13) + CHAR(10) +
            ' *   * ' + CHAR(13) + CHAR(10) +
            '  * *  ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   '
        WHEN 'Z' THEN 
            '*******' + CHAR(13) + CHAR(10) +
            '     * ' + CHAR(13) + CHAR(10) +
            '    *  ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '  *    ' + CHAR(13) + CHAR(10) +
            ' *     ' + CHAR(13) + CHAR(10) +
            '*******'
        WHEN '0' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*    **' + CHAR(13) + CHAR(10) +
            '*   * *' + CHAR(13) + CHAR(10) +
            '**    *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN '1' THEN 
            '   *   ' + CHAR(13) + CHAR(10) +
            '  **   ' + CHAR(13) + CHAR(10) +
            ' * *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '*******'
        WHEN '2' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '      *' + CHAR(13) + CHAR(10) +
            '   *** ' + CHAR(13) + CHAR(10) +
            '  *    ' + CHAR(13) + CHAR(10) +
            ' *     ' + CHAR(13) + CHAR(10) +
            '*******'
        WHEN '3' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '      *' + CHAR(13) + CHAR(10) +
            '   *** ' + CHAR(13) + CHAR(10) +
            '      *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN '4' THEN 
            '    *  ' + CHAR(13) + CHAR(10) +
            '   **  ' + CHAR(13) + CHAR(10) +
            '  * *  ' + CHAR(13) + CHAR(10) +
            ' *  *  ' + CHAR(13) + CHAR(10) +
            '*******' + CHAR(13) + CHAR(10) +
            '    *  ' + CHAR(13) + CHAR(10) +
            '    *  '
        WHEN '5' THEN 
            '*******' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '****** ' + CHAR(13) + CHAR(10) +
            '      *' + CHAR(13) + CHAR(10) +
            '      *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN '6' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*      ' + CHAR(13) + CHAR(10) +
            '****** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN '7' THEN 
            '*******' + CHAR(13) + CHAR(10) +
            '     * ' + CHAR(13) + CHAR(10) +
            '    *  ' + CHAR(13) + CHAR(10) +
            '   *   ' + CHAR(13) + CHAR(10) +
            '  *    ' + CHAR(13) + CHAR(10) +
            ' *     ' + CHAR(13) + CHAR(10) +
            '*      '
        WHEN '8' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN '9' THEN 
            ' ***** ' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ******' + CHAR(13) + CHAR(10) +
            '      *' + CHAR(13) + CHAR(10) +
            '*     *' + CHAR(13) + CHAR(10) +
            ' ***** '
        WHEN ' ' THEN 
            '       ' + CHAR(13) + CHAR(10) +
            '       ' + CHAR(13) + CHAR(10) +
            '       ' + CHAR(13) + CHAR(10) +
            '       ' + CHAR(13) + CHAR(10) +
            '       ' + CHAR(13) + CHAR(10) +
            '       ' + CHAR(13) + CHAR(10) +
            '       '
        ELSE 
            '  ???  ' + CHAR(13) + CHAR(10) +
            ' ?   ? ' + CHAR(13) + CHAR(10) +
            '    ?  ' + CHAR(13) + CHAR(10) +
            '   ?   ' + CHAR(13) + CHAR(10) +
            '  ?    ' + CHAR(13) + CHAR(10) +
            '       ' + CHAR(13) + CHAR(10) +
            '  ?    '
    END
    
    RETURN @result
END
GO

GO

-- Wrapper function to display an entire word as ASCII art
CREATE FUNCTION dbo.GetWordAsciiArt(@word NVARCHAR(100))
RETURNS NVARCHAR(MAX)
AS
BEGIN
    DECLARE @result NVARCHAR(MAX) = ''
    DECLARE @line1 NVARCHAR(MAX) = ''
    DECLARE @line2 NVARCHAR(MAX) = ''
    DECLARE @line3 NVARCHAR(MAX) = ''
    DECLARE @line4 NVARCHAR(MAX) = ''
    DECLARE @line5 NVARCHAR(MAX) = ''
    DECLARE @line6 NVARCHAR(MAX) = ''
    DECLARE @line7 NVARCHAR(MAX) = ''
    DECLARE @i INT = 1
    DECLARE @len INT = LEN(@word)
    DECLARE @char CHAR(1)
    DECLARE @charArt NVARCHAR(MAX)
    DECLARE @lines TABLE (LineNum INT, LineText NVARCHAR(100))
    
    -- Loop through each character in the word
    WHILE @i <= @len
    BEGIN
        SET @char = SUBSTRING(@word, @i, 1)
        SET @charArt = dbo.GetAsciiArt(@char)
        
        -- Split the character art into individual lines
        DELETE FROM @lines
        
        INSERT INTO @lines (LineNum, LineText)
        SELECT 
            ROW_NUMBER() OVER (ORDER BY (SELECT NULL)),
            value
        FROM STRING_SPLIT(@charArt, CHAR(10))
        
        -- Append each line to the corresponding line variable
        SELECT @line1 = @line1 + REPLACE(LineText, CHAR(13), '') + ' ' FROM @lines WHERE LineNum = 1
        SELECT @line2 = @line2 + REPLACE(LineText, CHAR(13), '') + ' ' FROM @lines WHERE LineNum = 2
        SELECT @line3 = @line3 + REPLACE(LineText, CHAR(13), '') + ' ' FROM @lines WHERE LineNum = 3
        SELECT @line4 = @line4 + REPLACE(LineText, CHAR(13), '') + ' ' FROM @lines WHERE LineNum = 4
        SELECT @line5 = @line5 + REPLACE(LineText, CHAR(13), '') + ' ' FROM @lines WHERE LineNum = 5
        SELECT @line6 = @line6 + REPLACE(LineText, CHAR(13), '') + ' ' FROM @lines WHERE LineNum = 6
        SELECT @line7 = @line7 + REPLACE(LineText, CHAR(13), '') + ' ' FROM @lines WHERE LineNum = 7
        
        SET @i = @i + 1
    END
    
    -- Combine all lines
    SET @result = @line1 + CHAR(13) + CHAR(10) +
                  @line2 + CHAR(13) + CHAR(10) +
                  @line3 + CHAR(13) + CHAR(10) +
                  @line4 + CHAR(13) + CHAR(10) +
                  @line5 + CHAR(13) + CHAR(10) +
                  @line6 + CHAR(13) + CHAR(10) +
                  @line7
    
    RETURN @result
END
GO

-- Example usage:
-- SELECT dbo.GetAsciiArt('A')
-- SELECT dbo.GetAsciiArt('5')
-- PRINT dbo.GetAsciiArt('H')
-- 
-- Display a word:
-- PRINT dbo.GetWordAsciiArt('HELLO')

PRINT dbo.GetWordAsciiArt('SQL 2025')