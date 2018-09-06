/*
 * 임시 비밀 번호 확인
 * 
 */

function createPW(){
	var rannum = [ '0','1','2','3','4','5','6','7','8','9'];		
	var ranchar	= ['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z'];	
	var newPW= ranchar[Math.floor(Math.random()*26)]+ranchar[Math.floor(Math.random()*26)]+ranchar[Math.floor(Math.random()*26)]+ranchar[Math.floor(Math.random()*26)]+rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)];
	
	return newPW;	
}

/*
 * 이메일 인증번호
 * 
 */

function emailConfirm(){
	var rannum = [ '0','1','2','3','4','5','6','7','8','9'];		
	var confrimemail= rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)]+rannum[Math.floor(Math.random()*10)];	
	return confrimemail;	
}

