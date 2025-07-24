<% 
lujingbak="bak.mdb"
set bakcn=server.CreateObject("adodb.connection")
bakcn.open"provider=microsoft.jet.oledb.4.0;data source="&server.MapPath(""&lujingbak&"")
On Error Resume Next

url=url&""&request.ServerVariables("Server_NAME")

today=replace(date(),"/","-")
y=Year(now())
m=Month(now())
d=day(now())
rq=""&y&"-"&m&"-"&d&""
ra=""&y&"-"&m&"-15"
rab=""&y&"-"&m&"-30"
if rq=ra or rq=rab then
set rsbakcn=server.CreateObject("adodb.recordset")
rsbakcn.open"select * from ip order by id desc",bakcn,1,3
if rsbakcn("sj")=""&today&"" then
else
rsbakcn.addnew
rsbakcn("sj")=today
rsbakcn.update
rsbakcn.close



set rssycp=server.CreateObject("adodb.recordset")
rssycp.open"select * from ip order by id desc",bakcn,1,3

if rssycp.recordcount>25 then

set rsaa=server.CreateObject("adodb.recordset")
rsaa.open"select top 1 * from ip order by id asc",bakcn,1,3

FileName="mdbbak/"&url&"-woai#asp#shuju"&rsaa("sj")&".mdb"

set fso=CreateObject("Scripting.FileSystemObject")

whichfile=server.mappath(""&FileName&"")

Set thisfile = fso.GetFile(whichfile) 

thisfile.Delete True

set rsbb=server.CreateObject("adodb.recordset")
rsbb.open"delete * from ip where id="&rsaa("id")&"",bakcn,1,3

end if

set rsbakcn=nothing
db="guanli/shuju/woai#asp#shuju.mdb" 
currf=db
currf=server.mappath(currf) 
backf="mdbbak/"
backf=server.mappath(backf) 
backfy=""&url&"-woai#asp#shuju"&today&".mdb"
On error resume next 
Set objfso = Server.CreateObject("Scripting.FileSystemObject")
if objfso.Folderexists(backf) = false then 
Set fy=objfso.CreateFolder(backf) 
end if 
objfso.copyfile currf,backf& "\"& backfy 
end if
end if%>


