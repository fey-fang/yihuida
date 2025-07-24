<!--#include file="conn.asp"--->
<%id=FilterSql(request("id"),2)
set  rsgs=server.CreateObject("adodb.recordset")
rsgs.open"select * from gsxmnr where id="&id&"",cn,1,3
aa=rsgs("leixing")
if aa="1" then
menubt="gsjj"
end if
if aa="6" then
menubt="support"
end if
if aa="5" then
menubt="contact"
end if%>

<%if FilterSql(rsgs("Seotit"),1)<>"" then title=rsgs("Seotit") else title=rsgs("gsxm")&"-"& title end if %>
<%if FilterSql(rsgs("seokey"),1)<>"" then  gjz=rsgs("Seokey")  else  gjz=rsgs("gsxm")&"-"& gjz  end if %>
<%if FilterSql(rsgs("seoms"),1)<>"" then ms=rsgs("seoms") else ms=rsgs("gsxm")&"-"& ms end if %>
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
    <div id="InnerBanner"> </div>
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
rsdl.open"select * from gsxmnr where leixing='"&aa&"' order by id asc",cn,1,3
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

<%if aa=1 then%>
<li class='active'><a href='ry.asp' >专利证书</a> </li>
<%end if%>
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
        <div class="Position"><span>你的位置：<a href="index.asp" >首页</a> > <a href="gsjj.asp?id=3" >关于公司</a> > <%=rsgs("gsxm")%></span></div>
        <div class="HeightTab clearfix"></div>
        <!--main start-->
        <div class="main"> 
          
          <!--content start-->
          <div class="content">
            <div class="maincontent clearfix">
             <%=rsgs("gsxmnr")%>
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