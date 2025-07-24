<% 
'   filterhtml(
'   Rs3Br(
'   formatDate(
'Code by safe3
On Error Resume Next
if request.querystring<>"" then call stophacker(request.querystring,"'|<[^>]*?>|^\+/v(8|9)|\b(and|or)\b.+?(>|<|=|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)")
if Request.ServerVariables("HTTP_REFERER")<>"" then call test(Request.ServerVariables("HTTP_REFERER"),"'|\b(and|or)\b.+?(>|<|=|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)")
if request.Cookies<>"" then call stophacker(request.Cookies,"\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)") 
call stophacker(request.Form,"^\+/v(8|9)|\b(and|or)\b.{1,6}?(=|>|<|\bin\b|\blike\b)|/\*.+?\*/|<\s*script\b|\bEXEC\b|UNION.+?SELECT|UPDATE.+?SET|INSERT\s+INTO.+?VALUES|(SELECT|DELETE).+?FROM|(CREATE|ALTER|DROP|TRUNCATE)\s+(TABLE|DATABASE)")

function test(values,re)
  dim regex
  set regex=new regexp
  regex.ignorecase = true
  regex.global = true
  regex.pattern = re
  if regex.test(values) then
                                IP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
                                If IP = "" Then 
                                  IP=Request.ServerVariables("REMOTE_ADDR")
                                end if
                                'slog("<br><br>操作IP: "&ip&"<br>操作时间: " & now() & "<br>操作页面："&Request.ServerVariables("URL")&"<br>提交方式: "&Request.ServerVariables("Request_Method")&"<br>提交参数: "&l_get&"<br>提交数据: "&l_get2)
    Response.Write("<div style='position:fixed;top:0px;width:100%;height:100%;background-color:white;color:green;font-weight:bold;border-bottom:5px solid #999;'><br>您的提交带有不合法参数,谢谢合作!<br><br>了解更多请点击:<a href='http://webscan.360.cn'>360网站安全检测</a></div>")
    Response.end
   end if
   set regex = nothing
end function 


function stophacker(values,re)
 dim l_get, l_get2,n_get,regex,IP
 for each n_get in values
  for each l_get in values
   l_get2 = values(l_get)
   set regex = new regexp
   regex.ignorecase = true
   regex.global = true
   regex.pattern = re
   if regex.test(l_get2) then
                                IP=Request.ServerVariables("HTTP_X_FORWARDED_FOR")
                                If IP = "" Then 
                                  IP=Request.ServerVariables("REMOTE_ADDR")
                                end if
                                'slog("<br><br>操作IP: "&ip&"<br>操作时间: " & now() & "<br>操作页面："&Request.ServerVariables("URL")&"<br>提交方式: "&Request.ServerVariables("Request_Method")&"<br>提交参数: "&l_get&"<br>提交数据: "&l_get2)
    Response.Write("<div style='position:fixed;top:0px;width:100%;height:100%;background-color:white;color:green;font-weight:bold;border-bottom:5px solid #999;'><br>您的提交带有不合法参数,谢谢合作!<br><br>了解更多请点击:<a href='http://webscan.360.cn'>360网站安全检测</a></div>")
    Response.end
   end if
   set regex = nothing
  next
 next
end function 

sub slog(logs)
        dim toppath,fs,Ts
        toppath = Server.Mappath("/log.htm")
                                Set fs = CreateObject("scripting.filesystemobject")
                                If Not Fs.FILEEXISTS(toppath) Then 
                                    Set Ts = fs.createtextfile(toppath, True)
                                    Ts.close
                                end if
                                    Set Ts= Fs.OpenTextFile(toppath,8)
                                    Ts.writeline (logs)
                                    Ts.Close
                                    Set Ts=nothing
                                    Set fs=nothing
end sub

%><%
lujing="guanli/shuju/woai#asp#shuju.mdb"
set cn=server.CreateObject("adodb.connection")
cn.open"provider=microsoft.jet.oledb.4.0;data source="&server.MapPath(""&lujing&"")
On Error Resume Next
wz=Request.ServerVariables("HTTP_HOST")
curUrl = replace(Replace(Request.ServerVariables("Script_Name"),"/",""), ".asp", "")



set rswzpz=server.CreateObject("adodb.recordset")
rswzpz.open"select * from wzpz where id=1",cn,1,3

title=rswzpz("title")
gjz=rswzpz("gjz")
ms=rswzpz("ms")

function filterhtml(byval fstring)
	'不保留分段
      if isnull(fstring) or trim(fstring)="" then
          filterhtml=""
          exit function
      end if
    
      'fstring = replace(fstring, "<br />", "[br]")
      'fstring = replace(fstring, "<br>", "[br]")
	  fstring = replace(fstring, "&nbsp;", " ")
    
      '过滤html标签
      dim re
      set     re = new     regexp
      re.ignorecase=true
      re.global=true
      re.pattern="<(.+?)>"
      fstring = re.replace(fstring, "")
      set     re=nothing
    
      fstring = replace(fstring, "[br]", "<br />")
      filterhtml = fstring
end function

function filterhtmlp(byval fstring)
'保留分段
      if isnull(fstring) or trim(fstring)="" then
          filterhtmlp=""
          exit function
      end if
    
      fstring = replace(fstring, "<br />", "[br]")
      fstring = replace(fstring, "<br>", "[br]")
      fstring = replace(fstring, "</p>", "[br]")
	   fstring = replace(fstring, "&nbsp;", " ")
      '过滤html标签
      dim re
      set     re = new     regexp
      re.ignorecase=true
      re.global=true
      re.pattern="<(.+?)>"
      fstring = re.replace(fstring, "")
      set     re=nothing
    
      fstring = replace(fstring, "[br]", "<br />")
      filterhtmlp = fstring
end function


'给文本框换行
function Rs3Br(byval strHTML)

Dim objRegExp, Match, Matches
Set objRegExp = New Regexp
objRegExp.IgnoreCase = True
objRegExp.Global = True
objRegExp.Pattern = "<.+?>"

Set Matches = objRegExp.Execute(strHTML)
For Each Match in Matches
strHtml=Replace(strHTML,Match.Value,"")
Next
objRegExp.Pattern = "(\n|\r\n)"
Set Matches = objRegExp.Execute(strHTML)
For Each Match in Matches
strHtml=Replace(strHTML,Match.Value,"<br>")

Next
RemoveHTML=strHTML
Rs3Br= strHTML
Set objRegExp = Nothing

end function



Public Function FilterSql(Str,lx) 

If Trim(Str)="" or Isnull(str) Then 

   FilterSql="" 

Else  

Str=replace(Str,"'","''") 
Str = Replace(Str, "select", "sel&#101;ct")
Str = Replace(Str, "join", "jo&#105;n")
Str = Replace(Str, "union", "un&#105;on")
Str = Replace(Str, "where", "wh&#101;re")
Str = Replace(Str, "insert", "ins&#101;rt")
Str = Replace(Str, "delete", "del&#101;te")
Str = Replace(Str, "update", "up&#100;ate")
Str = Replace(Str, "like", "lik&#101;")
Str = Replace(Str, "drop", "dro&#112;")
Str = Replace(Str, "create", "cr&#101;ate")
Str = Replace(Str, "modify", "mod&#105;fy")
Str = Replace(Str, "rename", "ren&#097;me")
Str = Replace(Str, "alter", "alt&#101;r")
Str = Replace(Str, "cast", "ca&#115;t")
Str = Replace(Str, "and", "an&#100;")
Str = Replace(Str, "or", "o&#114;")

if lx=1 then
Str = trim(Str)
else
Str = trim(Str)
Str = cint(Str)
end if

FilterSql=Str 

End If  
end Function


Function filterzs(wz,zs) 
if len(wz)>=zs then   
wz=""&left(wz,zs)&"..."
else
wz=wz
end if
filterzs=wz
end Function


Function mont(mon) 
mon=month(mon)
if len(mon)>1 then   
mon=mon
else
mon="0"&mon&""
end if
mont=mon
end Function

Function daa(da) 
da=day(da)
if len(da)>1 then   
da=da
else
da="0"&da&""
end if
daa=da
end Function

Function page(pid,zs)
set rso=server.CreateObject("adodb.recordset")
rso.open "select top 1 * from page where id="&pid,cn,1
if not rso.eof then
if zs=0 then
page=rso("nr")
else
page=left(rso("nr"),zs)
end if
end if
end Function

'==================
'< % =page(2,0) % >
'==================


Function gsxmnr(pid,zs)
set rso=server.CreateObject("adodb.recordset")
rso.open "select top 1 * from gsxmnr where id="&pid,cn,1
if not rso.eof then
if zs=0 then
gsxmnr=rso("gsxmnr")
else
gsxmnr=left(rso("gsxmnr"),zs)
end if
end if
end Function

Function formatDate(Byval t,Byval ftype) 
dim y, m, d, h, mi, s 
formatDate="" 
If IsDate(t)=False Then Exit Function 
y=cstr(year(t)) 
m=cstr(month(t)) 
If len(m)=1 Then m="0" & m 
d=cstr(day(t)) 
If len(d)=1 Then d="0" & d 
h = cstr(hour(t)) 
If len(h)=1 Then h="0" & h 
mi = cstr(minute(t)) 
If len(mi)=1 Then mi="0" & mi 
s = cstr(second(t)) 
If len(s)=1 Then s="0" & s 
select case cint(ftype) 
case 1 
' yyyy-mm-dd 
formatDate=y & "-" & m & "-" & d 
case 2 
' yy-mm-dd 
formatDate=right(y,2) & "-" & m & "-" & d 
case 3 
' mm-dd 
formatDate=m & "-" & d 
case 4 
' yyyy-mm-dd hh:mm:ss 
formatDate=y & "-" & m & "-" & d & " " & h & ":" & mi & ":" & s 
case 5 
' hh:mm:ss 
formatDate=h & ":" & mi & ":" & s 
case 6 
' yyyy年mm月dd日 

case 7 
' yyyymmdd 
formatDate=y & m & d 
case 8 
'yyyymmddhhmmss 
formatDate=y & m & d & h & mi & s 
case 9
formatDate=mobans
end select 
End Function 


Function cinta(id) 

if id<>"" then
ida=cint(id)
else
ida=0
end if
cinta=ida
end Function

%>
<!--#include file="mdb.asp"----->