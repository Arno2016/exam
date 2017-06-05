<%@ page contentType="image/jpeg;charset=UTF-8"%>
<%@ page import="java.awt.*, java.awt.image.*" %>
<%@ page import="java.util.*, javax.imageio.*" %>

<%!
//产生随机颜色函数getRandColor
Color getRandColor(int fc, int bc)
{
Random r=new Random();
if(fc>255) fc=255;
if(bc>255) bc=255;
int red=fc+r.nextInt(bc-fc);
int green=fc+r.nextInt(bc-fc);
int blue=fc+r.nextInt(bc-fc);
return new Color(red,green,blue);
}
%>

<%
//设置页面不缓存
response.setHeader("Pragma", "No-cache");
response.setHeader("Cache-Control", "no-cache");
response.setDateHeader("Expires", 0);

//创建随机类
Random r=new Random();

//创建图像
int width=60, height=20;
BufferedImage pic=new BufferedImage(width, height, BufferedImage.TYPE_INT_RGB);

Graphics gc=pic.getGraphics();

gc.setColor(getRandColor(200,250));
gc.fillRect(0, 0, width, height);

gc.setFont(new Font("Times New Roman", Font.PLAIN, 18));

gc.setColor(getRandColor(160,200));
for(int i=0;i<200;i++)
{
int x1=r.nextInt(width);
int y1=r.nextInt(height);
int x2=r.nextInt(15);
int y2=r.nextInt(15);
gc.drawLine(x1, y1, x1+x2, y1+y2);
}

gc.setColor(getRandColor(120,240));
for(int i=0;i<200;i++)
{
int x=r.nextInt(width);
int y=r.nextInt(height);
gc.drawOval(x, y, 0, 0);
}

String str=session.getAttribute("code").toString();//获得验证码
String RS="";
String rn="";
for(int i=0;i<4;i++)
{
rn=String.valueOf(str.charAt(i));
RS+=rn;
gc.setColor(new Color(20+r.nextInt(110),20+r.nextInt(110),20+r.nextInt(110)));
gc.drawString(rn, 13*i+6,16);
}

//释放图形上下文环境
gc.dispose();

//输出生成后的验证码图像到页面
ImageIO.write(pic, "JPEG", response.getOutputStream());
out.clear();
out = pageContext.pushBody();
%>