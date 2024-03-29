USE [sandbox]
GO
/****** Object:  StoredProcedure [dbo].[p_Initialize]    Script Date: 3/30/2019 12:01:40 PM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

ALTER PROCEDURE [dbo].[p_Initialize]

    (

     @MaxX INT = NULL,

     @MaxY INT = NULL,

     @NumberOfMines INT = NULL,

     @Seed INT = NULL

    )

/* Initializing the game by creating the grid and randomly dropping the mines. I included a @seed parameter to be able to create the same map multiple times. If you call the procedure without any parameters he'll use the same as last game, except the seed naturally */
AS

    BEGIN

        UPDATE  Settings

        SET     MaxX = ISNULL(@MaxX, MaxX),

                MaxY = ISNULL(@MaxY, MaxY),

                NumberOfMines = ISNULL(@NumberOfMines, NumberOfMines)

           

        SELECT  @MaxX = MaxX,

                @MaxY = MaxY,

                @NumberOfMines = NumberOfMines

        FROM    Settings

        TRUNCATE TABLE Mine

        TRUNCATE TABLE Grid

 

        DECLARE @x INT

        DECLARE @y INT

/* Creating records to represent the squares of the grid */       

        SET @x = 1
        WHILE @x <= @MaxX

            BEGIN

                SET @y = 1

                WHILE @y <= @MaxY

                    BEGIN

                        INSERT  INTO grid

                        VALUES  (@x, @y, -1)

                        SET @y = @y + 1

                    END

                SET @x = @x + 1

            END

/* Setting the seed if necessary */
        IF @seed IS NOT NULL
            SET @x = RAND(@seed)

/* Dropping mines, but never on the same square */

        WHILE @NumberOfMines > 0

            BEGIN

                SET @x = FLOOR(RAND() * @MaxX) + 1

                SET @y = FLOOR(RAND() * @MaxY) + 1

           

                IF (SELECT  COUNT(*)

                    FROM    mine

                    WHERE   x = @x

                            AND y = @y

                   ) = 0

                    BEGIN

                        INSERT  INTO Mine

                        VALUES  (@x, @y)

                        SET @NumberOfMines = @NumberOfMines - 1

                    END

            END  

    END
