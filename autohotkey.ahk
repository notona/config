;vk1Csc079 & a:: Send, {Home}
;vk1Csc079 & e:: Send, {End}
;vk1Csc079 & Space:: Send, {LWin}


;----------------------------------------------------------------
;�L�[�o�C���h�𖳌��ɂ���E�B���h�E���ǂ������f����
; ahk_class��auto hot key�t����AU3_Spy.exe���g�p���Ē��ׂ�B
;  ���� �Ȃ�
;  �߂�l 1:�L�[�o�C���h�𖳌��ɂ���E�B���h�E
;         0:�L�[�o�C���h��L���ɂ���E�B���h�E
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
;�L�[�𑗐M����
; �L�[�o�C���h�𖳌��ɂ���E�B���h�E�ł́A���M���ꂽ�L�[�����̂܂܎g�p����
; �L�[�o�C���h��L���ɂ���E�B���h�E�ł́A���M���ꂽ�L�[��u��������
;
;  ���� original_key:�L�[�o�C���h�𖳌��ɂ���E�B���h�E�̏ꍇ�A���M����L�[
;       replace_key:�L�[�o�C���h��L���ɂ���E�B���h�E�̏ꍇ�A���M����L�[
;  �߂�l �Ȃ�
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

;���i�� �ϊ��L�[�� a �ōs�̎n�܂�ցBConemu �������� ctrl a �ɐ؂�ւ���
vk1Csc079 & a::send_key("^a","{Home}")
vk1Csc079 & e::send_key("^e","{End}")
vk1Csc079 & Space:: Send, {LWin}
