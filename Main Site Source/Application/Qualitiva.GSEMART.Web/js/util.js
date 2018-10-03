function confirmMsg(strMsg)
{
    var r = confirm(strMsg);
    return r;
}

function cancelMsg()
{
    var r = confirm('Are you sure you want to cancel and lose any unsaved data?If Yes click on OK else click on Cancel.');
    return r;
}

function redirectTo(fileName)
{
    window.location.href=fileName;
    return false;
}

function imposeMaxLength(Object, MaxLen,countId)
{
    if (Object.value.length > MaxLen) 
    {
        Object.value = Object.value.substring(0, MaxLen);
    }
    else
    {
        document.getElementById(countId).innerText = MaxLen - Object.value.length;
    }
}

//used in wplan screens
function displayDayInfo(jobDesc,startDate,endDate,custDetails,eqpDetails,status){
    document.getElementById('divJobInfo').innerText = ''+jobDesc+'\nStart Date:'+startDate+'\nEnd Date:'+endDate+'\nCustomer:'+custDetails+'\nEquipment:'+eqpDetails+'\nStatus:'+status+'';
}
function clearInfo(){
    document.getElementById('divJobInfo').innerText = '';
}

//Used in Visit Calendar Screen
function displayVisitInfo(){
    document.getElementById('divVisitInfo').style.display='block';
}
function clearVisitInfo(){
    document.getElementById('divVisitInfo').style.display='none';
}


//Expand collapse functions
function showHideDiv(strDivId,blnShow) //
{        
	var div = document.getElementById(strDivId);
	if(blnShow)
	 {
	    div.style.display='block';
	 }
	 else
	 {
	     div.style.display='none';
	 }
}

//Expand collapse functions
function toggleDiv(strDivId,btnName) //
{        
	var div = document.getElementById(strDivId);
	var btn = document.getElementById(btnName);

	if(div.style.display=='block')
	 {
	    div.style.display='none';
	    btn.innerText = 'Expand';
	 }
	 else
	 {
	     div.style.display='block';
	      btn.innerText = 'Collapse';
	 }
}

//Tab functions
function toggleDivTab(ulID,liID,strDivId,hdnValue)
{   
     
    var li = document.getElementById(liID);
	var div = document.getElementById(strDivId);
	
	
	var i;
	
	var TabHdnNo = ulID.substr(ulID.length-1);
	
	var hdn = document.getElementById("ctl00_MainContent_hdnTab"+TabHdnNo);
	
	
	var divIDs=document.forms[0].getElementsByTagName("div")

	    for (i=0; i<divIDs.length; i++)
        {
            if (divIDs.item(i).id.indexOf("divTab"+TabHdnNo+"_") > 0 )
            {
            
                var divTemp = document.getElementById(divIDs.item(i).id);
                divTemp.style.display='none';
            }
        }

        var listEl = document.getElementById(ulID).getElementsByTagName("li");
		
	    for (i=0; i<listEl.length; i++)
	    {
		listEl[i].className = '';
	    }
	
	     div.style.display='block';
	     li.className='ActiveTab';
	     hdn.value=hdnValue;
	
}

//Listbox functions
function copyToList(from,to)
{
	fromList = eval('document.forms[0].' + from);
	toList = eval('document.forms[0].' + to);
	if (toList.options.length > 0 && toList.options[0].value == 'temp')
	{
		toList.options.length = 0;
	}
	var sel = false;
	for (i=0;i<fromList.options.length;i++)
	{
		var current = fromList.options[i];
		if (current.selected)
		{
			sel = true;
			if (current.value == 'temp')
			{
				alert ('You cannot move this text!');
				return;
			}
			txt = current.text;
			val = current.value;
			toList.options[toList.length] = new Option(txt,val);
			fromList.options[i] = null;
			i--;
		}
	}
	if (!sel) alert ('Please select a option to move.');
}

function moveAll(from,to){
fromList = eval('document.forms[0].' + from);
	toList = eval('document.forms[0].' + to);
	if (toList.options.length > 0 && toList.options[0].value == 'temp')
	{
		toList.options.length = 0;
	}
	var sel = false;
	for (i=0;i<fromList.options.length;i++)
	{
		var current = fromList.options[i];
			sel = true;
			if (current.value == 'temp')
			{
				alert ('You cannot move this text!');
				return;
			}
			txt = current.text;
			val = current.value;
			toList.options[toList.length] = new Option(txt,val);
			fromList.options[i] = null;
			i--;
		}
	if (!sel) alert ('You haven\'t selected any options!');
}
function allSelect()
{
  List = document.forms[0].chosen;
  if (List.length && List.options[0].value == 'temp') return;
  for (i=0;i<List.length;i++)
  {
     List.options[i].selected = true;
  }
}