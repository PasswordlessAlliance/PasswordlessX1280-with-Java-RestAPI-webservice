const reg = /[\{\}\[\]\/?.,;:|\)*~`!^\-_+<>@\#$%&\\\=\(\'\"]/gi;

function selLang() {
	var curUrl = window.location.pathname;
	var curParam = window.location.search;
	if(curParam != "") {
		curParam = curParam.replace("\?", "");
	}
	console.log(curUrl);
	console.log(curParam);
	
	var newParam = "";
	var selLang = $("#lang").val();
	window.localStorage.setItem('lang', selLang);

	arrParam = curParam.split("&");
	for(i=0; i<arrParam.length; i++) {
		tmpParam = arrParam[i].split("=");
		if(tmpParam.length == 2 && tmpParam[0] != "lang")
			newParam += "&" + arrParam[i];
	}
	if(newParam != "")
		newParam += "&";
	newParam += "lang=" + selLang;
	
	console.log(newParam);
	location.href = curUrl + "?" + newParam;
}
