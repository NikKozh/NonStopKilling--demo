Include "NSK_drawimages.bmx"
Include "NSK_loadimages.bmx"
Include "NSK_AI.bmx"
Include "NSK_Player.bmx"
Include "NSK_Enemies.bmx"
Include "NSK_mus_sounds.bmx"

Global sW = 800, sH = 600
Global UserQuit = False
Global Screen = -1

Graphics sW, sH
HideMouse()
SeedRnd( MilliSecs() )
SetBlend( ALPHABLEND )

LoadAllImgs( 1 )

CreateLists()

CreatePlayer( sW / 2, sH / 2, 5, 100 )

Screen = 1

Repeat
Cls

	UpdateBasicAI()
	UpdatePlayer()

	DrawAllImgs( 1 )
	SetColor( 0, 0, 0 )
	DrawText( CountKillEnemies, 10, 10 )
	SetColor( 255, 255, 255 )

	If KeyHit( key_escape ) Then UserQuit = True

Flip
Until ( AppTerminate() ) Or ( UserQuit = True )