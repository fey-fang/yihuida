<div class="Sbox">
          <div class="topic">公司产品&nbsp;&nbsp;&nbsp;Product</div>
          <div class="ClassNav">
            <div class="NavTree">
              <ul id='suckertree1'>
              <%set rsgly=server.CreateObject("adodb.recordset")
rsgly.open"select  * from adlb order by px desc,id asc",cn,1,3
xy_id=request("dlb_id")
for u=1 to rsgly.recordcount
set rsxlb=server.CreateObject("adodb.recordset")
rsxlb.open"select * from axlb where dlb_id="&rsgly("id")&" order by px desc,id asc",cn,1,3%>
 <li><A href='acpzs.asp?dlb_id=<%=rsgly("id")%>'><%=rsgly("dlb")%></A>
 <%if not rsxlb.eof then%>
<ul>

<%for l=1 to rsxlb.recordcount%>
<li><a href='acpzs.asp?dlb_id=<%=rsgly("id")%>&xlb_id=<%=rsxlb("id")%>' target='_blank' ><%=rsxlb("xlb")%></a></li> 
<%rsxlb.movenext
next
rsxlb.close
set rsxlb=nothing%>
</ul>
<%end if%>
</li>
<%rsgly.movenext
next
rsgly.close
set rsgly=nothing%>

            
                  </ul>
                </li>
              </ul>
            </div>
          </div>
        </div>
        <div class="HeightTab clearfix"></div>