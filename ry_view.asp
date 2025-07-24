<!--#include file="conn.asp"--->
<%id=FilterSql(request("id"),2)

menubt="honor"
set rs=server.CreateObject("adodb.recordset")
sql="update ry set djs=djs+1 where id="&id&""
cn.execute sql
rs.open"select * from ry where id="&id&"",cn,1,3
lb_id=rs("lb_id")

if lb_id<>"" then
set rslb=server.CreateObject("adodb.recordset")
rslb.open"select * from rylb where id="&lb_id&"",cn,1,3
lbmc="<a href='ry.asp?lb_id="&lb_id&"'>"&rslb("lb")&"</a> > "
lbma=rslb("lb")
enlbma=rslb("enlb")
end if
%>

<!DOCTYPE html>
<html lang="zh">
        <head>
        <meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
        <meta http-equiv="X-UA-Compatible" content="IE=Edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=rs("s1")%>_<%=title%></title>
<meta name="keywords" content="<%=rs("s1")%>_<%=gjz%>" />
<meta name="description" content="<%=rs("s1")%>_<%=ms%>" />
        <link rel="stylesheet" type="text/css" href="css/css.css" />
        <!--#include file="head.asp"--->
        <link href="css/BigRed/inner.css"  rel="stylesheet" type="text/css" />
        <link href="css/BigRed/common.css"  rel="stylesheet" type="text/css" />
        <link href="css/BigRed/clearbox.css"  rel="stylesheet" type="text/css" />
        <script type="text/javascript" src="js/submodalsource.js" ></script>
        <script type="text/javascript" src="js/functions.js" ></script>
        <script type="text/javascript" src="js/clearbox.js"  ></script>
        <script type="text/javascript" src="images/iepng/iepngfix_tilebg.js" ></script>
        <script type="text/javascript">  
function  addFav() {   //加入收藏夹   
             if  (document.all) {   
                window.external.addFavorite('acp_view.asp?id=<%=id%>', '<%=rs("cpmc")%>');   
            }   
             else   if  (window.sidebar) {   
            window.sidebar.addPanel('<%=rs("cpmc")%>', 'acp_view.asp?id=<%=id%>',  "" );   
            }   
        }   
  
        </script>
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
              <!--right start-->
              <div class="right">
        <div class="Position"><span>你的位置：<a href="index.asp" >首页</a> > <a href="acpzs.asp" >公司产品</a> > <a href="acpzs.asp?dlb_id=<%=dlb_id%>" ><%=dlb%></a></span></div>
        <div class="HeightTab clearfix"></div>
        <!--main start-->
        <div class="main"> 
                  
                  <!--content start-->
                  <div class="content">
            <div class="ProInfo"><h1 align="center"><%=rs("s1")%></h1>
            <p style=" text-align:center; margin:20px auto">
            <img src="<%=rs("dtpdz")%>" style=" max-width:700px; max-height:550px;" /></p>
                      
                                <div class="clearfix"></div>
                    </div>
            <div class="maincontent clearfix">
                      <div class="IntroTitle">背景介绍</div>
                      <%=rs("s2")%> </div>
            <div class="IntroTitle">更多专利</div>
            <div class="MorePro">
                      <%
set rsf=server.CreateObject("adodb.recordset")
rsf.open"select top 3 * from ry   order by px desc, id desc",cn,1,3
for f=1 to rsf.recordcount
%>
                      <div class='albumblock'>
                <div class='inner'><A href='ry_view.asp?id=<%=rsf("id")%>'   title='<%=rsf("s1")%>'><img src="<%=rsf("tpdz")%>"  width='139' height='139'/>
                  <div class='albumtitle'><%=rsf("s1")%></div>
                  </a></div>
              </div>
                      <%rsf.movenext
next
rsf.close
set rsf=nothing
%>
                    </div>
          </div>
                </div>
        <!--content end--> 
         <div class="HeightTab clearfix"></div>
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