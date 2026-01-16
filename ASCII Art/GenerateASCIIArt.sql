-- ASCII Art Generator Function
CREATE OR ALTER FUNCTION dbo.GenerateASCIIArt
(
    @Text VARCHAR(100)
)
RETURNS TABLE
AS
RETURN
(
    WITH Numbers
    AS (SELECT 1 AS n
        UNION ALL
        SELECT n + 1
        FROM Numbers
        WHERE n < 7),
         CharMap
    AS (
       -- For letter 'A'
       SELECT 'A' AS letter,
              1 AS line,
              '*****' AS pattern
       UNION ALL
       SELECT 'A',
              2,
              '*   *'
       UNION ALL
       SELECT 'A',
              3,
              '*   *'
       UNION ALL
       SELECT 'A',
              4,
              '*****'
       UNION ALL
       SELECT 'A',
              5,
              '*   *'
       UNION ALL
       SELECT 'A',
              6,
              '*   *'
       UNION ALL
       SELECT 'A',
              7,
              '*   *'
       UNION ALL

       -- For letter 'B'
       SELECT 'B',
              1,
              '**** '
       UNION ALL
       SELECT 'B',
              2,
              '*   *'
       UNION ALL
       SELECT 'B',
              3,
              '*   *'
       UNION ALL
       SELECT 'B',
              4,
              '**** '
       UNION ALL
       SELECT 'B',
              5,
              '*   *'
       UNION ALL
       SELECT 'B',
              6,
              '*   *'
       UNION ALL
       SELECT 'B',
              7,
              '**** '
       UNION ALL

       -- For letter 'C'
       SELECT 'C',
              1,
              '*****'
       UNION ALL
       SELECT 'C',
              2,
              '*    '
       UNION ALL
       SELECT 'C',
              3,
              '*    '
       UNION ALL
       SELECT 'C',
              4,
              '*    '
       UNION ALL
       SELECT 'C',
              5,
              '*    '
       UNION ALL
       SELECT 'C',
              6,
              '*    '
       UNION ALL
       SELECT 'C',
              7,
              '*****'
       UNION ALL

       -- For letter 'D'
       SELECT 'D',
              1,
              '**** '
       UNION ALL
       SELECT 'D',
              2,
              '*   *'
       UNION ALL
       SELECT 'D',
              3,
              '*   *'
       UNION ALL
       SELECT 'D',
              4,
              '*   *'
       UNION ALL
       SELECT 'D',
              5,
              '*   *'
       UNION ALL
       SELECT 'D',
              6,
              '*   *'
       UNION ALL
       SELECT 'D',
              7,
              '**** '
       UNION ALL

       -- For letter 'E'
       SELECT 'E',
              1,
              '*****'
       UNION ALL
       SELECT 'E',
              2,
              '*    '
       UNION ALL
       SELECT 'E',
              3,
              '*    '
       UNION ALL
       SELECT 'E',
              4,
              '*****'
       UNION ALL
       SELECT 'E',
              5,
              '*    '
       UNION ALL
       SELECT 'E',
              6,
              '*    '
       UNION ALL
       SELECT 'E',
              7,
              '*****'
       UNION ALL

       -- For letter 'F'
       SELECT 'F',
              1,
              '*****'
       UNION ALL
       SELECT 'F',
              2,
              '*    '
       UNION ALL
       SELECT 'F',
              3,
              '*    '
       UNION ALL
       SELECT 'F',
              4,
              '*****'
       UNION ALL
       SELECT 'F',
              5,
              '*    '
       UNION ALL
       SELECT 'F',
              6,
              '*    '
       UNION ALL
       SELECT 'F',
              7,
              '*    '
       UNION ALL

       -- For letter 'G'
       SELECT 'G',
              1,
              '*****'
       UNION ALL
       SELECT 'G',
              2,
              '*    '
       UNION ALL
       SELECT 'G',
              3,
              '*    '
       UNION ALL
       SELECT 'G',
              4,
              '* ***'
       UNION ALL
       SELECT 'G',
              5,
              '*   *'
       UNION ALL
       SELECT 'G',
              6,
              '*   *'
       UNION ALL
       SELECT 'G',
              7,
              '*****'
       UNION ALL

       -- For letter 'H'
       SELECT 'H',
              1,
              '*   *'
       UNION ALL
       SELECT 'H',
              2,
              '*   *'
       UNION ALL
       SELECT 'H',
              3,
              '*   *'
       UNION ALL
       SELECT 'H',
              4,
              '*****'
       UNION ALL
       SELECT 'H',
              5,
              '*   *'
       UNION ALL
       SELECT 'H',
              6,
              '*   *'
       UNION ALL
       SELECT 'H',
              7,
              '*   *'
       UNION ALL

       -- For letter 'I'
       SELECT 'I',
              1,
              '*****'
       UNION ALL
       SELECT 'I',
              2,
              '  *  '
       UNION ALL
       SELECT 'I',
              3,
              '  *  '
       UNION ALL
       SELECT 'I',
              4,
              '  *  '
       UNION ALL
       SELECT 'I',
              5,
              '  *  '
       UNION ALL
       SELECT 'I',
              6,
              '  *  '
       UNION ALL
       SELECT 'I',
              7,
              '*****'
       UNION ALL

       -- For letter 'J'
       SELECT 'J',
              1,
              '*****'
       UNION ALL
       SELECT 'J',
              2,
              '    *'
       UNION ALL
       SELECT 'J',
              3,
              '    *'
       UNION ALL
       SELECT 'J',
              4,
              '    *'
       UNION ALL
       SELECT 'J',
              5,
              '    *'
       UNION ALL
       SELECT 'J',
              6,
              '*   *'
       UNION ALL
       SELECT 'J',
              7,
              '*****'
       UNION ALL

       -- For letter 'K'
       SELECT 'K',
              1,
              '*   *'
       UNION ALL
       SELECT 'K',
              2,
              '*  * '
       UNION ALL
       SELECT 'K',
              3,
              '* *  '
       UNION ALL
       SELECT 'K',
              4,
              '**   '
       UNION ALL
       SELECT 'K',
              5,
              '* *  '
       UNION ALL
       SELECT 'K',
              6,
              '*  * '
       UNION ALL
       SELECT 'K',
              7,
              '*   *'
       UNION ALL

       -- For letter 'L'
       SELECT 'L',
              1,
              '*    '
       UNION ALL
       SELECT 'L',
              2,
              '*    '
       UNION ALL
       SELECT 'L',
              3,
              '*    '
       UNION ALL
       SELECT 'L',
              4,
              '*    '
       UNION ALL
       SELECT 'L',
              5,
              '*    '
       UNION ALL
       SELECT 'L',
              6,
              '*    '
       UNION ALL
       SELECT 'L',
              7,
              '*****'
       UNION ALL

       -- For letter 'M'
       SELECT 'M',
              1,
              '*   *'
       UNION ALL
       SELECT 'M',
              2,
              '** **'
       UNION ALL
       SELECT 'M',
              3,
              '* * *'
       UNION ALL
       SELECT 'M',
              4,
              '*   *'
       UNION ALL
       SELECT 'M',
              5,
              '*   *'
       UNION ALL
       SELECT 'M',
              6,
              '*   *'
       UNION ALL
       SELECT 'M',
              7,
              '*   *'
       UNION ALL

       -- For letter 'N'
       SELECT 'N',
              1,
              '*   *'
       UNION ALL
       SELECT 'N',
              2,
              '**  *'
       UNION ALL
       SELECT 'N',
              3,
              '* * *'
       UNION ALL
       SELECT 'N',
              4,
              '*  **'
       UNION ALL
       SELECT 'N',
              5,
              '*   *'
       UNION ALL
       SELECT 'N',
              6,
              '*   *'
       UNION ALL
       SELECT 'N',
              7,
              '*   *'
       UNION ALL

       -- For letter 'O'
       SELECT 'O',
              1,
              '*****'
       UNION ALL
       SELECT 'O',
              2,
              '*   *'
       UNION ALL
       SELECT 'O',
              3,
              '*   *'
       UNION ALL
       SELECT 'O',
              4,
              '*   *'
       UNION ALL
       SELECT 'O',
              5,
              '*   *'
       UNION ALL
       SELECT 'O',
              6,
              '*   *'
       UNION ALL
       SELECT 'O',
              7,
              '*****'
       UNION ALL

       -- For letter 'P'
       SELECT 'P',
              1,
              '*****'
       UNION ALL
       SELECT 'P',
              2,
              '*   *'
       UNION ALL
       SELECT 'P',
              3,
              '*   *'
       UNION ALL
       SELECT 'P',
              4,
              '*****'
       UNION ALL
       SELECT 'P',
              5,
              '*    '
       UNION ALL
       SELECT 'P',
              6,
              '*    '
       UNION ALL
       SELECT 'P',
              7,
              '*    '
       UNION ALL

       -- For letter 'Q'
       SELECT 'Q',
              1,
              '*****'
       UNION ALL
       SELECT 'Q',
              2,
              '*   *'
       UNION ALL
       SELECT 'Q',
              3,
              '*   *'
       UNION ALL
       SELECT 'Q',
              4,
              '*   *'
       UNION ALL
       SELECT 'Q',
              5,
              '*   *'
       UNION ALL
       SELECT 'Q',
              6,
              '*  * '
       UNION ALL
       SELECT 'Q',
              7,
              '*** *'
       UNION ALL

       -- For letter 'R'
       SELECT 'R',
              1,
              '*****'
       UNION ALL
       SELECT 'R',
              2,
              '*   *'
       UNION ALL
       SELECT 'R',
              3,
              '*   *'
       UNION ALL
       SELECT 'R',
              4,
              '*****'
       UNION ALL
       SELECT 'R',
              5,
              '* *  '
       UNION ALL
       SELECT 'R',
              6,
              '*  * '
       UNION ALL
       SELECT 'R',
              7,
              '*   *'
       UNION ALL

       -- For letter 'S'
       SELECT 'S',
              1,
              '*****'
       UNION ALL
       SELECT 'S',
              2,
              '*    '
       UNION ALL
       SELECT 'S',
              3,
              '*    '
       UNION ALL
       SELECT 'S',
              4,
              '*****'
       UNION ALL
       SELECT 'S',
              5,
              '    *'
       UNION ALL
       SELECT 'S',
              6,
              '    *'
       UNION ALL
       SELECT 'S',
              7,
              '*****'
       UNION ALL

       -- For letter 'T'
       SELECT 'T',
              1,
              '*****'
       UNION ALL
       SELECT 'T',
              2,
              '  *  '
       UNION ALL
       SELECT 'T',
              3,
              '  *  '
       UNION ALL
       SELECT 'T',
              4,
              '  *  '
       UNION ALL
       SELECT 'T',
              5,
              '  *  '
       UNION ALL
       SELECT 'T',
              6,
              '  *  '
       UNION ALL
       SELECT 'T',
              7,
              '  *  '
       UNION ALL

       -- For letter 'U'
       SELECT 'U',
              1,
              '*   *'
       UNION ALL
       SELECT 'U',
              2,
              '*   *'
       UNION ALL
       SELECT 'U',
              3,
              '*   *'
       UNION ALL
       SELECT 'U',
              4,
              '*   *'
       UNION ALL
       SELECT 'U',
              5,
              '*   *'
       UNION ALL
       SELECT 'U',
              6,
              '*   *'
       UNION ALL
       SELECT 'U',
              7,
              '*****'
       UNION ALL

       -- For letter 'V'
       SELECT 'V',
              1,
              '*   *'
       UNION ALL
       SELECT 'V',
              2,
              '*   *'
       UNION ALL
       SELECT 'V',
              3,
              '*   *'
       UNION ALL
       SELECT 'V',
              4,
              '*   *'
       UNION ALL
       SELECT 'V',
              5,
              '*   *'
       UNION ALL
       SELECT 'V',
              6,
              ' * * '
       UNION ALL
       SELECT 'V',
              7,
              '  *  '
       UNION ALL

       -- For letter 'W'
       SELECT 'W',
              1,
              '*   *'
       UNION ALL
       SELECT 'W',
              2,
              '*   *'
       UNION ALL
       SELECT 'W',
              3,
              '*   *'
       UNION ALL
       SELECT 'W',
              4,
              '*   *'
       UNION ALL
       SELECT 'W',
              5,
              '* * *'
       UNION ALL
       SELECT 'W',
              6,
              '** **'
       UNION ALL
       SELECT 'W',
              7,
              '*   *'
       UNION ALL

       -- For letter 'X'
       SELECT 'X',
              1,
              '*   *'
       UNION ALL
       SELECT 'X',
              2,
              '*   *'
       UNION ALL
       SELECT 'X',
              3,
              ' * * '
       UNION ALL
       SELECT 'X',
              4,
              '  *  '
       UNION ALL
       SELECT 'X',
              5,
              ' * * '
       UNION ALL
       SELECT 'X',
              6,
              '*   *'
       UNION ALL
       SELECT 'X',
              7,
              '*   *'
       UNION ALL

       -- For letter 'Y'
       SELECT 'Y',
              1,
              '*   *'
       UNION ALL
       SELECT 'Y',
              2,
              '*   *'
       UNION ALL
       SELECT 'Y',
              3,
              ' * * '
       UNION ALL
       SELECT 'Y',
              4,
              '  *  '
       UNION ALL
       SELECT 'Y',
              5,
              '  *  '
       UNION ALL
       SELECT 'Y',
              6,
              '  *  '
       UNION ALL
       SELECT 'Y',
              7,
              '  *  '
       UNION ALL

       -- For letter 'Z'
       SELECT 'Z',
              1,
              '*****'
       UNION ALL
       SELECT 'Z',
              2,
              '    *'
       UNION ALL
       SELECT 'Z',
              3,
              '   * '
       UNION ALL
       SELECT 'Z',
              4,
              '  *  '
       UNION ALL
       SELECT 'Z',
              5,
              ' *   '
       UNION ALL
       SELECT 'Z',
              6,
              '*    '
       UNION ALL
       SELECT 'Z',
              7,
              '*****'
       UNION ALL

       -- For space ' '
       SELECT ' ',
              1,
              '     '
       UNION ALL
       SELECT ' ',
              2,
              '     '
       UNION ALL
       SELECT ' ',
              3,
              '     '
       UNION ALL
       SELECT ' ',
              4,
              '     '
       UNION ALL
       SELECT ' ',
              5,
              '     '
       UNION ALL
       SELECT ' ',
              6,
              '     '
       UNION ALL
       SELECT ' ',
              7,
              '     ')
    SELECT n AS LineNumber,
           STUFF(
           (
               SELECT ' ' + cm.pattern
               FROM
               (
                   SELECT SUBSTRING(UPPER(@Text), number, 1) AS char,
                          number AS position
                   FROM master.dbo.spt_values
                   WHERE type = 'P'
                         AND number
                         BETWEEN 1 AND LEN(@Text)
               ) AS TextChars
                   JOIN CharMap cm
                       ON cm.letter = TextChars.char
                          AND cm.line = n
               ORDER BY TextChars.position
               FOR XML PATH('')
           ),
           1,
           1,
           ''
                ) AS ASCIILine
    FROM Numbers
);