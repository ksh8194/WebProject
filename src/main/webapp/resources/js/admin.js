var emailChk = /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*@[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
var pwdChk = /^.*(?=^.{10,15}$)(?=.*\d)(?=.*[a-zA-Z])(?=.*[!@#$%^&+=]).*$/;
var phoneChk = /^\d{3,4}$/;

jQuery(document).ready(function(){
	jQuery('#noticeChk').on('click',function(){
		if(jQuery.trim(jQuery('#n_title').val()).length == 0){
			alert('제목을 입력하세요');
			return;
		}
		if(jQuery.trim(jQuery('#n_title').val()).length >= 20){
			alert('제목은 20자까지 가능합니다');
			return;
		}
		if(jQuery.trim(jQuery('#n_content').val()).length == 0){
			alert('내용을 입력하세요');
			return;
		}
		if(jQuery.trim(jQuery('#n_content').val()).length >= 3000){
			alert('내용은 3000자까지 가능합니다');
			return;
		}
		noticefrm.submit();
	});
	
	
	jQuery('#adminChk').on('click',function(){
		
		if(jQuery.trim(jQuery('#a_name').val()).length == 0){
			jQuery('#nameErrorMsg').html("<b>이름을 입력해주세요</b>");
			jQuery('#a_name').val("");
			jQuery('#a_name').focus();
			return;
		}
		if(jQuery.trim(jQuery('#a_name').val()).length <2 ||jQuery.trim(jQuery('#a_name').val()).length >10){
			jQuery('#nameErrorMsg').html("<b>이름은 2자이상 10자 이하입니다.</b>");
			jQuery('#a_name').val("");
			jQuery('#a_name').focus();
			return;
		}
		
		
		if(jQuery.trim(jQuery('#a_email').val()).length == 0){
			jQuery('#emailErrorMsg').html("<b>이메일을 입력해주세요</b>");
			jQuery('#a_email').val("");
			jQuery('#a_email').focus();
			return;
		}
		if(jQuery('#emailChk').val()=="false"){
			jQuery('#emailErrorMsg').html("<b>이메일을 확인하세요.</b>");
			jQuery('#m_email').val("");
			jQuery('#m_email').focus();
			return;
		}
		
		if(jQuery.trim(jQuery('#a_phone1').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone1').val("");
			jQuery('#a_phone1').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#a_phone1').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone1').val("");
			jQuery('#a_phone1').focus();
			return;
		}
		
		
		if(jQuery.trim(jQuery('#a_phone2').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone2').val("");
			jQuery('#a_phone2').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#a_phone2').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone2').val("");
			jQuery('#a_phone2').focus();
			return;
		}
		
		
		if(jQuery.trim(jQuery('#a_phone3').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone3').val("");
			jQuery('#a_phone3').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#a_phone3').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone3').val("");
			jQuery('#a_phone3').focus();
			return;
		}
		
		
		if(jQuery.trim(jQuery('#a_password').val()).length == 0){
			jQuery('#pwdErrorMsg').html("<b>비밀번호를 입력해주세요</b>");
			jQuery('#a_password').val("");
			jQuery('#a_password').focus();
			return;
		}
		if(!pwdChk.test(jQuery.trim(jQuery('#a_password').val()))){
			jQuery('#pwdErrorMsg').html("<b>특수문자와 영어/숫자 조합으로 10~15글자로 입력하세요.</b>");
			jQuery('#a_password').val("");
			jQuery('#a_password').focus();
			return;
		}
		
		if(jQuery.trim(jQuery('#pwdChk').val()).length == 0){
			jQuery('#pwdchkErrorMsg').html("<b>비밀번호 확인 입력해주세요</b>");
			jQuery('#pwdChk').val("");
			jQuery('#pwdChk').focus();
			return;
		}
		if(jQuery.trim(jQuery('#pwdChk').val()) != jQuery.trim(jQuery('#a_password').val())){
			jQuery('#pwdchkErrorMsg').html("<b>비밀번호와 비밀번호 확인을 일치시키세요.</b>");
			jQuery('#pwdChk').val("");
			jQuery('#pwdChk').focus();
			return;
		}
		
		frm.submit();
	});
	
	jQuery('#a_email').on('keydown',function(){
		jQuery('#emailErrorMsg').html("");
	});
	jQuery('#a_name').on('keydown',function(){
		jQuery('#nameErrorMsg').html("");
	});
	jQuery('#a_password').on('keydown',function(){
		jQuery('#pwdErrorMsg').html("");
	});
	jQuery('#pwdChk').on('keydown',function(){
		jQuery('#pwdchkErrorMsg').html("");
	});
	jQuery('#a_phone1').on('keydown',function(){
		jQuery('#phoneErrorMsg').html("");
	});
	jQuery('#a_phone2').on('keydown',function(){
		jQuery('#phoneErrorMsg').html("");
	});
	jQuery('#a_phone3').on('keydown',function(){
		jQuery('#phoneErrorMsg').html("");
	});
	
	
	
	
	
	jQuery('#modifyChk').on('click',function(){
		if(jQuery.trim(jQuery('#a_name').val()).length == 0){
			jQuery('#nameErrorMsg').html("<b>이름을 입력해주세요</b>");
			jQuery('#a_name').val("");
			jQuery('#a_name').focus();
			return;
		}
		if(jQuery.trim(jQuery('#a_name').val()).length <2 ||jQuery.trim(jQuery('#a_name').val()).length >10){
			jQuery('#nameErrorMsg').html("<b>이름은 2자이상 10자 이하입니다.</b>");
			jQuery('#a_name').val("");
			jQuery('#a_name').focus();
			return;
		}
		if(jQuery.trim(jQuery('#a_phone1').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone1').val("");
			jQuery('#a_phone1').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#a_phone1').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone1').val("");
			jQuery('#a_phone1').focus();
			return;
		}
		
		
		if(jQuery.trim(jQuery('#a_phone2').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone2').val("");
			jQuery('#a_phone2').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#a_phone2').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone2').val("");
			jQuery('#a_phone2').focus();
			return;
		}
		
		
		if(jQuery.trim(jQuery('#a_phone3').val()).length == 0){
			jQuery('#phoneErrorMsg').html("<b>핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone3').val("");
			jQuery('#a_phone3').focus();
			return;
		}
		if(!phoneChk.test(jQuery.trim(jQuery('#a_phone3').val()))){
			jQuery('#phoneErrorMsg').html("<b>올바른 형태의 핸드폰 번호를 입력하세요.</b>");
			jQuery('#a_phone3').val("");
			jQuery('#a_phone3').focus();
			return;
		}
		
		frm.submit();
	});
	
	
	
	
	
	
	
	jQuery('#a_email').on('keyup',function() {
		$.ajax({
	    	url : "emailChkForAdmin",
	    	type : "post",
	    	data : JSON.stringify({"a_email" : jQuery.trim(jQuery('#a_email').val())}),
	    	contentType : "application/json;charset=UTF-8",
	    	dataType: "json",
	    	success : function(data) {
	    		if(!data.result && emailChk.test(jQuery.trim(jQuery('#a_email').val()))){
	    			jQuery('#emailChk').val("true");
	    			console.log(jQuery('#emailChk').val());
	    			jQuery('#emailErrorMsg').html("<b>사용가능한 이메일입니다.</b>");
	    		}else {
	    			jQuery('#emailChk').val("false");
	    			console.log(jQuery('#emailChk').val());
	    			jQuery('#emailErrorMsg').html("<b>사용 불가능한 이메일입니다.</b>");
 		    		}
 		    	}
 		   });
 			
 		});
	
	
	
	
	

});

function deleteNotice(url){
	if(confirm('정말 삭제하시겠습니까?')){
		location.href=url;
	}
};

function deleteMember(url){
	if(confirm('정말 삭제하시겠습니까?')){
		location.href=url;
	}
};

function adminDeleteReply(url){
	if(confirm('정말 삭제하시겠습니까?')){
		location.href =url;
	}
};

function deleteBoard(url){
	if(confirm('정말 삭제하시겠습니까?')){
		location.href=url;
	}
};

