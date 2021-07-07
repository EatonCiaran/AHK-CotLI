#NoEnv  ; Recommended for performance and compatibility with future AutoHotkey releases.
#SingleInstance force
; #Warn  ; Enable warnings to assist with detecting common errors.
SendMode Input  ; Recommended for new scripts due to its superior speed and reliability.
SetWorkingDir %A_ScriptDir%  ; Ensures a consistent starting directory.
DetectHiddenWindows, On

global GameTitle := "Crusaders of The Lost Idols"

#If WinActive(GameTitle)
^F1::
	ce_enter_speed(1)
	ce_apply_speed()

	Reload
	Sleep 1000 ; If successful, the reload will close this instance during the Sleep, so the line below will never be reached.
	MsgBox, 4,, The script could not be reloaded. Would you like to exit?
	IfMsgBox, Yes, ExitApp
Return

^1::
	ce_enter_speed(1)
	ce_apply_speed()
Return

^2::
	ce_enter_speed(10)
	ce_apply_speed()
Return

^3::
	Loop 50000 {
		;buff_time1()
		;buff_time2()
		buff_time3()
	}
Return

^4::
	Loop 40000 {
		shopchest_select1()
		shopchest_purchase()
	}
Return


^F2::
	Loop {
		ce_set_speed(500)
		ControlSend,, {Left}, %GameTitle%
		Sleep 2000
		ControlSend,, {Right}, %GameTitle%
		Sleep 2000

		ce_set_speed(25)
		Loop 3 {
			click_level(GameTitle)

			ControlSend,, {Left}, %GameTitle%
			Sleep 1000
			ControlSend,, {Right}, %GameTitle%
			Sleep 1000
		}
	}
Return

^F3::
	ce_enter_speed(10)
	ce_apply_speed()

	ControlFocus,, %GameTitle%
	SetControlDelay -1

	Loop {
		progress(GameTitle)
	}
Return

^F4::
	ControlFocus,, Cheat Engine 6.7
	SetControlDelay -1

	Loop {
		sprint(GameTitle)
	}
Return

^F5::
	ControlFocus,, Cheat Engine 6.7
	SetControlDelay -1

	Loop {
		sprint(GameTitle)
		
		; Assign formation
		ControlSend,, w, %GameTitle%
		
		ce_enter_speed(10)
		ce_apply_speed()
	
		toggle_auto_progress(GameTitle)
		Loop 550 {
			progress(GameTitle)
		}
		toggle_auto_progress(GameTitle)
	}
Return

^F6::
	Loop {
		Loop 50 {
			click_kill(GameTitle)
		}
		;click_upgrade(GameTitle)
		
		Loop 50 {
			click_kill(GameTitle)
		}
		;click_level(GameTitle)
		
		;toggle_auto_progress(GameTitle)
	}
Return

^F7::
	Loop {
		ce_enter_speed(10)
		ce_apply_speed()

		Sleep 100
		magnify()
		storm_rider()
		magnify()
		storm_rider()

		ce_enter_speed(500)
		ce_apply_speed()
		
		Sleep 8000
	}
Return

^F8::
	ce_enter_speed(10)
	ce_apply_speed()

	ControlFocus,, %GameTitle%
	SetControlDelay -1

	Loop {
		ControlSend,, {Right}, %GameTitle%
		Sleep 100

		click_upgrade(GameTitle)
		click_level(GameTitle)
		Sleep 500
	}
Return
#If


toggle_auto_progress(GameTitle) {
	ControlSend,, g, %GameTitle%
}

progress(GameTitle) {
	ControlSend,, {Right}, %GameTitle%
	Sleep 100

	click_upgrade(GameTitle)
	click_level(GameTitle)
	Sleep 5000
}

sprint(GameTitle) {
	ce_enter_speed(1)
	ce_apply_speed()

	world_reset(GameTitle)
	select_fp_2p(GameTitle)

	ce_enter_speed(10)
	ce_apply_speed()
	
	; Hide notifications
	ControlSend,, {Space}, %GameTitle%
	Sleep 100

	; Farm some gold
	Loop 50 {
		click_kill(GameTitle)
	}
	click_level(GameTitle)

	; Get to level 4
	Loop 3 {
		ControlSend,, {Right}, %GameTitle%
		click_upgrade(GameTitle)
		click_level(GameTitle)
		Sleep 5000
	}
	
	; Get ready for Sprint Mode
	ce_enter_speed(1)
	ce_apply_speed()
	buff_spawn1()
	;buff_spawn2()
	;buff_spawn3()
	Sleep 300

	; Boss Sprint
	Loop 40 {
		ControlSend,, {Right}, %GameTitle%
		click_level(GameTitle)
		Sleep 6000
		
		ControlSend,, {Right}, %GameTitle%
		click_upgrade(GameTitle)
		Sleep 6000
	}
}

click_kill(GameTitle) {
	ControlClick, x725 y325, %GameTitle%
	Sleep 100
}

click_upgrade(GameTitle) {
	ControlClick, x993 y570, %GameTitle%
	Sleep 1000
}
click_level(GameTitle) {
	ControlClick, x993 y652, %GameTitle%
	Sleep 1300
}

select_fp_2p(GameTitle) {
	; Position
	Loop 4 {
		scroll_down(GameTitle)
	}
	Sleep 400
	
	; Select
	ControlClick, x548 y378, %GameTitle%
	Sleep 200
	
	; Confirm
	ControlClick, x785 y593, %GameTitle%
	Sleep 3000
}

scroll_right(GameTitle) {
	ControlClick, x994 y614, %GameTitle%
	Sleep 100
}

scroll_down(GameTitle) {
	ControlClick, x589 y636, %GameTitle%
	Sleep 100
}

buff_spawn() {
	ControlClick, x580 y144, Crusaders of The Lost Idols
	Sleep 100
}

buff_spawn1() {
	buff_spawn()

	ControlClick, x670 y192, Crusaders of The Lost Idols
	Sleep 100
}

buff_spawn2() {
	buff_spawn()

	ControlClick, x670 y231, Crusaders of The Lost Idols
	Sleep 100
}

buff_spawn3() {
	buff_spawn()

	ControlClick, x670 y268, Crusaders of The Lost Idols
	Sleep 100
}

buff_time1() {
	ControlSend, , {Ctrl down}{Shift down}, Crusaders of The Lost Idols
	ControlClick, x550 y195, Crusaders of The Lost Idols
	Sleep 50
}


buff_time2() {
	ControlSend, , {Ctrl down}{Shift down}, Crusaders of The Lost Idols
	ControlClick, x550 y230, Crusaders of The Lost Idols
	Sleep 50
}

buff_time3() {
	ControlSend, , {Ctrl down}{Shift down}, Crusaders of The Lost Idols
	ControlClick, x550 y265, Crusaders of The Lost Idols
	Sleep 100
}

shopchest_select1() {
	; select to buy 1 chest that would use ingame currency
	ControlClick, x200 y450, Crusaders of The Lost Idols
	Sleep 100
}

shopchest_purchase() {
	; purchase chest
	ControlClick, x350 y530, Crusaders of The Lost Idols
	Sleep 1000
}

clickorama() {
	ControlSend, , 1, %GameTitle%
	Sleep 20
}
magnify() {
	ControlSend, , 2, %GameTitle%
	Sleep 20
}
fire_storm() {
	ControlSend, , 3, %GameTitle%
	Sleep 20
}
savage_strikes() {
	ControlSend, , 4, %GameTitle%
	Sleep 20
}
goldorama() {
	ControlSend, , 5, %GameTitle%
	Sleep 20
}
royal_command() {
	ControlSend, , 6, %GameTitle%
	Sleep 20
}
storm_rider() {
	ControlSend, , 7, %GameTitle%
	Sleep 20
}
alchemy() {
	ControlSend, , 8, %GameTitle%
	Sleep 20
}



world_reset(GameTitle) {
	Loop 9 {
		scroll_right(GameTitle)
	}
	Sleep 1000

	click_reset(GameTitle)
}

click_reset(GameTitle) {
	; Click Nate Dragon's Ability
	ControlClick, x55 y680, %GameTitle%		; On mission
	Sleep 10
	ControlClick, x190 y682, %GameTitle%	; Not on mission
	Sleep 2500
	
	; Confirmation window
	ControlClick, x435 y555, %GameTitle%
	Sleep 4500
	
	; Big Red Button
	ControlClick, x518 y567, %GameTitle%
	Sleep 13000
	
	; Rewards Summary
	ControlClick, x526 y583, %GameTitle%
	Sleep 3000
}


ce_set_speed(speed) {
	ce_enter_speed(speed)
	ce_apply_speed()
}
ce_enter_speed(speed) {
	ControlSetText, Edit1, %speed%, Cheat Engine 6.7
	Sleep 30
}
ce_apply_speed() {
	ControlClick, Button3, Cheat Engine 6.7
	Sleep 30
}

ce_focus_speedbox() {
	ControlFocus, Edit1, Cheat Engine 6.7
	Sleep 50
}
ce_toggle_speedhack() {
	ControlClick, Button4, Cheat Engine 6.7
	Sleep 10
}