<div class="fullSlide">
  <div class="bd">
    <ul>
      <%set rsppt=server.CreateObject("adodb.recordset")
rsppt.open"select top 5 * from ppt where leixing='1' order by px desc,id desc",cn,1,3
for a=1 to rsppt.recordcount
%>
      <li style="background:url(<%=rsppt("s2")%>) #f2f2f2 center 0 no-repeat;"><a   href="<%=rsppt("url")%>"></a></li>
      <%rsppt.movenext
next
rsppt.close
set rsppt=nothing%>
    </ul>
  </div>
  <div class="hd">
    <ul>
    </ul>
  </div>
</div>
<script type="text/javascript">
		jQuery(".fullSlide").slide({ titCell:".hd ul", mainCell:".bd ul", effect:"fold",  autoPlay:true, autoPage:true, trigger:"click" });
	</script>