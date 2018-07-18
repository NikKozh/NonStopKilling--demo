Type TEnemy

	Field link:TLink
	Field X#, Y#
	Field Speed#
	Field Life
	Field Ang
	Field Frame, Animnext, Animspeed

	Method Remove()
		link.remove
	EndMethod
	
	Method AddLast( list:TList )
		link = list.AddLast( Self )
	EndMethod
	
	Method Update()

		Ang = AngleWithPoints( X, Y, plr_X, plr_Y )
		
		X:+ Speed * Cos( Ang )
		Y:+ Speed * Sin( Ang )
		
		If Animnext < MilliSecs() Then
			Animnext = MilliSecs() + Animspeed
			Frame:+ 1
		EndIf
		
		If Frame = 60 Then Frame = 0

		For Bullet:TBullet = EachIn list_Bullets

			If ImagesCollide2( img_Bul1, Bullet.X, Bullet.Y, 0, Bullet.Ang, 1, 1, img_Mnstr1_walk, X, Y, Frame, Ang, 1,  1 ) Then

				Life:- 5
				TBlood.CreateBlood( X, Y, Bullet.Ang )
				Bullet.Remove

			EndIf

		Next

		If Life <= 0 Then

			Remove
			CountKillEnemies:+ 1

		EndIf

	EndMethod
	
	Function CreateEnemy:TEnemy( x#, y#, speed#, life# )
	
		Local Enemy:TEnemy = New TEnemy
		Enemy.X = x
		Enemy.Y = y
		Enemy.Ang = AngleWithPoints( X, Y, plr_X, plr_Y )
		Enemy.Speed = speed
		Enemy.Life = life
		Enemy.Frame = 0
		Enemy.Animnext = 0
		Enemy.Animspeed = 17
		Enemy.AddLast( list_Enemies )
		Return Enemy
	
	EndFunction

EndType

Global list_Enemies:TList