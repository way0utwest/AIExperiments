
-- ASCII Art Procedure to display any message
CREATE OR ALTER PROCEDURE dbo.DisplayASCIIArt
    @Message VARCHAR(100) = NULL,
    @MessageID INT = NULL
AS
BEGIN
    SET NOCOUNT ON;

    -- If neither @Message nor @MessageID is provided
    IF @Message IS NULL
       AND @MessageID IS NULL
    BEGIN
        SET @Message = 'Hello'; -- Default message
    END
    -- If @MessageID is provided but @Message is not
    ELSE IF @Message IS NULL
            AND @MessageID IS NOT NULL
    BEGIN
        IF EXISTS (SELECT 1 FROM dbo.ASCIIMessage WHERE messageid = @MessageID)
        BEGIN
            SELECT @Message = Message
            FROM dbo.ASCIIMessage
            WHERE messageid = @MessageID;
        END
        ELSE
        BEGIN
            SET @Message = 'Message ID not found';
        END
    END
    -- Otherwise use the provided @Message

    -- Display the message and its ASCII art representation
    SELECT 'Message: ' + @Message AS [Message];

    -- Display ASCII art
    SELECT --LineNumber,
           ASCIILine
    FROM dbo.GenerateASCIIArt(@Message)
    ORDER BY LineNumber;
END
GO

-- Example usage:
-- Display a specific message directly:
EXEC dbo.DisplayASCIIArt @Message = 'Steve';

-- Or if using the ASCIIMessage table, display by ID:
-- EXEC dbo.DisplayASCIIArt @MessageID = 1;

-- Or display the default "Hello" message:
-- EXEC dbo.DisplayASCIIArt;