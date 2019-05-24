<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<title>상품 목록조회</title>
<link rel="stylesheet" href="/css/admin.css" type="text/css">

<link rel="stylesheet"href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<script src="https://code.jquery.com/jquery-1.12.4.js"></script>

<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<!-- CDN(Content Delivery Network) 호스트 사용 -->

 <script type="text/javascript">
 
 
 function fncGetList(currentPage) {
  
  $("#currentPage").val(currentPage)
  $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit();
 }
  function fncOrderByLowPrice(currentPage) {
  $("#currentPage").val(currentPage)
  $("#orderByHighPrice").val('0')
  $("#orderByLowPrice").val('1')
  $("#orderByProdNo").val('0')
  $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit(); 
  }
  
  function fncOrderByHighPrice(currentPage) {
   $("#currentPage").val(currentPage)
   $("#orderByLowPrice").val('0')
   $("#orderByHighPrice").val('1')
   $("#orderByProdNo").val('0')
   $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit(); 
   }
  
  function fncOrderByProdNo(currentPage) {
   $("#currentPage").val(currentPage)
   $("#orderByProdNo").val('1')
   $("#orderByLowPrice").val('0')
   $("#orderByHighPrice").val('0')
   $("form").attr("method" , "POST").attr("action" , "/product/listProduct?menu=${param.menu}").submit(); 
   }
 
 
  $(function() {
	  var productList=[];
	 
	  $.ajax( 
				{
					url : "/product/json/getProductName",
					method : "GET" ,
					dataType : "json" ,
					headers : {
						"Accept" : "application/json",
						"Content-Type" : "application/json"
					},
	  
	  
					success : function(JSONData) {
	  
	/*
						$.each(productList,function(index,value){
		
		
					}
	*/					
					  $("#searchKeyword").autocomplete({
						  source: JSONData
					  });
					}

	});
	  
	  
	  
	  
	  
	  
   
    $( "td.ct_btn01:contains('검색')" ).on("click" , function() {
    fncGetList(1);
   });
    
    $( ".ct_list_pop td:nth-child(3)" ).css("color" , "red");
    $("h7").css("color" , "red");
    $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");  
    
    $(".ct_list_pop td:nth-child(3)" ).on("click" , function() {
     var menu ="${param.menu}";
     //alert(menu);
     if( menu=='manage'){ 
     self.location ="/product/updateProductView?prodNo="+$(this).children("#prodNom").text().trim()+"&menu=manage";
     } else{
    
    
    self.location ="/product/getProduct?prodNo="+$(this).children("#prodNos").text().trim()+"&menu=search";
     }
      });
  
  }); 
  
  
  
</script>
</head>
<body bgcolor="#ffffff" text="#000000">
<div style="width:98%; margin-left:10px;">
<form name="detailForm">
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
 <tr>
  <td width="15" height="37">
   <img src="/images/ct_ttl_img01.gif" width="15" height="37"/>
  </td>
  <td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left:10px;">
   <table width="100%" border="0" cellspacing="0" cellpadding="0">
    
    
    <tr>
     <td width="93%" class="ct_ttl01">
     
       ${param.menu.equals("manage")?"상품 관리":"상품 목록 조회"}
     
     </td>
    </tr>
    
    
   </table>
  </td>
  <td width="12" height="37">
   <img src="/images/ct_ttl_img03.gif" width="12" height="37"/>
  </td>
 </tr>
</table>
<input type="hidden" id="orderByProdNo" name="orderByProdNo" value="${! empty search.orderByProdNo?search.orderByProdNo : "1"}"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
  <td align="right" width="600">
   
   <table border="0" cellspacing="0" cellpadding="0">
   
     <td width="17" height="23">
      <img src="/images/ct_btnbg01.gif" width="17" height="23"/>
     </td>
     <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
      <a href="javascript:fncOrderByProdNo('1');">상품명순</a>
     </td>
     <td width="14" height="23">
      <img src="/images/ct_btnbg03.gif" width="14" height="23"/>
     </td>
<input type="hidden" id="orderByLowPrice" name="orderByLowPrice" value="${! empty search.orderByLowPrice?search.orderByLowPrice : "0"}"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
  <td align="right" width="600">
   
   <table border="0" cellspacing="0" cellpadding="0">
   
     <td width="17" height="23">
      <img src="/images/ct_btnbg01.gif" width="17" height="23"/>
     </td>
     <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
      <a href="javascript:fncOrderByLowPrice('1');">낮은가격순</a>
     </td>
     <td width="14" height="23">
      <img src="/images/ct_btnbg03.gif" width="14" height="23"/>
     </td>
   
  
 <input type="hidden" id="orderByHighPrice" name="orderByHighPrice" value="${! empty search.orderByHighPrice?search.orderByHighPrice : "0"}"/>
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
  
  
  

  <td align="right">
  <table border="0" cellspacing="0" cellpadding="0">
   
     <td width="17" height="23">
      <img src="/images/ct_btnbg01.gif" width="17" height="23"/>
     </td>
     <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
      <a href="javascript:fncOrderByHighPrice('1');">높은가격순</a>
     </td>
     <td width="14" height="23">
      <img src="/images/ct_btnbg03.gif" width="14" height="23"/>
     </td>
   
  </table>
  </td>


<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
 <tr>
  <td align="right">
   
   <select name="searchCondition" class="ct_input_g" style="width:80px">
    <option value="0" ${! empty search.searchCondition&&search.searchCondition.equals('0') ? 'selected' : ''}>상품번호</option>
    <option value="1" ${! empty search.searchCondition&&search.searchCondition.equals('1') ? 'selected' : ''}>상품명</option>
    <option value="2" ${! empty search.searchCondition&&search.searchCondition.equals('2') ? 'selected' : ''}>가격 </option>
   </select>
  
   <input  type="text" name="searchKeyword" id="searchKeyword" value="${! empty search.searchKeyword ? search.searchKeyword : ''}"
     class="ct_input_g" style="width:200px; height:20px" >
  </td>
  <td align="right" width="70">
   <table border="0" cellspacing="0" cellpadding="0">
    <tr>
     <td width="17" height="23"><img src="/images/ct_btnbg01.gif" width="17" height="23"/>
    
     <td background="/images/ct_btnbg02.gif" class="ct_btn01" style="padding-top:3px;">
      검색
     </td>
     <td width="14" height="23"><img src="/images/ct_btnbg03.gif" width="14" height="23"/>
     </td>
    </tr>
   </table>
  </td>
 </tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
 <tr>
  <td colspan="11" >전체 ${resultPage.totalCount} 건수, 현재 ${resultPage.currentPage} 페이지
  </td>
 </tr>
 <tr>
  <td class="ct_list_b" width="100">No</td>
  
  <td class="ct_line02"></td>
 
  <td class="ct_list_b" width="150">
   상품명<br>
   <h7 >(상품명 click:상세정보)</h7>
  </td>
  <td class="ct_list_b" width="150">가격</td>
 
  <c:choose>
  <c:when test="${param.menu eq 'manage'}">
  <td class="ct_list_b">등록일</td> 
  </c:when>
  <c:when test="${param.menu eq 'search'}">
  <td class="ct_list_b">상품 상세정보</td> 
  </c:when>
  </c:choose>
  
  <td class="ct_list_b">현재상태</td> 
 </tr>
 <tr>
  <td colspan="11" bgcolor="808285" height="1"></td>
 </tr>
  
  
  
 <c:set var="i" value="0" />
 <c:forEach var="product" items="${list}">
  <c:set var="i" value="${ i+1 }" />
  <tr class="ct_list_pop">
   <td align="center">${ i }</td>
   <td></td>
   
  
 
 <c:if test="${param.menu eq 'manage'}">
  
  <td align="left">${product.prodName}<div id=prodNom style="display:none">${product.prodNo}</div>
  </td>
  </c:if>
 
 <c:if test="${param.menu eq 'search'}">
  
  <td align="left">${product.prodName}<div id=prodNos style="display:none">${product.prodNo}</div></td>
  </c:if> 
  <td align="left">${product.price}</td>
 
 
 
  <c:if test="${param.menu eq 'search'}">
  <td align="left">${product.prodDetail}</td></c:if> 
  
  <c:if test="${param.menu eq 'manage'}">
  <td align="left">${product.regDate}</td> 
  </c:if>
  
  
  <td align="left">
  
  <c:if test="${product.prodQty <=0}">
    품절
    </c:if> 
   
    <c:if test="${product.prodQty >0}">
    판매중 (재고 : ${product.prodQty} 개)</c:if>
 
 
  <c:if test="${param.menu.equals('manage')}">   
  <c:choose> 
   <c:when test="${product.prodTranCode.equals('0')}">
    판매중
   </c:when>
   <c:when test="${product.prodTranCode eq '1  '}">
    구매완료 <a href= "/purchase/updateTranCodeListProduct?tranNo=${product.prodTranNo}&tranCode=2">배송하기</a>
   </c:when>
   <c:when test="${product.prodTranCode eq '2  '}">
    배송중
   </c:when>
   <c:when test="${product.prodTranCode eq '3  '}">
    배송완료
   </c:when>
 

 
 
  </c:choose>
  </c:if>
  </td> 
 </tr> 
 <tr>
  <td colspan="11" bgcolor="D6D7D6" height="1"></td>
 </tr>
 </c:forEach>
 </table>
 
<!--  페이지 Navigator 시작 -->
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
 <tr>
  <td align="center">
     <input type="hidden" id="currentPage" name="currentPage" value=""/>
     
   <jsp:include page="../common/pageNavigator.jsp"/> 
  
     </td>
  </tr>
</table>
<!--  페이지 Navigator 끝 -->

</form>
</div>
</body>
</html>