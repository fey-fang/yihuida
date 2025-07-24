<!--#include file="conn.asp"--->
<%
dlb_id=FilterSql(request("dlb_id"),2)
xlb_id=FilterSql(request("xlb_id"),2)
key=FilterSql(request("key"),1)
if key<>"" then
set rsyy=server.CreateObject("adodb.recordset")
rsyy.open"select * from acp where cpmc like '%"&key&"%' order by px desc,id desc",cn,1,3
else
if dlb_id="" and xlb_id="" then
set rsyy=server.CreateObject("adodb.recordset")
rsyy.open"select * from acp order by px desc,id desc",cn,1,3
end if
if dlb_id<>"" then
set rsyy=server.CreateObject("adodb.recordset")
rsyy.open"select * from acp where dlb_id="&dlb_id&"  order by px desc,id desc",cn,1,3
end if
if xlb_id<>"" then
set rsyy=server.CreateObject("adodb.recordset")
rsyy.open"select * from acp where xlb_id="&xlb_id&"  order by px desc,id desc",cn,1,3
end if
end if
dim pages,cur_recordcounts
pages=clng(request.QueryString("pages"))
rsyy.pagesize=9
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
if dlb_id<>"" and xlb_id="" then
set rsdlb=server.CreateObject("adodb.recordset")
rsdlb.open"select * from adlb where id="&dlb_id&"",cn,1,3
aa=rsdlb("dlb")
enaa=rsdlb("endlb")
end if
if dlb_id<>"" and xlb_id<>"" then
set rsxlb=server.CreateObject("adodb.recordset")
rsxlb.open"select * from axlb where id="&xlb_id&"",cn,1,3
aa=rsxlb("xlb")
enaa=rsxlb("enxlb")
end if
if dlb_id="" and xlb_id="" then
aa="产品展示"
enaa="Product"
bb=""
end if
menubt="cpzs"
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
      <div class="left"> 
        <!--#include file="acpleft.asp"---> 
        <!--#include file="leftxw.asp"---> 
        <!--#include file="leftlx.asp"---> 
        
      </div>
      <!--left end--> 
      <!--right start-->
      <div class="right">
        <div class="Position"><span>你的位置：<a href="index.htm" >首页</a> > <a href="index.htm" >公司产品</a></span></div>
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
                      <div class='inner'><a href="acp_view.asp?id=<%=rsyy("id")%>" title="<%=rsyy("cpmc")%>"><img src="<%=rsyy("tpdz")%>" alt="<%=rsyy("cpmc")%>" />
                        <div class='albumtitle'><%=rsyy("cpmc")%></div>
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
Response.Write"<li><a href=""acpzs.asp?pages=1&dlb_id="&dlb_id&"&xlb_id="&xlb_id&"&key="&key&"""> << </a></li>"
end if

if pages>1 then
response.Write"<li><a href=""acpzs.asp?pages="&pages-1&"&dlb_id="&dlb_id&"&xlb_id="&xlb_id&"&key="&key&""" > < </a></li>"
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
response.Write"<li><a href=""acpzs.asp?pages="&i&"&dlb_id="&dlb_id&"&xlb_id="&xlb_id&"&key="&key&""" title="""&i&""">"&i&"</a></li>"
else
exit for
end if
end if
next 


if pages<rsyy.pagecount then
response.Write"<li><a href=""acpzs.asp?pages="&pages+1&"&dlb_id="&dlb_id&"&xlb_id="&xlb_id&"&key="&key&""" > > </a></li>"
else
Response.Write"<li><a> > </a></li>"
end if

if pages=cur_c then
Response.Write"<li><a> >> </a></li>"
else
Response.Write"<li><a href=""acpzs.asp?pages="&cur_c&"&dlb_id="&dlb_id&"&xlb_id="&xlb_id&"&key="&key&"""> >> </a></li>"
end if
end if
%>
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