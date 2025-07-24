<!--#include file="conn.asp"--->
<%id=FilterSql(request("id"),2)
if id<>"" then
set rs=server.CreateObject("adodb.recordset")
sql="update ccp set djs=djs+1 where id="&id&""
cn.execute sql
rs.open"select * from ccp where id="&id&"",cn,1,3
dlb_id=rs("dlb_id")
xlb_id=rs("xlb_id")
if dlb_id<>"" then
set rsdlb=server.CreateObject("adodb.recordset")
rsdlb.open"select * from cdlb where id="&dlb_id&"",cn,1,3
dlb=rsdlb("dlb")
endlb=rsdlb("endlb")
dl=" > <a href='wt.asp?dlb_id="&dlb_id&"' title='"&dlb&"'>"&dlb&"</a>"
end if
if xlb_id<>"0" then
set rsdlb=server.CreateObject("adodb.recordset")
rsdlb.open"select * from axlb where id="&xlb_id&"",cn,1,3
xlb=rsdlb("xlb")
enxlb=rsdlb("enxlb")
xl=" > <a href='wt.asp?dlb_id="&dlb_id&"&xlb_id="&xlb_id&"' title='"&dlb&"'>"&dlb&"</a>"
end if
end if
menubt="cpzs"
%>
<%if FilterSql(rs("Seotit"),1)<>"" then title=rs("Seotit") else title=rs("cpmc")&"-"& title end if %>
<%if FilterSql(rs("seokey"),1)<>"" then  gjz=rs("Seokey")  else  gjz=rs("cpmc")&"-"& gjz  end if %>
<%if FilterSql(rs("seoms"),1)<>"" then ms=rs("seoms") else ms=rs("cpmc")&"-"& ms end if %>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
    <title><%=title%></title>
        <meta name="keywords" content="<%=gjz%>" />
        <meta name="description" content="<%=ms%>" />
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
           <div class="topic">技术支持&nbsp;&nbsp;&nbsp;Support</div>
          <div class="blank">
            <ul>
<li ><a href="wt.asp"   class="on" >常见问题</a> </li>
    <li ><a href="xz.asp" >下载中心</a> </li>

            </ul>
          </div>
        </div>
        <div class="HeightTab clearfix"></div>
        <!--#include file="leftxw.asp"---> 
        <!--#include file="leftlx.asp"---> 
        
      </div>
<!--left end-->
<!--right start-->
<div class="right">
 <div class="Position"><span>你的位置：<a href="index.asp" >首页</a> > <a href="wt.asp"  >技术支持</a>  >  <a href="wt.asp?dlb_id=<%=xwlb_id%>"  >常见问题</a></span></div>
<div class="HeightTab clearfix"></div>
<!--main start-->
<div class="main">

<!--content start-->
<div class="content">
<div class="title"><h3><%=rs("cpmc")%></h3></div>
<div class="infos"><%=rs("tjsj")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击：<%=555+rs("djs")%></div>
<div class="maincontent clearfix">
<%=rs("cptpjqsm")%>
</div>


<div class="prenext">
<ul><li><%sql1="select top 1 * from ccp where id > " & ID & "  order by id asc"
Set rs11= Server.CreateObject("ADODB.Recordset")
rs11.open sql1,cn,1,3
if rs11.eof or rs11.bof then
%>       
上一篇：没有了
    <%else%>
上一篇：<a href='wt_view.asp?id=<%=rs11("id")%>' title='<%=rs11("cpmc")%>'><%=rs11("cpmc")%></a>
<%end if%> </li>


<li><%sql2="select top 1 * from ccp where id <" & ID & "  order by id desc"
Set rs2= Server.CreateObject("ADODB.Recordset")
rs2.open sql2,cn,1,3
if rs2.eof then
%>
下一篇：没有了
<%else%>
下一篇：<a href='wt_view.asp?id=<%=rs2("id")%>' title='<%=rs2("cpmc")%>'><%=rs2("cpmc")%></a>
<%end if%></li></ul>
</div>

</div>

</div>
<!--content end-->

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