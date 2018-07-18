Global plr_X#, plr_Y#
Global plr_Speed#
Global plr_Life
Global plr_Ang#, plr_Ang2#
Global plr_Frame, plr_Animnext, plr_Animspeed
Global plr_Weapon, plr_Reload#

Global isAngAnim = True


Function CreatePlayer( x, y, speed, life )

	plr_X = x
	plr_Y = y
	plr_Speed = speed
	plr_Life = life
	plr_Ang = 0
	plr_Ang2 = 0
	plr_Weapon = 0
	plr_Reload = 0
	plr_Animspeed = 25
	plr_Frame = 0
	plr_Animnext = 0

EndFunction

Function UpdatePlayer()

	If ( KeyDown( key_w ) ) And ( ( KeyDown( key_a ) ) Or ( KeyDown( key_d ) ) ) Then plr_Speed = 1.5
	If ( KeyDown( key_s ) ) And ( ( KeyDown( key_a ) ) Or ( KeyDown( key_d ) ) ) Then plr_Speed = 1.5

	If Not ( KeyDown( key_w ) ) And ( ( KeyDown( key_a ) ) Or ( KeyDown( key_d ) ) ) Then plr_Speed = 3
	If Not ( KeyDown( key_s ) ) And ( ( KeyDown( key_a ) ) Or ( KeyDown( key_d ) ) ) Then plr_Speed = 3

	If KeyDown( key_w ) Then

		plr_Y:- plr_Speed
		If plr_Animnext < MilliSecs() Then
			plr_Animnext = MilliSecs() + plr_Animspeed
			plr_Frame:+ 1
		EndIf
		If ( KeyDown( key_a ) = False ) And ( KeyDown( key_d ) = False ) Then
			plr_Ang2 = 270
		EndIf
		If KeyDown( key_a ) Then
			plr_Ang2 = 225
		EndIf
		If KeyDown( key_d ) Then
			plr_Ang2 = 315
		EndIf
	
	EndIf
	If KeyDown( key_s ) Then

		plr_Y:+ plr_Speed
		If plr_Animnext < MilliSecs() Then
			plr_Animnext = MilliSecs() + plr_Animspeed
			plr_Frame:+ 1
		EndIf
		If ( KeyDown( key_a ) = False ) And ( KeyDown( key_d ) = False ) Then
			plr_Ang2 = 90
		EndIf
		If KeyDown( key_a ) Then
			plr_Ang2 = 135
		EndIf
		If KeyDown( key_d ) Then
			plr_Ang2 = 45
		EndIf
	
	EndIf
	If KeyDown( key_a ) Then

		plr_X:- plr_Speed
		If plr_Animnext < MilliSecs() Then
			plr_Animnext = MilliSecs() + plr_Animspeed
			plr_Frame:+ 1
		EndIf
		If ( KeyDown( key_w ) = False ) And ( KeyDown( key_s ) = False ) Then
			plr_Ang2 = 180
		EndIf

	EndIf
	If KeyDown( key_d ) Then

		plr_X:+ plr_Speed
		If plr_Animnext < MilliSecs() Then
			plr_Animnext = MilliSecs() + plr_Animspeed
			plr_Frame:+ 1
		EndIf
		If ( KeyDown( key_w ) = False ) And ( KeyDown( key_s ) = False ) Then
			plr_Ang2 = 0
		EndIf

	EndIf

	If plr_Frame = 34 Then plr_Frame = 0
	
	If ( KeyDown( key_w ) = False ) And ( KeyDown( key_s ) = False ) And ( KeyDown( key_a ) = False ) And ( KeyDown( key_d ) = False ) Then
		plr_Frame = 0
		isAngAnim = True
	EndIf

	plr_Ang = AngleWithPoints( plr_X, plr_Y, MouseX(), MouseY() )
	
	If plr_Reload <> 0 Then plr_Reload:- 1

	If MouseDown( 1 ) Then
	Select plr_Weapon

		Case 0
		
		If plr_Reload = 0 Then
		
			TBullet.CreateBullet( PAA_X( plr_X, 40, plr_Ang), PAA_Y( plr_Y, 18, plr_Ang ), plr_Ang, 25 )
			If CountKillEnemies < 20 Then plr_Reload = 40
			If CountKillEnemies => 20 Then plr_Reload = 10
		
		EndIf

	EndSelect
	EndIf

EndFunction