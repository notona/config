;vk1Csc079 & a:: Send, {Home}
;vk1Csc079 & e:: Send, {End}
;vk1Csc079 & Space:: Send, {LWin}


;----------------------------------------------------------------
;キーバインドを無効にするウィンドウかどうか判断する
; ahk_classはauto hot key付属のAU3_Spy.exeを使用して調べる。
;  引数 なし
;  戻り値 1:キーバインドを無効にするウィンドウ
;         0:キーバインドを有効にするウィンドウ
;----------------------------------------------------------------
is_disable_window()
{
	;Conemu
	IfWinActive,ahk_class VirtualConsoleClass
	{
		return 1
	}
	return 0
}
 
;----------------------------------------------------------------
;キーを送信する
; キーバインドを無効にするウィンドウでは、送信されたキーをそのまま使用する
; キーバインドを有効にするウィンドウでは、送信されたキーを置き換える
;
;  引数 original_key:キーバインドを無効にするウィンドウの場合、送信するキー
;       replace_key:キーバインドを有効にするウィンドウの場合、送信するキー
;  戻り値 なし
;----------------------------------------------------------------
send_key(original_key,replace_key)
{
	if (is_disable_window())
	{
		Send,%original_key%
		return
	}
	Send,%replace_key%
	return
}

;普段は 変換キーと a で行の始まりへ。Conemu だったら ctrl a に切り替える
vk1Csc079 & a::send_key("^a","{Home}")
vk1Csc079 & e::send_key("^e","{End}")
vk1Csc079 & Space:: Send, {LWin}
