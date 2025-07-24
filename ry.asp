<!--#include file="conn.asp"--->
<%
lb_id=FilterSql(request("lb_id"),2)

if lb_id<>"" then
set rsyy=server.CreateObject("adodb.recordset")
rsyy.open"select * from ry where lb_id="&lb_id&" order by px desc,id desc",cn,1,3

set rsaa=server.CreateObject("adodb.recordset")
rsaa.open"select * from rylb where id="&lb_id&"",cn,1,3
lbmcaa=" > <a href='ry.asp?lb_id="&rsaa("id")&"'>"&rsaa("lb")&"</a>"

else
set rsyy=server.CreateObject("adodb.recordset")
rsyy.open"select * from ry order by px desc,id desc",cn,1,3
end if


dim pages,cur_recordcounts
pages=clng(request.QueryString("pages"))
rsyy.pagesize=12
if not rsyy.eof then
 if pages=0 then
 pages=1
  else
  rsyy.move(pages-1)*rsyy.pagesize
  end if
 if pages<rsyy.pagecount then
  cur_recordcounts=rsyy.pagesize
  else
   cur_recordcounts=rsyy.recordcount-(pages-1)*rsyy.pagesize
   end if
end if
if rsyy.recordcount mod rsyy.pagesize=0 then
  cur_c= rsyy.recordcount \ rsyy.pagesize
else
  cur_c= rsyy.recordcount \ rsyy.pagesize+1
end if
aa="专利证书"
enaa="Case"
menubt="honor"
%>


<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=aa%>_<%=title%></title>
<meta name="keywords" content="<%=aa%>_<%=gjz%>" />
<meta name="description" content="<%=aa%>_<%=ms%>" />
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
ca=""
else
ca=""
end if%>
				<li class='<%=ca%>'><a href='gsjj.asp?id=<%=rsdl("id")%>' ><%=rsdl("gsxm")%></a> </li>
<%rsdl.movenext
next
rsdl.close
set rsdl=nothing%> 
<li class='active'><a href='ry.asp' >专利证书</a> </li>
            </ul>
          </div>
        </div>
        <div class="HeightTab clearfix"></div>
       <!--#include file="leftxw.asp"--->
        <!--#include file="leftlx.asp"--->
        
        
      </div>
      <!--left end--> 
      <!--left end--> 
      <!--right start-->
      <div class="right">
        <div class="Position"><span>你的位置：<a href="index.asp" >首页</a> > <a href="gsjj.asp?id=3" >关于公司</a> > <a href="ry.asp" >专利证书</a></span></div>
        <div class="HeightTab clearfix"></div>
        <!--main start-->
        <div class="main"> 
          
          <!--content start-->
          <div class="content">
            <div class="MorePro">
              <div class="CaseBlock">
                <ul>
                  <ul>
<%for i=1 to cur_recordcounts%>
                    <div class='albumblock'>
                      <div class='inner'><a href="ry_view.asp?id=<%=rsyy("id")%>" title="<%=rsyy("s1")%>"><img src="<%=rsyy("tpdz")%>" alt="<%=rsyy("s1")%>" /></a>
                        <div class='albumtitle'><%=rsyy("s1")%></div>
                        </a></div>
                    </div>
          <%rsyy.movenext
          next%>
                   
                    
                  </ul>
                </ul>
              </div>
              <div class="clearfix"></div>
              <div class='t_page9 ColorLink9'>
 <div class="">
        <ul class="pagination">
<%if cur_c>1 then
if pages=1 then
Response.Write"<li><a> << </a></li>"
else
Response.Write"<li><a href=""ry.asp?pages=1&lb_id="&lb_id&"""> << </a></li>"
end if

if pages>1 then
response.Write"<li><a href=""ry.asp?pages="&pages-1&"&lb_id="&lb_id&"""  > < </a></li>"
else
Response.Write"<li><a> < </a></li>"
end if

if pages<=rsyy.pagecount-5 then
start=pages-5
else
start=rsyy.pagecount-10
end if
if start<=0 then start=1
for i=start to rsyy.pagecount 
if i=pages then
response.Write"<li class=""thisclass""><a>"&i&"</a></li>" 
else 
if i<start+11 then
response.Write"<li><a href=""ry.asp?pages="&i&"&lb_id="&lb_id&""" title="""&i&""">"&i&"</a></li>"
else
exit for
end if
end if
next 


if pages<rsyy.pagecount then
response.Write"<li><a href=""ry.asp?pages="&pages+1&"&lb_id="&lb_id&""" > > </a></li>"
else
Response.Write"<li><a> > </a></li>"
end if

if pages=cur_c then
Response.Write"<li><a> >> </a></li>"
else
Response.Write"<li><a href=""ry.asp?pages="&cur_c&"&lb_id="&lb_id&"""> >> </a></li>"
end if
end if%>
        </ul>
      </div>
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