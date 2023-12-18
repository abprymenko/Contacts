CREATE TABLE [dbo].[contact] (
    [id]         UNIQUEIDENTIFIER DEFAULT (newid()) NOT NULL,
    [firstname]  NVARCHAR (MAX)   NOT NULL,
    [lastname]   NVARCHAR (MAX)   NOT NULL,
    [cellnumber] NVARCHAR (450)   NOT NULL,
    [email] NVARCHAR (30) DEFAULT 'qwerty@email.com'  NOT NULL,
    CONSTRAINT [PK_Contact_Id] PRIMARY KEY CLUSTERED ([id] ASC)
);


GO
CREATE UNIQUE NONCLUSTERED INDEX [Index_Contact_CellNumber_Unq]
    ON [dbo].[contact]([cellnumber] ASC);

