//onclick="javascript:window.open('forgetPassword.aspx','ForgetPassword','height=120,width=400,resizable=no,status=no,left=200,top=150');"
function openWindow(url, intType) // method to open a popup window onclicking a button on the parent window 
{
	var newWindow, intWidth, intHeight,strWindowProp;
	intComplexType = intType;
    strWindowProp = "scrollbars=no,resizable=no,status=no,toolbar=no,menubar=no,location=no,directories=no";
	switch(intType){
		case 1000: intWidth = 400; intHeight = 120; break; // for forgot password
		
	}
    var props =  strWindowProp + ",width=" + intWidth + ",height=" + intHeight + ",left=200,top=150";
	newWindow = window.open(url, "new_win", props);	
}
