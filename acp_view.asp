<!--#include file="conn.asp"--->
<%id=FilterSql(request("id"),2)
if id<>"" then
set rs=server.CreateObject("adodb.recordset")
sql="update acp set djs=djs+1 where id="&id&""
cn.execute sql
rs.open"select * from acp where id="&id&"",cn,1,3
dlb_id=rs("dlb_id")
xlb_id=rs("xlb_id")
if dlb_id<>"" then
set rsdlb=server.CreateObject("adodb.recordset")
rsdlb.open"select * from adlb where id="&dlb_id&"",cn,1,3
dlb=rsdlb("dlb")
endlb=rsdlb("endlb")
dl=" > <a href='acpzs.asp?dlb_id="&dlb_id&"' title='"&dlb&"'>"&dlb&"</a>"
end if
if xlb_id<>"0" then
set rsdlb=server.CreateObject("adodb.recordset")
rsdlb.open"select * from axlb where id="&xlb_id&"",cn,1,3
xlb=rsdlb("xlb")
enxlb=rsdlb("enxlb")
xl=" > <a href='acpzs.asp?dlb_id="&dlb_id&"&xlb_id="&xlb_id&"' title='"&dlb&"'>"&dlb&"</a>"
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
        <!--#include file="acpleft.asp"---> 
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
            <div class="ProInfo"><h1 align="center"><%=rs("cpmc")%></h1>
            <p style=" text-align:center; margin:20px auto">
            <img src="<%=rs("dtpdz")%>" style=" max-width:700px; max-height:550px;" /></p>
                      
                                <div class="clearfix"></div>
                    </div>
            <div class="maincontent clearfix">
                      <div class="IntroTitle">产品介绍</div>
                      <%=rs("cptpjqsm")%> </div>
            <div class="IntroTitle">更多产品</div>
            <div class="MorePro">
                      <%
set rsf=server.CreateObject("adodb.recordset")
rsf.open"select top 3 * from acp where dlb_id="& dlb_id &"  order by px desc, id desc",cn,1,3
for f=1 to rsf.recordcount
%>
                      <div class='albumblock'>
                <div class='inner'><A href='acp_view.asp?id=<%=rsf("id")%>'   title='<%=rsf("cpmc")%>'><img src="<%=rsf("tpdz")%>"  width='139' height='139'/>
                  <div class='albumtitle'><%=rsf("cpmc")%></div>
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