<!--head start-->

<div id="head"> 
  
  <!--top start -->
  <div class="top">
    <div class="TopLogo">
      <div class="logo"><a href="index.asp" ><img src="<%=page(1,0)%>"  alt="<%=title%>"></a></div>
      <div class="tel">
        <p class="telW">24小时客服热线</p>
        <p class="telN"><%=page(2,0)%></p>
      </div>
    </div>
  </div>
  <!--top end--> 
  
  <!--nav start-->
  <div id="NavLink" >
    <div class="NavBG"> 
      <!--Head Menu Start-->
      <ul id='sddm'>
        <li class='CurrentLi'><a href="index.asp" >网站首页</a></li>
        <li><a href="gsjj.asp?id=3"  onmouseover=mopen('m2') onmouseout='mclosetime()'>关于公司</a>
          <div id='m2' onmouseover='mcancelclosetime()' onmouseout='mclosetime()'>
            <%set rsa=server.CreateObject("adodb.recordset")
 rsa.open"select * from gsxmnr where leixing='1' order by px desc, id asc",cn,1,3
 for a=1 to rsa.recordcount
 %>
            <a href='gsjj.asp?id=<%=rsa("id")%>'><%=rsa("gsxm")%></a>
            <%rsa.movenext
 next
 rsa=close
 set rsa=nothing%>
 
 <a href='ry.asp'>专利证书</a>
          </div>
        </li>
        <li><a href="acpzs.asp"  onmouseover=mopen('m3') onmouseout='mclosetime()'>产品展示</a>
          <div id='m3' onmouseover='mcancelclosetime()' onmouseout='mclosetime()'>
            <%set rsb=server.CreateObject("adodb.recordset")
 rsb.open"select * from adlb order by px desc,id asc",cn,1,3
 for b=1 to rsb.recordcount%>
            <a href='acpzs.asp?dlb_id=<%=rsb("id")%>'><%=rsb("dlb")%></a>
            <%rsb.movenext
 next
 rsb.close
 set rsb=nothing%>
          </div>
        </li>
        <li><a href="wt.asp"  onmouseover=mopen('m68') onmouseout='mclosetime()'>技术支持</a>
          <div id='m68' onmouseover='mcancelclosetime()' onmouseout='mclosetime()'>

            <a href='wt.asp'>常见问题</a>
            <a href='xz.asp'>下载中心</a>

          </div>
        </li>
        <li><a href="axw_list.asp"  onmouseover=mopen('m4') onmouseout='mclosetime()'>新闻资讯</a>
          <div id='m4' onmouseover='mcancelclosetime()' onmouseout='mclosetime()'>
            <%set rsc=server.CreateObject("adodb.recordset")
rsc.open"select * from axwlb  order by  px desc, id asc",cn,1,3
for c=1 to rsc.recordcount%>
            <a href='axw_list.asp?xwlb_id=<%=rsc("id")%>'><%=rsc("xwlb")%></a>
            <%rsc.movenext
 next
 rsc.close
 set rsc=nothing%>
          </div>
        </li>
        <li><a  href="bxw_list.asp"  onmouseover=mopen('m6') onmouseout='mclosetime()'>人才招聘</a>
        </li>
        <li><a href="gsjj.asp?id=8" >联系方式</a></li>
        <li><a href="zxly.asp" >访客留言</a></li>
      </ul>
      <!--Head Menu End--> 
    </div>
    <div class="clearfix"></div>
  </div>
  <!--nav end--> 
  <%if menubt="index" then%>
<!--#include file="ppt.asp"--->
  <%end if%>
  <div class="HeightTab clearfix"></div>
</div>
<!--head end-->