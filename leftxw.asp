<!----div class="Sbox">
          <div class="topic">最新资讯&nbsp;&nbsp;&nbsp;New</div>
          <div class="list">
            <dl>
            <%set rsxw=server.CreateObject("adodb.recordset")
rsxw.open"select top 5 * from axw   order by px desc,id desc",cn,1,3
for a=1 to rsxw.recordcount%>
<dd><a href="axw_view.asp?id=<%=rsxw("id")%>" title="<%=rsxw("xwbt")%>"><%=rsxw("xwbt")%></a></dd>
<%rsxw.movenext
next
rsxw.close
set rsxw=nothing%>

            </dl>
          </div>
        </div>
         <div class="HeightTab clearfix"></div---->