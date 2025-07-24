   <div class="HeightTab clearfix"></div>
  <!--footer start-->
  <div id="footer">
    <div class="inner">
      <div class='BottomNav'><a href="index.asp" >网站首页</a> | <a href="gsjj.asp?id=3" >关于公司</a>| <a href="acpzs.asp" >产品展示</a> | <a href="axw_list.asp" >新闻资讯</a> | <a href="bxw_list.asp" >人才招聘</a> | <a href="gsjj.asp?id=8" >联系方式</a> | <a href="zxly.asp" >访客留言</a>  </div>
      <div class='HeightTab'></div>
      <%=gsxmnr(1,0)%>&nbsp;&nbsp;<A href="http://www.miitbeian.gov.cn/" target="_blank" >网站备案/许可证号:粤ICP备05066132号-1</A>&nbsp;&nbsp;
    </div>
  </div>
  <!--footer end --> 
  <script type="text/javascript">
	  var rheig= $("div.right").height();
	  var lheig= $("div.left").height();
	 // document.write(rheig);
            if ($("div.left").height() < rheig ) {
               $("div.left").height(rheig);
            } else {
              // $("div.right").height(lheig); 
            }
//判断 right的高度，显示或隐藏对应的侧边栏目或底部栏
</script>
<!--#include file="qq.asp"--->