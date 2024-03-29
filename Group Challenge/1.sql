USE [sandbox]
GO
/****** Object:  StoredProcedure [dbo].[p_Solve1]    Script Date: 3/30/2019 11:57:39 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER PROCEDURE [dbo].[p_Solve1]

/* It's quite easy to write SQL statements to help clear the minefield. This one flags the only non-explored square next to a 1. */
AS

    UPDATE  Grid

    SET     S = -100

    FROM    (SELECT

      DISTINCT      x2,

                    y2

             FROM   (SELECT x1,

                            y1,

                            MAX(x2) x2,

                            MAX(y2) y2

                     FROM   (SELECT g1.x AS x1,

                                    g1.y AS y1,

                                    g2.x AS x2,

                                    g2.y AS y2

                             FROM   grid g1

                                    INNER JOIN grid g2 ON g1.x - g2.X BETWEEN -1 AND 1

                                                          AND g1.y - g2.y BETWEEN -1 AND 1

                             WHERE  g1.S = 1

                                    AND g2.S IN (-1, -100)

                            ) s1

                     GROUP BY x1,

                            y1

                     HAVING COUNT(*) = 1

                    ) s2

            ) s3

    WHERE   grid.x = s3.x2

            AND grid.y = s3.y2

            AND grid.s = -1
