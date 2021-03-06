USE [UserDb]
GO
/****** Object:  Trigger [dbo].[trg_projectUsersAdd]    Script Date: 22.11.2020 20:12:18 ******/
/*Yeni eklenen bir projeye sistemdeki kullanıcıyı otomatik olarak eklemesi için yazıldı */
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
ALTER trigger [dbo].[trg_projectUsersAdd] on [dbo].[projects]
after insert
As
declare @insertedProjeID int;
declare @insertedUserID int;

Begin


set @insertedProjeID =( Select  [ID]  from inserted)
set @insertedUserID=(Select [systemUserID] from inserted)



		INSERT INTO projectUsers
						   (
							  [userID]
							  ,[projectID]
							  ,[createdDate]
							 
						   )
		VALUES
							(@insertedUserID
							,@insertedProjeID
							,GETDATE())
						

End
