var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var pwdChk = /^.*(?=^.{10,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
var phoneChk = /^\d{3,4}$/;

jQuery(document).ready(function(){
	
	jQuery('#boardChk').on('click',function(){
		if(jQuery.trim(jQuery('#b_title').val()).length == 0){
			alert('제목을 입력하세요');
			return;
		}
		if(jQuery.trim(jQuery('#b_title').val()).length >= 20){
			alert('제목은 20자까지 가능합니다');
			return;
		}
		if(jQuery.trim(jQuery('#b_content').val()).length == 0){
			alert('내용을 입력하세요');
			return;
		}
		if(jQuery.trim(jQuery('#b_content').val()).length >= 3000){
			alert('내용은 3000자까지 가능합니다');
			return;
		}
		frm.submit();
	});
	
	jQuery('#replyChk').on('click',function(){
		if(jQuery.trim(jQuery('#r_content').val()).length == 0){
			alert('댓글 내용을 입력하세요');
			return;
		}
		if(jQuery.trim(jQuery('#r_content').val()).length >= 200){
			alert('댓글 내용은 200자까지 가능합니다');
			return;
		}
		replyfrm.submit();
	});
	
	
	jQuery('#clientModifyChk').on('click',function(){
		if(jQuery.trim(jQuery('#m_name').val()).length == 0){
			jQuery('#nameErrorMsg').html("<b>이름을 입력해주세요</b>");
			jQuery('#m_name').val("");
			jQuery('#m_name').focus();
			return;
		}
		if(jQuery.trim(jQuery('#m_name').val()).length <2 ||jQuery.trim(jQuery('#m_name').val()).length >10){
			jQuery('#nameErrorMsg').html("<b>이름은 2자이상 10자 이하입니다.</b>");
			jQuery('#m_name').val("");
			jQuery('#m_name').focus();
			return;
		}
		if(jQuery.trim(jQuery('#m_phone1').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#m_phone1').val("");
			jQuery('#m_phone1').focus();
			return;
		}
		if(jQuery.trim(jQuery('#m_phone2').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#m_phone2').val("");
			jQuery('#m_phone2').focus();
			return;
		}
		if(jQuery.trim(jQuery('#m_phone3').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#m_phone3').val("");
			jQuery('#m_phone3').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#m_phone1').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#m_phone1').val("");
			jQuery('#m_phone1').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#m_phone2').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#m_phone2').val("");
			jQuery('#m_phone2').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#m_phone3').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#m_phone3').val("");
			jQuery('#m_phone3').focus();
			return;
		}
		if(jQuery.trim(jQuery('#m_password').val()).length == 0){
			jQuery('#pwdErrorMsg').html("<b>비밀번호를 입력해주세요</b>");
			jQuery('#m_password').val("");
			jQuery('#m_password').focus();
			return;
		}
		
		modifyClientFrm.submit();
	});
	
	
	jQuery('#clientModifyPwdChk').on('click',function(){
		
		if(jQuery.trim(jQuery('#m_password').val()).length == 0){
			jQuery('#pwdErrorMsg').html("<b>비밀번호를 입력해주세요</b>");
			jQuery('#m_password').val("");
			jQuery('#m_password').focus();
			return;
		}
		if(jQuery.trim(jQuery('#m_newPassword').val()).length == 0){
			jQuery('#newPwdErrorMsg').html("<b>새 비밀번호를 입력해주세요</b>");
			jQuery('#m_newPassword').val("");
			jQuery('#m_newPassword').focus();
			return;
		}
		if(!pwdChk.test(jQuery.trim(jQuery('#m_newPassword').val()))){
			jQuery('#newPwdErrorMsg').html("<b>특수문자와 영어/숫자 조합으로 10~15글자로 입력하세요.</b>");
			jQuery('#m_newPassword').val("");
			jQuery('#m_newPassword').focus();
			return;
		}
		
		if(jQuery.trim(jQuery('#m_newPwdChk').val()).length == 0){
			jQuery('#newPwdchkErrorMsg').html("<b>새 비밀번호 확인 입력해주세요</b>");
			jQuery('#m_newPwdChk').val("");
			jQuery('#m_newPwdChk').focus();
			return;
		}
		if(jQuery.trim(jQuery('#m_newPwdChk').val()) != jQuery.trim(jQuery('#m_newPassword').val())){
			jQuery('#newPwdchkErrorMsg').html("<b>새 비밀번호와 새 비밀번호 확인을 일치시키세요.</b>");
			jQuery('#m_newPwdChk').val("");
			jQuery('#m_newPwdChk').focus();
			return;
		}
		
		frm.submit();
	});
	
	
	
	
	
	
	jQuery('#m_email').on('keydown',function(){
		jQuery('#emailErrorMsg').html("");
	});
	jQuery('#m_name').on('keydown',function(){
		jQuery('#nameErrorMsg').html("");
	});
	jQuery('#m_password').on('keydown',function(){
		jQuery('#pwdErrorMsg').html("");
	});
	jQuery('#pwdChk').on('keydown',function(){
		jQuery('#pwdchkErrorMsg').html("");
	});
	jQuery('#m_phone1').on('keydown',function(){
		jQuery('#phoneErrorMsg').html("");
	});
	jQuery('#m_phone2').on('keydown',function(){
		jQuery('#phoneErrorMsg').html("");
	});
	jQuery('#m_phone3').on('keydown',function(){
		jQuery('#phoneErrorMsg').html("");
	});
	
	
	jQuery('#m_newPassword').on('keydown',function(){
		jQuery('#newPwdErrorMsg').html("");
	});
	jQuery('#m_newPwdChk').on('keydown',function(){
		jQuery('#newPwdchkErrorMsg').html("");
	});
	
});

function showModifyFrm(id,id1) {
	jQuery(id).removeClass('hide');
	jQuery(id1).addClass('hide')
};

function hideModifyFrm(id,id1){
	jQuery(id).addClass('hide');
	jQuery(id1).removeClass('hide');
};

function modifyReply(id,id1){
	if(jQuery.trim(jQuery(id).val()).length == 0) {
		alert('댓글 내용을 입력하세요');
		return;
	}
	if(jQuery.trim(jQuery(id).val()).length >= 200){
		alert('댓글 내용은 200자까지 가능합니다');
		return;
	}
	jQuery(id1).submit();
};

function deleteReply(url){
	if(confirm('정말 삭제하시겠습니까?')){
		location.href =url;
	}
}

function deleteBoard(url){
	if(confirm('정말 삭제하시겠습니까?')){
		location.href=url;
	}
}

function deleteClientConfirm(url){
	if(confirm('정말 삭제하시겠습니까?')){
		location.href=url;
	}
}

