CREATE TABLE [dbo].[contact] (
    [id]         UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [firstname]  NVARCHAR (80)   NOT NULL,
    [lastname]   NVARCHAR (80)   NOT NULL,
    [cellnumber] NVARCHAR (450)   NOT NULL,
    [email] NVARCHAR (500)  NOT NULL,
    CONSTRAINT [PK_Contact_Id] PRIMARY KEY CLUSTERED ([id] ASC) WITH (FILLFACTOR = 80)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Index_Contact_CellNumber_Unq]
    ON [dbo].[contact]([cellnumber] ASC) WITH (FILLFACTOR = 80);

GO
CREATE UNIQUE NONCLUSTERED INDEX [Index_Contact_Email_Unq]
    ON [dbo].[contact]([email] ASC) WITH (FILLFACTOR = 80);