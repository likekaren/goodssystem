<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">

<title>添加商品</title>

</head>
<body>
<form id="itemForm" action="${pageContext.request.contextPath }/goods/addGoodsSubmit.action" method="post" >
		
		<!-- 更新用户的id -->
		<input type="hidden" name="id" value="${goods.id}" />
		<TBODY>
			<table width="100%" border=1>
<tr>
	<td>商品名称</td>
	<td><input type="text" name="goodsname" value="${goods.goodsname }"/></td>
</tr>
<tr>
	<td>管理员编号</td>
	<td><input type="text" name="userid" value="${goods.userid }"/></td>
</tr>
<tr>
	<td>仓库编号</td>
	<td><input type="text" name="depotid" value="${goods.depotid }"/></td>
</tr>
<tr>
	<td>区域编号</td>
	<td><input type="text" name="areaid" value="${goods.areaid }"/></td>
</tr>
<tr>
	<td>货架编号</td>
	<td><input type="text" name="zoneid" value="${goods.zoneid }"/></td>
</tr>
<tr>
	<td>商品数量</td>
	<td><input type="text" name="goodsnum" value="${goods.goodsnum }"/></td>
</tr>
<tr>
<td colspan="2" align="center"><input type="submit" value="提交"/>
</td>
</tr>
</table>
	</form>
</body>
</html>