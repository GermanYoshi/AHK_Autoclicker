/*	;Notes
	Written By: Hellbent AKA. CivReborn 
	Youtube Channel: https://www.youtube.com/channel/UCge0TKjySLXd8xeLib8F0rA
	Date Started: Dec 12th, 2016
	Date Of Last Edit: Dec 10th, 2017
	Last PasteBin Save:https://pastebin.com/GJKE0Asc       ;http://pastebin.com/4xNis6Fp
	Description: This is a 10 in 1 Auto Clicker 
	*/
	#SingleInstance, Force
	CoordMode, Mouse, Screen
	SetMouseDelay,-1
	; Variables List
	;-------------------------------------------------------------------------
	Multi_X := []
	Multi_Y := []
	Multi_Loop_Delay := []
	Multi_Unit_Count := []
	Multi_Click_Pos := []
	Multi_Shift_Click_On := []
	Multi_Start_Delay := []
	Clicker_On := []
	Passing_Clicker_On := []
	Loop_Multi_Times := 0
	Global Always := 1
	Global Single_Clicker :=
	Global Multi_Clicker :=
	Global Hide_When_Selecting := 0
	Global Hide_On_Start := 0
	Global Stop := 0
	;Gui Layout
	;-------------------------------------------------------------------------
	;--------------------------------------------------------------------------------------------------------------------
	;--------------------------------------------------------------------------------------------------------------------
	;Written By: HellBent AKA. CivReborn on Youtube
	Gui, Font, cAqua
	Gui, Add, CheckBox, x10 y10 vAlways Checked gAlways_On_Top, Always On Top
	Gui, Add, CheckBox, y+10 vHide_When_Selecting gSubmit_All, Hide For Coord Select
	Gui, Add, CheckBox, y+10 vHide_On_Start gSubmit_All, Hide When Started
	Gui, Add, GroupBox,cred x10 y+10 w150 h80, Auto Clicker Select 
	Gui, Add, Radio, x20 y100 Checked vSingle_Clicker gSubmit_All, Single Auto Clicker
	Gui, Add, Radio, y+10  vMulti_Clicker gSubmit_All, 10 in 1 Auto Clicker
	Gui, Add, GroupBox,cred x180 y10 w380 h150,Single Auto Clicker Controls                      
	Gui, Add, Checkbox, x230 y30 vClick_At_Cursor gSubmit_All , Click At Cursor 
	Gui, Add, Checkbox, x+30  vPaused_At_Start gSubmit_All , Paused At Start
	Gui, Add, Text, x200 y50, Click Counter:     
	Gui, Add, Radio, x+30 Checked vNo_Count gSubmit_All, None
	Gui, Add, Radio, x+30 vCount_On_Gui gSubmit_All, On Gui
	Gui, Add, Radio, x+30 vCount_On_ToolTip gSubmit_All, ToolTip
	Gui, Add, Text,x200 y70,Click Count:
	Gui, Add, Edit,cWhite x+10 w120 h15 ReadOnly vSingle_Click_Count, 0
	Gui, Add, Button, x+20 w120 h15 gReset_Single_Clicker_Count, Reset Count
	Gui, Add, Text, x200 y90, Duration Of Auto Clicker:
	Gui, Add, Radio, x+30 Checked vClick_Forever gSubmit_All,Forever
	Gui, Add, Radio, x+30 vSet_Amount_Of_Clicks gSubmit_All,Set Amount
	Gui, Add, Text, x200 y110, Number Of Clicks:
	Gui, Add, Edit,cblack x+10 w80 h15 Number vNumber_Of_Clicks gSubmit_All,
	Gui, Add, Text, x+10, Delay:
	Gui, Add, Edit,cblack x+10 h15 w80 Number vSingle_Clicker_Delay gSubmit_All,
	Gui, Add, Text, x+10, (ms)
	Gui, Add, Button, x210 y130 w150 h20 gSet_Single_Click_Location, Set Click Location
	Gui, Add, Edit,cWhite x+20 w150 h20 ReadOnly vSingle_Click_Location
	Gui, Add, GroupBox,cred x10 y170 w550 h290,10 In 1 Auto Clicker Controls  
	Gui, Add, CheckBox, x20 y190 right vLoop_Multi_Yes, Loop?
	Gui, Add, Text, x+20,Times:
	Gui, Add, Edit,cblack x+10 w100 h15 Number vLoop_Multi_Times gSubmit_All, %Loop_Multi_Times%
	Gui, Add, Text, x+30, Current Loop Count:
	Gui, Add, Edit,cWhite x+10 w100 h15 ReadOnly vLoop_Multi_Count gSubmit_All,0
	Gui, Add, CheckBox, x20 y210 Right vMulti_Clicking_Delay_On gSubmit_All, Adjust Click Delay:
	Gui, Add, Text, x+30, Delay Between Clicks:
	Gui, Add, Edit,cblack x+10 w100 h15 Number vMulti_Clicking_Delay gSubmit_All,
	Gui, Add, Text, x+10, (ms)
	Gui, Add, Text,cRed x20 y230,---------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
	Gui, Font, cWhite
	Gui, Add, Text,cRed x20 y250,#1
	Gui, Add, CheckBox, x+10 right vClicker_On1 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On1 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi1, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos1,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay1 gSubmit_All,Start Delay:
	Gui, Add, Edit,cBlack x+10 w50 h15 Number vMulti_Loop_Delay1 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count1 gSubmit_All,
	Gui, Add, Text,cRed x20 y270,#2
	Gui, Add, CheckBox, x+10 right vClicker_On2 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On2 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi2, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos2,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay2 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay2 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count2 gSubmit_All,
	Gui, Add, Text,cRed x20 y290,#3
	Gui, Add, CheckBox, x+10 right vClicker_On3 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On3 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi3, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos3,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay3 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay3 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count3 gSubmit_All,
	Gui, Add, Text,cRed x20 y310,#4
	Gui, Add, CheckBox, x+10 right vClicker_On4 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On4 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi4, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos4,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay4 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay4 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count4 gSubmit_All,
	Gui, Add, Text,cRed x20 y330,#5
	Gui, Add, CheckBox, x+10 right vClicker_On5 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On5 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi5, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos5,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay5 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay5 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count5 gSubmit_All,
	Gui, Add, Text,cRed x20 y350,#6
	Gui, Add, CheckBox, x+10 right vClicker_On6 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On6 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi6, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos6,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay6 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay6 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count6 gSubmit_All,
	Gui, Add, Text,cRed x20 y370,#7
	Gui, Add, CheckBox, x+10 right vClicker_On7 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On7 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi7, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos7,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay7 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay7 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count7 gSubmit_All,
	Gui, Add, Text,cRed x20 y390,#8
	Gui, Add, CheckBox, x+10 right vClicker_On8 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On8 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi8, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos8,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay8 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay8 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count8 gSubmit_All,
	Gui, Add, Text,cRed x20 y410,#9
	Gui, Add, CheckBox, x+10 right vClicker_On9 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On9 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi9, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos9,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay9 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay9 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count9 gSubmit_All,	
	Gui, Add, Text,cRed x20 y430,#10
	Gui, Add, CheckBox, x+4 right vClicker_On10 gSubmit_All,On
	Gui, Add, CheckBox, x+10 right vMulti_Shift_Click_On10 gSubmit_All,Shift:
	Gui, Add, Button, x+10 w50 h15 gSet_Click_Pos_Multi10, Get Pos
	Gui, Add, Edit,cWhite x+10 w50 h15 ReadOnly vMulti_Click_Pos10,
	Gui, Add, CheckBox, x+10 Right vMulti_Start_Delay10 gSubmit_All,Start Delay:
	Gui, Add, Edit,cblack x+10 w50 h15 Number vMulti_Loop_Delay10 gSubmit_All,
	Gui, Add, Text, x+10,(ms)
	Gui, Add, Text, x+10, Clicks:
	Gui, Add, Edit,cblack x+10 w60 h15 Number vMulti_Unit_Count10 gSubmit_All,
	;----------Hellbent------------------------------------------------------------------------------------------------------------------
	Gui, Add, Button,x10 w170 h25 gStart_Auto_Clickers,Start 
	Gui, Add, Button,x+20 w170 h25 gStop_Clicker, Stop
	Gui, Add, Button,x+20 w170 h25 gReload_Gui, Reset
	Gui, Add, Text,cGreen x10,Hotkeys: Ctrl + Number Pad 0 = Pause <----> Ctrl + Number Pad 1 = Exit <----> Ctrl + Number Pad 2 = Stop
	Gui, Add, Text,cWhite x10, Written By: Hellbent AKA CivReborn (YouTube)
	Gui, Color, Black
	Gui, +AlwaysOnTop
	Gui, Show,w570 h530,Hellbents 10 In 1 Auto Clickers
	Gui, Submit, NoHide
	return
	;Labels
	;-------------------------------------------------------------------------
	;--------------------------------------------------------------------------------------------------------------------
	;--------------------------------------------------------------------------------------------------------------------
	GuiClose:
		ExitApp
		return	
	Always_On_Top:         
		Gui, Submit, NoHide
		if(Always==1)
				Gui, +AlwaysOnTop
		if(Always==0)
				Gui, -AlwaysOnTop
		return
	Reload_Gui:
		Reload
		return
	Submit_All:
		Gui, Submit, NoHide
		i:=1
		Loop 10
			{
				Passing_Clicker_On[i] := Clicker_On%i%
				i++
			}	
		return
	Set_Single_Click_Location:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Find_Single_Click_Loc(Single_X,Single_Y,Single_Click_Location)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Single_Click_Location,%Single_Click_Location%
		return
	Reset_Single_Clicker_Count:
		Single_Click_Count := 0
		GuiControl,,Single_Click_Count,%Single_Click_Count%
		return
	Stop_Clicker:
		Stop := 1
		return
	Set_Click_Pos_Multi1:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X1,Multi_Y1, Multi_Click_Pos1)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos1,%Multi_Click_Pos1%
		return
	Set_Click_Pos_Multi2:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X2,Multi_Y2, Multi_Click_Pos2)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos2,%Multi_Click_Pos2%
		return
	Set_Click_Pos_Multi3:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X3,Multi_Y3, Multi_Click_Pos3)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos3,%Multi_Click_Pos3%
		return
	Set_Click_Pos_Multi4:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X4,Multi_Y4, Multi_Click_Pos4)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos4,%Multi_Click_Pos4%
		return
	Set_Click_Pos_Multi5:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X5,Multi_Y5, Multi_Click_Pos5)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos5,%Multi_Click_Pos5%
		return
	Set_Click_Pos_Multi6:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X6,Multi_Y6, Multi_Click_Pos6)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos6,%Multi_Click_Pos6%
		return
	Set_Click_Pos_Multi7:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X7,Multi_Y7, Multi_Click_Pos7)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos7,%Multi_Click_Pos7%
		return
	Set_Click_Pos_Multi8:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X8,Multi_Y8, Multi_Click_Pos8)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos8,%Multi_Click_Pos8%
		return
	Set_Click_Pos_Multi9:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X9,Multi_Y9, Multi_Click_Pos9)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos9,%Multi_Click_Pos9%
		return
	Set_Click_Pos_Multi10:
		if(Hide_When_Selecting==1)
				Gui, Minimize
		Set_Click_Loc_Multi(Multi_X10,Multi_Y10, Multi_Click_Pos10)
		if(Hide_When_Selecting==1)
				Gui, Show
		GuiControl,,Multi_Click_Pos10,%Multi_Click_Pos10%
		return			
	Start_Auto_Clickers:
		Gui, Submit, NoHide
		if(Hide_On_Start==1)
				Gui, Minimize
		GuiControl,,Loop_Multi_Count,0
		Stop := 0
		if(Single_Clicker==1) 
			{
				Single_AutoClicker(Click_At_Cursor,Paused_At_Start,No_Count,Count_On_Gui,Count_On_ToolTip,Single_Click_Count,Click_Forever,Set_Amount_Of_Clicks,Number_Of_Clicks,Single_Clicker_Delay,Single_X,Single_Y)
			}
		else if(Multi_Clicker==1) 
			{
				if(Loop_Multi_Yes==1)
					{
						if(Loop_Multi_Times==0)
							{
								Loop_Multi_Times := 99999999999
							}
						Loop %Loop_Multi_Times%
							{
								if(Stop==1)
									{
										Stop := 0
										break
									}
								Run_Multi_Clicker(Passing_Clicker_On,Multi_Shift_Click_On,Multi_X,Multi_Y,Multi_Start_Delay,Multi_Loop_Delay,Multi_Unit_Count,Multi_Clicking_Delay_On,Multi_Clicking_Delay)    ; <-------------------------------- Run Function (Multi)
								Loop_Multi_Count++
								GuiControl,,Loop_Multi_Count,%Loop_Multi_Count%
							}
					}
				if(Loop_Multi_Yes==0)
					{
						Run_Multi_Clicker(Passing_Clicker_On,Multi_Shift_Click_On,Multi_X,Multi_Y,Multi_Start_Delay,Multi_Loop_Delay,Multi_Unit_Count,Multi_Clicking_Delay_On,Multi_Clicking_Delay)   ; <------------------------------------ Run Function (Multi)
					}
			}
		else
			{
				if(Always==1)
					Gui, -AlwaysOnTop
				msgbox, You Need To Select "Single Auto Clicker" `nOr "10 In 1 Auto Clicker"
				if(Always==1)
					Gui, +AlwaysOnTop
			}
		return	
	;Functions
	;----H-----------------------E---------LL------B------E------N----------T---------
	Single_AutoClicker(Click_At_Cursor,Paused_At_Start,No_Count,Count_On_Gui,Count_On_ToolTip,Single_Click_Count,Click_Forever,Set_Amount_Of_Clicks,Number_Of_Clicks,Single_Clicker_Delay,Single_X,Single_Y)
		{
			;msgbox, Click_At_Cursor = %Click_At_Cursor%`nPaused_At_Start = %Paused_At_Start%`nNo_Count = %No_Count%`nCount_On_Gui = %Count_On_Gui%
			;.`nCount_On_ToolTip = %Count_On_ToolTip%`nSingle_Click_Count = %Single_Click_Count%`nClick_Forever = %Click_Forever%
			;.`nSet_Amount_Of_Clicks = %Set_Amount_Of_Clicks%`nNumber_Of_Clicks = %Number_Of_Clicks%`nSingle_Clicker_Delay = %Single_Clicker_Delay%
			;.`nSingle_X = %Single_X%`nSingle_Y = %Single_Y%
			i := 0
			if(Single_Clicker_Delay==null)
				{
					Single_Clicker_Delay := 0
				}
			if(Paused_At_Start==1)
				{
					Pause On
				}
			if(Click_Forever==1)
				{
					Set_Amount_Of_Clicks := 9999999999
				}
			if(Single_X!=null&&Single_Y!=null&&Click_At_Cursor==0)
				{
					Loop %Number_Of_Clicks%
						{
							if(Stop==1)
								{
									Stop := 0
									i := 0
									if(Count_On_Tooltip==1)
									ToolTip,
									break
								}
							Click, %Single_X% %Single_Y%
							Sleep, %Single_Clicker_Delay%
							i++
							if(Count_On_Gui==1)
									GuiControl,,Single_Click_Count,%i%
							if(Count_On_Tooltip==1)
									ToolTip, %i%
						}
				}
			if(Click_At_Cursor==1)
				{
					Loop %Number_Of_Clicks%
						{
							if(Stop==1)
								{
									Stop := 0
									i := 0
									if(Count_On_Tooltip==1)
									ToolTip,
									break
								}
							Click,
							Sleep, %Single_Clicker_Delay%
							i++
							if(Count_On_Gui==1)
									GuiControl,,Single_Click_Count,%i%
							if(Count_On_Tooltip==1)
									ToolTip, %i%
						}
				}	
			ToolTip,	
		}
	Run_Multi_Clicker(Passing_Clicker_On, Multi_Shift_Click_On,Multi_X,Multi_Y,Multi_Start_Delay,Multi_Loop_Delay,Multi_Unit_Count,Multi_Clicking_Delay_On,Multi_Clicking_Delay)
		{
			i := 1
			wait_Loop := 0
			Loop 10
				{
					looper := Multi_Unit_Count%i%
					if(Passing_Clicker_On[i]==1)
						{
							if(Stop==1)
									break
							if(Multi_Shift_Click_On%i%==1)
									Send, {Shift Down}
							if(Multi_X%i%!=Null&&Multi_Y%i%!=Null&&Multi_Unit_Count%i%>0)
								{
									If(Multi_Start_Delay%i%==1)
											wait_Loop := Multi_Loop_Delay%i%
									if(Multi_Loop_Delay%i%>1)
											Sleep, Multi_Loop_Delay%i%
									Loop %looper% 
										{
											if(Stop==1)
													break
											if(Multi_Clicking_Delay_On==1&&Multi_Clicking_Delay>0)
													delay := Multi_Clicking_Delay
											else
													delay := 0
											x := Multi_X%i%
											y := Multi_Y%i%
											Click, %x%,%y%
											sleep, %delay%
										}
								}
							if(Multi_Shift_Click_On%i%==1)
									Send, {Shift Up}	
						}
					i++	
				}
		}
	Set_Click_Loc_Multi(ByRef Multi_X, ByRef Multi_Y, ByRef Multi_Click_Pos)
		{
			button_ready := 0
			Multi_X :=
			Multi_Y :=
			Loop
				{
					MouseGetPos, TempX, TempY
					ToolTip, %TempX% %TempY%
					GetKeyState, Mouse_Click, LButton
					Mouse_Click := GetKeyState("LButton")
					if(Mouse_Click==0)
							button_ready := 1
					if(button_ready==1)
						{
							if(Mouse_Click==1)
								{
									Tooltip,
									Multi_X := TempX
									Multi_Y := TempY
									Multi_Click_Pos = %Multi_X% %Multi_Y%
									break
								}
						}
				}
		}
	Find_Single_Click_Loc(ByRef Single_X,ByRef Single_Y,ByRef Single_Click_Location)
		{
			button_ready := 0
			Single_X :=
			Single_Y :=
			Loop
				{
					MouseGetPos, TempX, TempY
					ToolTip, %TempX% %TempY%
					GetKeyState, Mouse_Click, LButton
					Mouse_Click := GetKeyState("LButton")
					if(Mouse_Click==0)
							button_ready := 1
					if(button_ready==1)
						{
							if(Mouse_Click==1)
								{
									Tooltip,
									Single_X := TempX
									Single_Y := TempY
									Single_Click_Location = %Single_X% %Single_Y%
									break
								}
						}
				}
		}
	;Hotkeys
	;-------------------------------------------------------------------------
	;--Hellbent----------------------------------------------------------------------------------------------------------
	;--------------------------------------------------------------------------------------------------------------------
	*^Numpad2::
		Stop:=1
		return
	*^Numpad0::Pause
	*^Numpad1::ExitApp