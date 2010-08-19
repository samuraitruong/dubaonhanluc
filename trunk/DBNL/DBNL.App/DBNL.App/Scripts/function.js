// JavaScript Document

function TestTelephone(telString)
{
    for(var i=0;i<telString.length;i++)
    {
        if(telString[i]!=' ')
        {
            if((telString[i]> '9' || telString[i]<'0'))
            {
                return false;
            }
        }
    }
    return true;
}
function Pop_ShowWindow(strLinkImage)
{
	window.open("showimg.php?link="+strLinkImage);
	}
function MenuChange(strId, strImg)
{
	var img = document.getElementById(strId);
	img.src = strImg;
}
function CheckForm(frm){//fileupload
	var flag=0;
	for(i=0;i<frm.length;i++){
		if(frm.elements[i].name != 'img' && frm.elements[i].value.length==0){		
			flag=1;
			frm.elements[i].style.backgroundColor="#CCCCCC";
		}		
		else
			frm.elements[i].style.backgroundColor="white";
	}
	email = document.getElementById('email');
	if(email.value.indexOf("@")<0){
		email.style.backgroundColor="#CCCCCC";
		flag=1;
	}
	if(flag == 0)
		return true;
	alert('Please check the empty field!');
	return false;
}
function CheckSearch(frm){
	var type = document.getElementById('typeNews');
	if(type.checked==true){
		frm.elements['do'].value = "news";				
	}
	alert(frm.elements['do'].value);
	return false;
}

function ChangeImg(url){
	document.getElementById("largeImg").src = url;
}
//Enter domain of site to search.
var domainroot="dongloi.com.vn";

function Gsitesearch(curobj){
	curobj.q.value="site:"+domainroot+" "+curobj.qfront.value;
}
function SendLink(cur_link){
	var r = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
	var email = document.getElementById('mailToFriend');	
	if(r.test(email.value)==false){
		alert( "Email không đúng định dạng" );
		email.focus();
		flag = 1;
	}
	else{
		xmlHttp=GetXmlHttpObject();
		if (xmlHttp==null)
		  {
		  alert ("Browser does not support HTTP Request");
		  return;
		  }
		var url="ajax/SendLink.php";
		url=url+ "?email=" + document.getElementById('mailToFriend').value;
		url=url+ "&url=" + cur_link;
		//alert(url);
		xmlHttp.onreadystatechange=ReadySendLink ;
		xmlHttp.open("GET",url,true);
		xmlHttp.send(null);
	
	}
}
function ReadySendLink(){
	if (xmlHttp.readyState==4 || xmlHttp.readyState=="complete")
	{
		alert(xmlHttp.responseText);
	}
}