<!--#include file="conn.asp"--->
<% xwlb_id=FilterSql(request("xwlb_id"),2)
if xwlb_id<>"" then
xwlb_idaa=xwlb_id
else
xwlb_idaa=0
end if
if xwlb_id<>"" then
set rs1=server.CreateObject("adodb.recordset")
rs1.open"select * from bxwlb where id="&xwlb_id,cn,1,3
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from bxw where xwlb_id="&xwlb_id&" order by tjsj desc",cn,1,3
else
set rs=server.CreateObject("adodb.recordset")
rs.open"select * from bxw  order by id desc",cn,1,3
end if
dim pages,cur_recordcounts
pages=clng(request.QueryString("pages"))
rs.pagesize=15
if not rs.eof then
 if pages=0 then
 pages=1
  else
  rs.move(pages-1)*rs.pagesize
  end if
 if pages<rs.pagecount then
  cur_recordcounts=rs.pagesize
  else
   cur_recordcounts=rs.recordcount-(pages-1)*rs.pagesize
   end if
end if

if xwlb_id<>"" then
xwlbmc="<a href='bxw_list.asp?xwlb_id="&xwlb_id&"'>"&rs1("xwlb")&"</a> > "
xx=rs1("xwlb")
enxx=rs1("enxwlb")
else
xx="新闻中心"
enxx="News"
end if

if rs.recordcount mod rs.pagesize=0 then
  cur_c= rs.recordcount \ rs.pagesize
else
  cur_c= rs.recordcount \ rs.pagesize+1
end if

menubt="news"
%>

<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=xx%>_<%=title%></title>
<meta name="keywords" content="<%=xx%>_<%=gjz%>" />
<meta name="description" content="<%=xx%>_<%=ms%>" />
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
        <div class="Position"><span>你的位置：<a href="index.asp" >首页</a> > <a href="bxw_list.asp"  >人才招聘</a>    <a href="bxw_list.asp?xwlb_id=<%=xwlb_id%>"  ></a></span></div>
        <div class="HeightTab clearfix"></div>
        <!--main start-->
        <div class="main">
          <div class="ArticleList">
            <table  width="100%" border="0" cellspacing="0" cellpadding="0">
              <ul>
              <%for i=1 to cur_recordcounts%> 
                <tr>
                  <td width='90%' class='fw_t'><a href="bxw_view.asp?id=<%=rs("id")%>" title="<%=rs("xwbt")%>"><%=rs("xwbt")%></a></td>
                  <td width='10%' class='fw_s'>[<%=formatdate(rs("tjsj"),1)%>]</td>
                </tr>
                <%rs.movenext
next%>
              
              </ul>
           
            </table>
            <div class="clearfix"></div>
            <div class="">
          <ul class="pagination">
<%if cur_c>1 then
if pages=1 then
Response.Write"<li><a> << </a></li>"
else
Response.Write"<li><a href=""bxw_list.asp?pages=1&xwlb_id="&xwlb_id&"""> << </a></li>"
end if

if pages>1 then
response.Write"<li><a href=""bxw_list.asp?pages="&pages-1&"&xwlb_id="&xwlb_id&""" > < </a></li>"
else
Response.Write"<li><a> < </a></li>"
end if

if pages<=rs.pagecount-5 then
start=pages-5
else
start=rs.pagecount-10
end if
if start<=0 then start=1
for i=start to rs.pagecount 
if i=pages then
response.Write"<li class=""thisclass""><a>"&i&"</a></li>" 
else 
if i<start+11 then
response.Write"<li><a href=""bxw_list.asp?pages="&i&"&xwlb_id="&xwlb_id&""" title="""&i&""">"&i&"</a></li>"
else
exit for
end if
end if
next 


if pages<rs.pagecount then
response.Write"<li><a href=""bxw_list.asp?pages="&pages+1&"&xwlb_id="&xwlb_id&""" > > </a></li>"
else
Response.Write"<li><a> > </a></li>"
end if

if pages=cur_c then
Response.Write"<li><a> >> </a></li>"
else
Response.Write"<li><a href=""bxw_list.asp?pages="&cur_c&"&xwlb_id="&xwlb_id&"""> >> </a></li>"
end if%>
<%end if%>
          </ul>
        </div>
        
            <!---div class='t_page ColorLink'>总数：55条&nbsp;&nbsp;当前页数：<span class='FontRed'>1</span>/3</div--->
          </div>
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