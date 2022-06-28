Create proc spBaidang_Luotxem (@iLuotxem int , @PK_iBaidangID int)
As
Begin
	Update tblBaidang 
	Set iLuotxem = @iLuotxem where PK_iBaidangID = @PK_iBaidangID
End

Create proc spChude_get
As
BEGIN
	SELECT * FROM tblBaidang
END
exec sp_SuaCD @id = 1022, @ten = N'KKK', @ngay = N'2000/11/26', @cmnd = 123456789, @hokhau = N'Ha Noi'
Exec spBaidang_Insert @sTieude=N'Xin chào t?t c? các b?n', @sNoidung=N'Các b?n hãy xin chào t?t c?!!!',@iLuotxem=1,@dNgaydang=N'2020/5/5',@FK_iChudeID=2,@sAnh='sadda'
Alter proc spBaidang_Insert (@sTieude nvarchar(200),@sNoidung nvarchar(MAX),@iLuotxem int, @dNgaydang datetime, @FK_iChudeID int)
AS
Begin
	Insert into tblBaidang
	Values (@sTieude,@sNoidung,@iLuotxem, @dNgaydang, @FK_iChudeID)
End

Alter proc spBaidang_new
As
Begin
	Select top 5 *From tblBaidang order by PK_iBaidangID desc
End
Exec spBaidang_getbyID @PK_iBaidangID = 7

Create proc spBaidang_random
As
Begin
	Select top 5 * from tblBaidang tablesample (5 rows)
End

create proc spBaidang_Hienluotxem(@PK_iBaidangID int, @iLuotxem int output)
As
Begin
	Select @iLuotxem=iLuotxem from tblBaidang where PK_iBaidangID=@PK_iBaidangID
End
	
Create proc spBaidang_getbyID(@PK_iBaidangID int = 0)
As
	If @PK_iBaidangID>0
		Select*from tblBaidang where PK_iBaidangID=@PK_iBaidangID
	else
		Select*from tblBaidang where 1 =1
Return 0
	
Create proc spChude_getbyID(@PK_iChudeID int = 0)
As
	If @PK_iChudeID>0
		Select*from tblChude where PK_iChudeID=@PK_iChudeID
	else
		Select*from tblChude where 1 =1
Return 0
/*
Create proc spUser_NameandID(@sName nvarchar(50), iUserID int)
As
Begin
	Select*from tblUser where sName=@sName and iUserID=@iUserID */



Create proc spLogin_get(@sName nchar(50), @sPassword nchar(50))
As
Begin
	Select * from tblUser where sName=@sName and sPassword=@sPassword
End

Create proc spLogin_getName(@sName nchar(50))
As
Begin
	Select * from tblUser where sName=@sName 
End

Create proc spLogin_insert(@sName nchar(50), @sPassword nchar(50),@sAnh nchar(50),@bQuyen bit)
AS
Begin
	Insert into tblUser
	Values (@sName, @sPassword, @sAnh, @bQuyen)
End

Create proc spLongin_delete (@PK_iUserID int)
As
Begin
	DELETE FROM tblUser
	WHERE PK_iUserID=@PK_iUserID

END

Create proc spLogin_Update(@sName nchar(50), @sPassword nchar(50),@sAnh nchar(50),@bQuyen bit)
As
Begin
	Update tblUser
	Set sName=@sName,sPassword=@sPassword,sAnh=@sAnh,bQuyen=@bQuyen
End

Create proc spBaidang_delete (@PK_iBaidangID int)
As
Begin
	DELETE FROM tblBaidang
	WHERE PK_iBaidangID=@PK_iBaidangID
END

Create proc spBaidang_Update (@sTieude nvarchar(200),@sNoidung nvarchar(MAX),@iLuotxem int, @dNgaydang datetime, @FK_iChudeID int)
As
Begin
	Update tblBaidang
	Set sTieude=@sTieude, sNoidung=@sNoidung, iLuotxem=@iLuotxem, dNgaydang=@dNgaydang, FK_iChudeID=@FK_iChudeID
End

select*from tblBaidang
exec spBaidang_Update @PK_iBaidangID = 5,  @sTieude =N'Bóng đá siêu hay',@sNoidung =N'Còn với Anthony Davis, chúng tôi sẽ kiểm tra lại tình hình khoảng 12 tiếng sau buổi tập để xem cậu ta có bị sưng hay đau gì không. Từ đó, chúng tôi sẽ quyết định khả năng ra sân cho Davis".Đây là thông tin rất mừng cho các CĐV Los Angeles Lakers vì đội bóng đang trong tình thế vô cùng khó khăn.', @iLuotxem= 6,@dNgaydang='2022/3/5',@FK_iChudeID=1
exec spBaidang_Insert @sTieude =N'Bóng đá siêu hay',@sNoidung =N'Còn với Anthony Davis, chúng tôi sẽ kiểm tra lại tình hình khoảng 12 tiếng sau buổi tập để xem cậu ta có bị sưng hay đau gì không. Từ đó, chúng tôi sẽ quyết định khả năng ra sân cho Davis".Đây là thông tin rất mừng cho các CĐV Los Angeles Lakers vì đội bóng đang trong tình thế vô cùng khó khăn.', @iLuotxem= 6,@dNgaydang='2022/3/5',@FK_iChudeID=1
exec spBaidang_getbyID @PK_iBaidangID = 4

Create proc spBinhluan_getbyBaidangID(@FK_iBaidangID int)
As
Begin
	Select * from tblBinhluan 
	where @FK_iBaidangID=FK_iBaidangID
End

Create proc spBinhluan_Insert(@sNoidung nvarchar(max), @FK_iBaidangID int, @FK_iUserID int)
As
Begin
	Insert into tblBinhluan
	values ( @sNoidung, @FK_iBaidangID, @FK_iUserID)
End

create view vNguoibinhluan
as
Select tblUser.sTen, tblBinhluan.sNoidung,tblBinhluan.FK_iBaidangID,tblUser.sAnh
From tblBinhluan,tblUser
Where tblBinhluan.FK_sName=tblUser.sName

Select * from tblBaidang

Create proc spBinhluan_getbyBaidang(@FK_iBaidangID int)
As
Begin
	Select * from vNguoibinhluan
	where FK_iBaidangID = @FK_iBaidangID
End

exec spLogin_getName @sName ='huy24'
exec spBinhluan_getbyBaidang @FK_iBaidangID = 4
select * from tblBaidang
Create proc spBaidang_getbyChude (@FK_iChudeID int)
As
Begin
	Select*from tblBaidang
	where FK_iChudeID=@FK_iChudeID
End

exec spBaidang_getbyChude @FK_iChudeID = 2
 
exec spBaidang_getbyID

Alter proc spBaidang_find(@sTieude nvarchar(200), @dNgaydang nvarchar(200))
As
Begin
	Select*from tblBaidang
	Where lower (sTieude) like '%'+lower(trim(@sTieude))+'%'
	or (dNgaydang) < convert(datetime,(@dNgaydang))
end

exec spBaidang_find @sTieude = N'Việt',@dNgaydang= N'Việt'