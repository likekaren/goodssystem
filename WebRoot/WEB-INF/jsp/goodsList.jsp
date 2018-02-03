<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%@ include file="/WEB-INF/jsp/base/tag.jsp"%>
<%@ include file="/WEB-INF/jsp/base/common_js.jsp"%>
<%@page import="java.net.InetAddress"%>
<%
	String localurl = InetAddress.getLocalHost().getHostAddress()
			.toString();
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>查询商品列表</title>
</head>
<body> 
<form id="itemForm" action="${pageContext.request.contextPath }/goods/tjqueryGoods.action" method="post" >
<!-- 查询条件 -->

			<TABLE class="table_search">
				<TBODY>
				
					<TR>
					
						<TD class="left">商品名称：</td>
						<td><INPUT type="text" name="Goodsname" value="${goods.goodsname}"/></TD>
						<TD class="left">管理员编号：</TD>
						<td><INPUT type="text" name="Userid" value="${goods.userid}"/></TD>

						<TD class="left">仓库编号：</TD>
						<td><INPUT type="text" name="Depotid" value="${goods.depotid}"/></TD>

						<TD class="left">区域编号：</TD>
						<td><INPUT type="text" name="Areaid" value="${goods.areaid}"/></TD>
						
						<TD class="left">货架编号：</TD>
						<td><INPUT type="text" name="Zoneid" value="${goods.zoneid}"/></TD>
					
						<td colspan="2" align="center"><input type="submit" value="搜索"/>
					
						
					
				</TBODY>
			</TABLE>
			</form>	
<form action="${pageContext.request.contextPath }/goods/queryGoods.action" method="post">
条件查询：


<%-- <td><a href="${pageContext.request.contextPath }/goods/editqueryGoods.action">条件查询</a></td> --%>



		



<td><a href="${pageContext.request.contextPath }/goods/addGoods.action">添加</a></td>


商品列表：
<table width="100%" border=1>
<tr>
	<td>商品名称</td>
	<td>管理员编号</td>
	<td>仓库编号</td>
	<td>区域编号</td>
	<td>货架编号</td>
	<td>商品数量</td>
	<td>修改操作</td>
	<td>刪除操作</td>
</tr>
<c:forEach items="${goodsList }" var="goods">
<tr>
	<td>${goods.goodsname }</td>
	<td>${goods.userid }</td>
	<td>${goods.depotid }</td>
	<td>${goods.areaid }</td>
	<td>${goods.zoneid }</td>
	<td>${goods.goodsnum }</td>
	<td><a href="${pageContext.request.contextPath }/goods/editGoods.action?id=${goods.id}">修改</a></td>
	<td><a href="${pageContext.request.contextPath }/goods/deleteGoods.action?id=${goods.id}">刪除</a></td>
</tr>
</c:forEach>

</table>
</form>
</body>

</html>