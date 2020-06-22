#include <ButtonConstants.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>
#include <WindowsConstants.au3>
#include <MsgBoxConstants.au3>

$source = FileSelectFolder("Select pieces folder", @ScriptDir)

$target = FileSelectFolder("Select target folder", @ScriptDir)
DirCreate($target&"\king")
DirCreate($target&"\queen")
DirCreate($target&"\rook")
DirCreate($target&"\bishop")
DirCreate($target&"\knight")
DirCreate($target&"\pawn")
DirCreate($target&"\empty")

$hSearch = FileFindFirstFile($source&"\*.*")
$currentPic = FileFindNextFile($hSearch)


#Region ### START Koda GUI section ### Form=
$Form1 = GUICreate("ClassifyPieces", 337, 351)
$Pic1 = GUICtrlCreatePic($source&"\"&$currentPic, 8, 8, 150, 300)
$Button1 = GUICtrlCreateButton("♔", 168, 8, 107, 33)
GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
$Button2 = GUICtrlCreateButton("♕", 168, 48, 107, 33)
GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
$Button3 = GUICtrlCreateButton("♖", 168, 88, 107, 33)
GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
$Button4 = GUICtrlCreateButton("♗", 168, 128, 107, 33)
GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
$Button5 = GUICtrlCreateButton("♘", 168, 168, 107, 33)
GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
$Button6 = GUICtrlCreateButton("♙", 168, 208, 107, 33)
GUICtrlSetFont(-1, 15, 400, 0, "MS Sans Serif")
$Button7 = GUICtrlCreateButton("Empty", 168, 248, 107, 33)
$Button8 = GUICtrlCreateButton("Exit", 8, 320, 107, 25)
GUISetState(@SW_SHOW)
#EndRegion ### END Koda GUI section ###

While 1
	$nMsg = GUIGetMsg()
	Switch $nMsg
		Case $GUI_EVENT_CLOSE
			Exit
		Case $Button1
			selectPiece("king")
		Case $Button2
			selectPiece("queen")
		Case $Button3
			selectPiece("rook")
		Case $Button4
			selectPiece("bishop")
		Case $Button5
			selectPiece("knight")
		Case $Button6
			selectPiece("pawn")
		Case $Button7
			selectPiece("empty")
	EndSwitch
WEnd

Func selectPiece($type)
	FileCopy($source&"\"&$currentPic, $target&"\"&$type&"\")
	$currentPic = FileFindNextFile($hSearch)
	if @error then exit
	GUICtrlSetImage($Pic1,$source&"\"&$currentPic)
EndFunc