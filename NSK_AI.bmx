'Include "NSK_Enemies.bmx"

Type TBullet

	Field link:TLink
	Field X#, Y#
	Field Speed#
	Field Ang
	
	Method Remove()
		link.remove
	EndMethod

	Method AddLast( list:TList )
		link = list.AddLast( Self )
	EndMethod
	
	Method Update()

		X:+ Speed * Cos( Ang )
		Y:+ Speed * Sin( Ang )
		
		If ( x < -50 ) Or ( x > sW + 50 ) Or ( y < -50 ) Or ( y > sH + 50 ) Then

			link.remove
			Return
		
		EndIf

	EndMethod
	
	Function CreateBullet:TBullet( x#, y#, ang, speed# )

		Local Bullet:TBullet = New TBullet
		Bullet.X = x
		Bullet.Y = y
		Bullet.Ang = ang
		Bullet.Speed = speed
		Bullet.AddLast( list_Bullets )
		Return Bullet

	EndFunction

EndType

Type TBlood

	Field link:TLink
	Field X#, Y#
	Field ScaleX#, ScaleY#, ScaleSpeed#
	Field Ang
	Field Alpha#, AlphaSpeed#
	Field rnd_Image

	Method Remove()
		link.remove
	EndMethod

	Method AddLast( list:TList )
		link = list.AddLast( Self )
	EndMethod
	
	Method Update()

		ScaleX:- ScaleSpeed
		ScaleY:- ScaleSpeed

		Alpha:- AlphaSpeed
		
		If ( ScaleX <= 0 ) And ( ScaleY <= 0 ) Then
			Remove
			Return
		EndIf
		If Alpha <= 0 Then
			Remove
			Return
		EndIf

	EndMethod
	
	Function CreateBlood:TBlood( x, y, ang )

		Local Blood:TBlood = New TBlood
		Blood.X = x
		Blood.Y = y
		Blood.Ang = ang
		Blood.ScaleX = Rnd( 0.25, 1 )
		Blood.ScaleY = Blood.ScaleX
		Blood.ScaleSpeed = 0.0001
		Blood.Alpha = 1
		Blood.AlphaSpeed = 0.00001
		Blood.rnd_Image = Rand( 2 )
		Blood.AddLast( list_Blood )
		Return Blood

	EndFunction

EndType


Global coeff_ScaleX_Cur1Bas:Float
Global coeff_ScaleY_Cur1Bas:Float
Global coeff_ScaleX_Cur1Skel:Float
Global coeff_ScaleY_Cur1Skel:Float
Global coeff_ScaleX_Cur1ASkel:Float
Global coeff_ScaleY_Cur1ASkel:Float

Global list_Bullets:TList
Global list_Blood:TList

Global rand_SideEnemy

Global CountEnemies = 5
Global CountNowEnemies
Global CountKillEnemies
Global LifeEnemies = 5


Function UpdateLevelAI()

	If CountKillEnemies = 20 Then
		CountEnemies = 15
		LifeEnemies = 10
	EndIf

	For Local Enemies:TEnemy = EachIn list_Enemies
		CountNowEnemies:+ 1
	Next
	
	If CountNowEnemies < CountEnemies Then

		rand_SideEnemy = Rand( 0, 3 )
		Select rand_SideEnemy
		
		Case 0
		TEnemy.CreateEnemy( sW + 60, Rand( -60, sH + 60 ), 2, LifeEnemies )
		
		Case 1
		TEnemy.CreateEnemy( Rand( -60, sW + 60 ), sH + 60, 2, LifeEnemies )
		
		Case 2
		TEnemy.CreateEnemy( -60, Rand( -60, sW + 60 ), 2, LifeEnemies )
		
		Case 3
		TEnemy.CreateEnemy( Rand( -60, sW + 60 ), -60, 2, LifeEnemies )
		
		EndSelect

	EndIf
	
	CountNowEnemies = 0

EndFunction

Function CreateLists()

	list_Bullets = New TList
	list_Enemies = New TList
	list_Blood = New TList

EndFunction

Function UpdateAllLists()

	For Local Bullets:TBullet = EachIn list_Bullets
		Bullets.Update()
	Next
	For Local Enemies:TEnemy = EachIn list_Enemies
		Enemies.Update()
	Next
	For Local Blood:TBlood = EachIn list_Blood
		Blood.Update()
	Next

EndFunction

Function UpdateBasicAI()

	UpdateAllLists()
	UpdateLevelAI()

EndFunction

Function AngleWithPoints:Double( x1:Double, y1:Double, x2:Double, y2:Double )
	Return ATan2( y2 - y1, x2 - x1 )
EndFunction

Function PAA_X( x, k, angle )
 	Return x + k * Cos( angle )
EndFunction

Function PAA_Y( y, k, angle )
	Return y + k * Sin( angle )
EndFunction