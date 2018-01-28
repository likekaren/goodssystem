<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>查询商品列表</title>
</head>
<body> 
<form action="${pageContext.request.contextPath }/goods/queryGoods.action" method="post">
查询条件：
<table width="100%" border=1>
<tr>
<td><input type="submit" value="查询"/></td>
</tr>
</table>
商品列表：
<table width="100%" border=1>
<tr>
	<td>商品名称</td>
	<td>管理员编号</td>
	<td>仓库编号</td>
	<td>区域编号</td>
	<td>货架编号</td>
	<td>商品数量</td>
	<td>操作</td>
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

</tr>
</c:forEach>

</table>
</form>
</body>

</html>