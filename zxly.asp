<!--#include file="conn.asp"--->
<%fbi=request("fbi")
aa="1"
if fbi="tj" then
if request("yzm")="" then
response.Write"<script>alert('�Բ�����֤�벻��Ϊ��');history.back();</script>"
response.End()
end if
if not isnumeric(request.form("yzm")) then
response.Write "<script LANGUAGE='javascript'>alert('�ύʧ�ܣ���֤����������֣�����ȷ��д��');history.go(-1);</script>"
response.end
end if
on error resume next
yzm=Cint(request.form("yzm"))


if yzm<>Session("GetCode") then
response.Write "<script LANGUAGE='javascript'>alert('�ύʧ�ܣ���֤�����');history.go(-1);</script>"
response.end
end if
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from zxly",cn,1,3
rs.addnew
rs("s1")=request("s1")
rs("s2")=request("s2")
rs("s3")=request("s3")
rs("s4")=request("s4")
rs("s5")=request("s5")
rs("s6")=request("s6")
rs("s7")=request("s7")
rs("s8")=request("s8")
rs("s9")=request("s9")
rs("s10")=request("s10")
rs("tjsj")=now()
rs.update
rs.close
set rs=nothing
cn.close
set cn=nothing

url="zxly.asp"
response.write "<br><br><br><center><font size=-1>�ύ�ɹ�,��ҳ1���Ӻ󷵻�.<br><br>лл��ʹ�ñ�ϵͳ</font></center>"
response.write "<meta http-equiv=refresh content=2;url=" & url & ">"
response.end

end if

menubt="feedback"
%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>��������_<%=title%></title>
<meta name="keywords" content="��������_<%=gjz%>" />
<meta name="description" content="��������_<%=ms%>" />
<link rel="stylesheet" type="text/css" href="css/css.css" />
<!--#include file="head.asp"--->
<link href="css/BigRed/inner.css"  rel="stylesheet" type="text/css" />
<link href="css/BigRed/common.css"  rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/functions.js" ></script>
<script type="text/javascript" src="images/iepng/iepngfix_tilebg.js" ></script>
</head>

<body>

<div id="wrapper"> 
  <!--#include file="top.asp"--->
  
<!--body start-->
<div id="body">
<!--focus start-->
<div id="InnerBanner">

</div>
<!--foncus end-->
<div class="HeightTab clearfix"></div>
<!--inner start -->
<div class="inner">
<!--left start-->
<div class="left">
        <div class="Sbox">
          <div class="topic">���ڹ�˾&nbsp;&nbsp;&nbsp;About</div>
          <div class="blank">
            <ul>
<%set rsdl=server.CreateObject("adodb.recordset")
rsdl.open"select * from gsxmnr where leixing='1' order by id asc",cn,1,3
for y=1 to rsdl.recordcount
if cinta(id)=cinta(rsdl("id")) then
ca="active"
else
ca=""
end if%>
				<li class='<%=ca%>'><a href='gsjj.asp?id=<%=rsdl("id")%>' ><%=rsdl("gsxm")%></a> </li>
<%rsdl.movenext
next
rsdl.close
set rsdl=nothing%> 
            </ul>
          </div>
        </div>
        <div class="HeightTab clearfix"></div>
             <!--#include file="leftlx.asp"--->
        
        
      </div>
<!--left end-->
<!--right start-->
<div class="right">
<div class="Position"><span>���λ�ã�<a href="index.htm" >��ҳ</a> > �ͻ�����</span></div>
<div class="HeightTab clearfix"></div>
<!--main start-->
<div class="main">

<!--FeedBack start-->
<div class="FeedBack">

<p align='center'> </p>
<div class="clearfix"></div>


<div class="IntroTitle clearfix">��������</div>
<div class="commentbox">
<form  name="form1" method="post" action="zxly.asp?fbi=tj">
  <table id="commentform" width="600" border="0" align="center" cellpadding="0" cellspacing="0">
    <tr>
      <td>����</td>
      <td><input name='s1' type='text' id='name' size='30' maxlength="30"><span class="FontRed">*</span></td>
    </tr>
    <tr>
      <td>�����ʼ�</td>
      <td><input name='s2' type='text' id='email' size='30' maxlength="80"></td>
    </tr>
    <tr>
      <td>QQ</td>
      <td><input name='s3' type='text' id='qq' size='30' maxlength="30"></td>
    </tr>	
    <tr>
      <td>��������</td>
      <td>
        <textarea name="s4" cols="60" rows="7"  value="" ></textarea>
            <span class="FontRed">*</span></td>    </tr>
    <tr>
      <td>��֤��</td>
      <td><input name="yzm"  maxLength=5 size=10 > <span class="FontRed">*</span><img src="code.asp"  width="55"  onclick="this.src=this.src+'?'" alt="ͼƬ�����壿������µõ���֤��" style="cursor:hand;"> </td>
    </tr>	
    <tr>
      <td>&nbsp;</td>
      <td><input class="Cbutton" type="submit" value=" �������� " onClick='javascript:return comment_check()'></td>
    </tr>
  </table>
</form>
</div>

</div>
<!--FeedBack end-->

</div>
<!--main end-->
</div>
<!--right end-->
</div>
<!--inner end-->
</div>
<!--body end-->


  <!--#include file="bottom.asp"---> 
</div>
</body>
</html>