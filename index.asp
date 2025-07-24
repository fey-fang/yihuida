<!--#include file="conn.asp"--->
<%menubt="index"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"/>
<meta http-equiv="X-UA-Compatible" content="IE=Edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=title%></title>
<meta name="keywords" content="<%=gjz%>" />
<meta name="description" content="<%=ms%>" />
<!--#include file="head.asp"--->
<link href="css/BigRed/style.css?2"  rel="stylesheet" type="text/css" />
<link href="css/BigRed/common.css?2"  rel="stylesheet" type="text/css" />
<script type="text/javascript" src="js/functions.js" ></script>
<script type="text/javascript" src="js/focusslide.js" ></script>

</head>

<body>

<div id="wrapper"> 
  <!--#include file="top.asp"--->
  
  <!--body start-->
  <div id="body"> 
    <!--MainBlock start-->
    <div class="MainBlock"> 
      <!--left start-->
      <div class="right">
        <div class="topic">
          <div class="TopicTitle"><a href="gsjj.asp?id=3" >关于公司</a></div>
          <div class="TopicMore"> <a  href="gsjj.asp?id=3" ><img src="images/more.png" ></a></div>
        </div>
        <!---div class='img'><a href="About/index.htm"  target='_blank'><img src="images/Up_Images/office.jpg"  width='200' height='100' alt='关于公司'></a></div--->
        <div class='txt ColorLink'>
          <%=gsxmnr(6,0)%>
        </div>
        <div class=" clearfix"></div>
      </div>
      <!--left end-->
      <div class='WidthTab2'></div>
      
      <!--right start-->
      <div class="left">
        <div class="TabBlock">
          <div class="menu">
            <ul>
              <li class='Tabs1'><A  title='新闻动态' href="axw_list.asp"   class="tabactive"  >新闻动态</A></li>
           
            </ul>
          </div>
          <DIV  style="margin-top:10px;" >
            <table class='MBlockTable' width='100%' border='0' cellspacing='0' cellpadding='0'>
            <%set rsxw=server.CreateObject("adodb.recordset")
rsxw.open"select top 8 * from axw   order by px desc,id desc",cn,1,3
for a=1 to rsxw.recordcount%>


              <tr>
                <td width='100%'><a href="axw_view.asp?id=<%=rsxw("id")%>" title="<%=rsxw("xwbt")%>"><span><%=formatdate(rsxw("tjsj"),3)%></span>· <%=rsxw("xwbt")%></a></td>
                
              </tr>
<%rsxw.movenext
next
rsxw.close
set rsxw=nothing%>
            </table>
          </div>
          
        </div>
      </div>
      <!--right end--> 
      
      <!--right2 start-->
      <div class="right2">
        <div class="topic">
          <div class="TopicTitle">视频展示</div>
          <div class="TopicMore"></div>
        </div>
        <div class='img'><%=gsxmnr(18,0)%>
        </div>
        <div class=" clearfix"></div>
      </div>
      <!--right2 end-->
      <div class="clearfix"></div>
    </div>
    <!--MainBlock end-->
    
    <div class="HeightTab clearfix"></div>
    <!--ProductShow start-->
    <DIV class="ProductShow">
      <div class="topic">
        <div class="TopicTitle"> 公司产品</div>
        <div class="TopicMore"> <a  href="acpzs.asp" ><img src="images/more.png" ></a></div>
      </div>
      <DIV class="hjnavC">
        <DIV class="hjnavleft">
          <UL>
          <%set rscpfl=server.CreateObject("adodb.recordset")
 rscpfl.open"select top 6 * from  adlb order by px desc,id asc",cn,1,3
 for b=1 to rscpfl.recordcount%>
 <li <%if b = 1 then %>class='hover1' <%end if%>><a href='acpzs.asp?dlb_id=<%=rscpfl("id")%>'><%=rscpfl("dlb")%></a></li>
 <%rscpfl.movenext
 next
 rscpfl.close
 set rscpfl=nothing%>
 
      
          </UL>
        </DIV>
        <DIV class="hjnavcn">
<%set rscpflcp=server.CreateObject("adodb.recordset")
 rscpflcp.open"select top 6 * from adlb order by px desc,id asc",cn,1,3
 for flcp=1 to rscpflcp.recordcount%>
          <DIV class='hjone'>
          
       <%
set rsf=server.CreateObject("adodb.recordset")
rsf.open"select top 4 * from acp where dlb_id="&rscpflcp("id")&"  order by px desc, id desc",cn,1,3
for f=1 to rsf.recordcount
%> 
           
            <div class='albumblock'>
              <div class='inner'><a href='acp_view.asp?id=<%=rsf("id")%>'   title='<%=rsf("cpmc")%>'><img src="<%=rsf("tpdz")%>"  width='166' height='166'/>
                <div class='albumtitle'><%=rsf("cpmc")%></div>
                </a></div>
            </div>
            
<%rsf.movenext
next
rsf.close
set rsf=nothing
%>
          </div>
 <%rscpflcp.movenext
 next
 rscpflcp.close
 set rscpflcp=nothing%>
          
   
      </div>
      <div class="clearfix"></div>
    </DIV>
    <SCRIPT type="text/javascript" src="js/h.js" ></SCRIPT> 
    <!--ProductShow end-->
    
    
    
<!------------------------------->
      <div class="topic" style=" border-top:1px solid #ddd;">
        <div class="TopicTitle"> 专利证书</div>
        <div class="TopicMore"> <a  href="ry.asp" ><img src="images/more.png" ></a></div>
      </div>
    <div class="zhuanlizs cl clearfix">
    
  	<div class="picScroll-left">
	
			<div class="bd">
				<ul class="picList">
                <%set rsca=server.CreateObject("adodb.recordset")
rsca.open"select top 8 * from ry  order by px desc,id desc",cn,1,3
for c=1 to rsca.recordcount%>


					<li>
						<div class="pic"><a href='ry_view.asp?id=<%=rsca("id")%>'  title='<%=rsca("s1")%>'><img src="<%=rsca("tpdz")%>" /></a></div>
						<div class="title"><a href='ry_view.asp?id=<%=rsca("id")%>'  title='<%=rsca("s1")%>'><%=rsca("s1")%></a></div>
					</li>
 <%rsca.movenext
next
rsca.close
set rsca=nothing%>
				</ul>
			</div>
		</div>

		<script type="text/javascript">
		jQuery(".picScroll-left").slide({titCell:".hd ul",mainCell:".bd ul",autoPage:true,effect:"left",autoPlay:true,vis:4,trigger:"click"});
		</script>
    </div>
<!--------------------------------->    
    

    <!--links start-->
    <div id="Links"> <span>友情链接：</span><%set rsg=server.CreateObject("adodb.recordset")
rsg.open"select * from yqlj order by px desc ,id asc",cn,1,3
for g=1 to rsg.recordcount
%><a href='<%=rsg("wzwz")%>' target='_blank'  ><%=rsg("wzmc")%></a>
<%rsg.movenext
next
rsg.close
set rsg=nothing%> </div>
    <!--links end--> 
    
  </div>
  <!--body end-->


  <!--#include file="bottom.asp"---> 
</div>
<script type="text/javascript" src="js/TabShow.js"  ></script> 
<script type="text/javascript">
window.onerror=function(){return true;}
</script>


</body>
</html>