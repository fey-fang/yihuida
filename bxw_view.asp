<!--#include file="conn.asp"--->
<%id=cint(trim(request("id")))

menubt="news"
set rsxw1=server.CreateObject("adodb.recordset")
sql="update bxw set djs=djs+1 where id="&id&""
cn.execute sql
rsxw1.open"select * from bxw where id="&id&"",cn,1,3

xwlb_id=rsxw1("xwlb_id")
xwlb_idaa=rsxw1("xwlb_id")

if xwlb_id<>"" then
set rs1=server.CreateObject("adodb.recordset")
rs1.open"select * from bxwlb where id="&xwlb_id&"",cn,1,3
xwlb=rs1("xwlb")
enxwlb=rs1("enxwlb")
end if
%>
<%if FilterSql(rsxw1("Seotit"),1)<>"" then title=rsgs("Seotit") else title=rsgs("gsxm")&"-"& title end if %>
<%if FilterSql(rsxw1("seokey"),1)<>"" then  gjz=rsgs("Seokey")  else  gjz=rsgs("gsxm")&"-"& gjz  end if %>
<%if FilterSql(rsxw1("seoms"),1)<>"" then ms=rsgs("seoms") else ms=rsgs("gsxm")&"-"& ms end if %>

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
          <div class="topic">关于公司&nbsp;&nbsp;&nbsp;About</div>
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
        <!--#include file="leftxw.asp"---> 
        <!--#include file="leftlx.asp"---> 
        
      </div>
<!--left end-->
<!--right start-->
<div class="right">
<div class="Position"><span>你的位置：<a href="index.asp" >首页</a> > <a href="bxw_list.asp"  >人才招聘</a> </span></div>
<div class="HeightTab clearfix"></div>
<!--main start-->
<div class="main">

<!--content start-->
<div class="content">
<div class="title"><h3><%=rsxw1("xwbt")%></h3></div>
<div class="infos"><%=rsxw1("tjsj")%>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;点击：<%=555+rsxw1("djs")%></div>
<div class="maincontent clearfix">
<%=rsxw1("xwnr")%>
</div>


<div class="prenext">
<ul><li><%sql1="select top 1 * from bxw where id > " & ID & " and xwlb_id="&xwlb_id&" order by id asc"
Set rs11= Server.CreateObject("ADODB.Recordset")
rs11.open sql1,cn,1,3
if rs11.eof or rs11.bof then
%>       
上一篇：没有了
    <%else%>
上一篇：<a href='bxw_view.asp?id=<%=rs11("id")%>' title='<%=rs11("xwbt")%>'><%=rs11("xwbt")%></a>&nbsp;&nbsp;<span class='ListDate'><%=formatdate(rs11("tjsj"),1)%></span>
<%end if%> </li>


<li><%sql2="select top 1 * from bxw where id <" & ID & " and xwlb_id="&xwlb_id&" order by id desc"
Set rs2= Server.CreateObject("ADODB.Recordset")
rs2.open sql2,cn,1,3
if rs2.eof then
%>
下一篇：没有了
<%else%>
下一篇：<a href='bxw_view.asp?id=<%=rs2("id")%>' title='<%=rs2("xwbt")%>'><%=rs2("xwbt")%></a>  <span class='ListDate'><%=formatdate(rs2("tjsj"),1)%></span>
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