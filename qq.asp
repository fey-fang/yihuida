<link rel="stylesheet" type="text/css" href="qq/qq.css">

<script src="qq/gr.js"></script>
<div class="kefu" id="kefu">
  <div class="kefu-l pngimg"></div>
  <div class="kefu-r">
    <div class="kftop">
      <div id="guanbi"></div>
    </div>
    <div class="kfbox">
      <ul>
       <%set rsqq=server.CreateObject("adodb.recordset")
    rsqq.open"select * from qq order by px desc,id asc",cn,1,3
    for q=1 to rsqq.recordcount%>
    <%if rsqq("leixing")=1 then%>
    
        <li class="qq"><a target="_blank" href="tencent://message/?uin=<%=rsqq("s1")%>" rel="nofollow"><%=rsqq("s2")%></a></li>
         <%end if%>
    <%if rsqq("leixing")=2 then%>
             <li class="tb"><a target="_blank" href="http://www.taobao.com/webww/ww.php?ver=3&touid=<%=rsqq("s1")%>&siteid=cntaobao&status=2&charset=utf-8" rel="nofollow"><%=rsqq("s2")%></a></li>
               <%end if%>
    <%if rsqq("leixing")=3 then%>
    <li class="spk"><a href="callto://<%=rsqq("s1")%>" target="_blank"><%=rsqq("s2")%></a></li>
     <%end if%>
    <%rsqq.movenext
    next%>
        <li class="bs"></li>
        <li class="tell"><a target="_blank" title="" rel="nofollow"><%=page(2,0)%></a></li>
        <li class="bs"></li>
        <li class="codeer"><span><img src="<%=page(4,0)%>" width="110" border="0"  style="padding-left:20px;"/><br>
          </span></li---->
      </ul>
    </div>
    <div class="kfbottom"></div>
  </div>
</div>

<script> var kefu = new Floaters(); kefu.addItem("kefu",-1,180,"");kefu.play("kefu");</script>
<script>$('#guanbi').click(function(){
 $('#kefu .kefu-l').animate({width:'30px'},500);
 $('#kefu .kefu-r').animate({width:0},100);
});

$(function(){
 $('.kefu-l').click(function(){
  $(this).animate({width:0},100);
  $('.kefu-r').animate({width:'157px'},100);
 })
});

Floaters.prototype.plays = function(){
	var diffY;
	if (document.documentElement && document.documentElement.scrollTop)
	{
		diffY = document.documentElement.scrollTop;
	}
	else if (document.body)
	{
		diffY = document.body.scrollTop;
	}else{}

	for(var i=0;i<this.items.length;i++) {
		var obj = this.items[i].object;
		var followObj_y = this.items[i].y;
		var total = diffY + followObj_y;
		if(this.items[i].x >= 0){
			obj.style['left'] = this.items[i].x+ 'px';
		}else{
			obj.style['right'] = Math.abs(this.items[i].x)+ 'px';
		}
		if( obj.offsetTop != total)
		{
			var oldy = (total - obj.offsetTop) * this.delta;
				newtop = obj.offsetTop + ( oldy>0?1:-1 ) * Math.ceil( Math.abs(oldy) );
			obj.style['top'] = newtop + 'px';
		}
	}
}
</script> 
<script>
$(document).ready(function(){
	 $('.kefu-l').animate({width:0},100);
  $('.kefu-r').animate({width:'157px'},100);
	})
</script>