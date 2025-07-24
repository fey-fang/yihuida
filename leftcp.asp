<div class="Sbox">
  <div class="topic">热门产品&nbsp;&nbsp;&nbsp;Hot</div>
  <div class="list">
    <dl>

      <%
set rsf=server.CreateObject("adodb.recordset")
rsf.open"select top 8 * from acp where xs='是'  order by px desc, id desc",cn,1,3
for f=1 to rsf.recordcount
%> 

<dd><A href='acp_view.asp?id=<%=rsf("id")%>'   title='<%=rsf("cpmc")%>'><%=rsf("cpmc")%></A></dd>

<%rsf.movenext
next
rsf.close
set rsf=nothing
%>
    </dl>
  </div>
</div>
<div class="HeightTab clearfix"></div>
