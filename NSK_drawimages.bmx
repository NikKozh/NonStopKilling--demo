Function DrawAllImgs( level:Float )
Select level

	Case 1
	
	DrawImage( img_Floor1, 0, 0 )
	
	For Local Blood:TBlood = EachIn list_Blood
		SetRotation( Blood.Ang )
		SetScale( Blood.ScaleX, Blood.ScaleY )
		SetAlpha( Blood.Alpha )
		If Blood.rnd_Image = 1 Then DrawImage( img_Blood1, Blood.X, Blood.Y )
		If Blood.rnd_Image = 2 Then DrawImage( img_Blood2, Blood.X, Blood.Y )
		SetAlpha( 1 )
		SetScale( 1, 1 )
		SetRotation( 1 )
	Next
	
	For Local Bullet:TBullet = EachIn list_Bullets
		SetRotation( Bullet.Ang )
		DrawImage( img_Bul1, Bullet.X, Bullet.Y )
		SetRotation( 1 )
	Next
	
	For Local Enemy:TEnemy = EachIn list_Enemies
		SetRotation( Enemy.Ang )
		DrawImage( img_Mnstr1_walk, Enemy.X, Enemy.Y, Enemy.Frame )
		SetRotation( 1 )
	Next

	'SetScale( 0.5, 0.5 )
	SetRotation( plr_Ang2 )
	DrawImage( img_Plr1_foot, plr_X, plr_Y, plr_Frame )
	SetRotation( plr_Ang )
	DrawImage( img_Plr1_body, plr_X, plr_Y )
	SetRotation( 0 )
	'SetScale( 1, 1 )

	DrawImage( img_Cursor1, MouseX(), MouseY() )

EndSelect
EndFunction