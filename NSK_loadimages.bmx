Global img_Floor1:TImage
Global img_Cur1Bas:TImage
Global img_Cur1Skel:TImage
Global img_Cur1ASkel:TImage
Global img_Cursor1:TImage
Global img_Plr1_body:TImage
Global img_Plr1_foot:TImage
Global img_Bul1:TImage
Global img_Mnstr1_walk:TImage
Global img_Blood1:TImage
Global img_Blood2:TImage

Function LoadAllImgs( level:Float )
Select level

	Case 1
	img_Floor1 = LoadImage( "Data\Images\Floor1.png" )

	img_Cursor1 = LoadImage( "Data\Images\Cursor1.png" )

	img_Plr1_body = LoadImage( "Data\Images\Plr1_body.png" )
	SetImageHandle( img_Plr1_body, 6, 9 )
	img_Plr1_foot = LoadAnimImage( "Data\Images\Plr1_foot.png", 25, 12, 0, 34 )
	SetImageHandle( img_Plr1_foot, 7, 6 )

	img_Bul1 = LoadImage( "Data\Images\Bul1.png" )
	MidHandleImage( img_Bul1 )
	
	img_Mnstr1_walk = LoadAnimImage( "Data\Images\Mnstr1_walk.png", 25, 22, 0, 60 )
	MidHandleImage( img_Mnstr1_walk )
	
	img_Blood1 = LoadImage( "Data\Images\Blood1.png" )
	SetImageHandle( img_Blood1, 10, 17 )
	img_Blood2 = LoadImage( "Data\Images\Blood2.png" )
	SetImageHandle( img_Blood2, 10, 10 )

EndSelect
EndFunction