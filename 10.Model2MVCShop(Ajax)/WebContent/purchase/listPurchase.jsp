<%@ page contentType="text/html; charset=euc-kr" %>
<%@ page pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<title>���� �����ȸ</title>

<link rel="stylesheet" href="/css/admin.css" type="text/css">


<!-- CDN(Content Delivery Network) ȣ��Ʈ ��� -->
	<script src="http://code.jquery.com/jquery-2.1.4.min.js"></script>
	<script type="text/javascript">
	

 
	function fncGetList(currentPage) {
		
		$("#currentPage").val(currentPage)
		$("form").attr("method" , "POST").attr("action" , "/purchase/listPurchase?menu=${param.menu}").submit();
	
	}
	 $(function() {

		 $( ".ct_list_pop td:nth-child(1)" ).on("click" , function() {
			
				self.location ="/purchase/getPurchase?tranNo="+$(this).children("#tranNoj").text().trim();
				
		});
		 
	
		 $( ".ct_list_pop td:nth-child(3)" ).on("click" , function() {
				//Debug..
				//alert(  $( this ).text().trim() );
				
				//////////////////////////// �߰� , ����� �κ� ///////////////////////////////////
				//self.location ="/user/getUser?userId="+$(this).text().trim();
				////////////////////////////////////////////////////////////////////////////////////////////
				var userId = $(this).text().trim();
				$.ajax( 
						{
							url : "/user/json/getUser/"+userId ,
							method : "GET" ,
							dataType : "json" ,
							headers : {
								"Accept" : "application/json",
								"Content-Type" : "application/json"
							},
							success : function(JSONData , status) {

								//Debug...
								//alert(status);
								//Debug...
								//alert("JSONData : \n"+JSONData);
								
								var displayValue = "<h3>"
															+"���̵� : "+JSONData.userId+"<br/>"
															+"��  �� : "+JSONData.userName+"<br/>"
															+"�̸��� : "+JSONData.email+"<br/>"
															+"ROLE : "+JSONData.role+"<br/>"
															+"����� : "+JSONData.regDate+"<br/>"
															+"</h3>";
								//Debug...									
								//alert(displayValue);
								$("h3").remove();
								$( "#"+userId+"" ).html(displayValue);
							}
					});
					////////////////////////////////////////////////////////////////////////////////////////////
				
		});
		 
		 $( ".ct_list_pop td:nth-child(1)" ).css("color" , "skyblue");
		 $( ".ct_list_pop td:nth-child(3)" ).css("color" , "skyblue");
		 $("h7").css("color" , "blue");
		 $(".ct_list_pop:nth-child(4n+6)" ).css("background-color" , "whitesmoke");	
			
 });	
 
	

</script>
</head>

<body bgcolor="#ffffff" text="#000000">

<div style="width: 98%; margin-left: 10px;">

<form name="detailForm" >

<table width="100%" height="37" border="0" cellpadding="0"	cellspacing="0">
	<tr>
		<td width="15" height="37"><img src="/images/ct_ttl_img01.gif"width="15" height="37"></td>
		<td background="/images/ct_ttl_img02.gif" width="100%" style="padding-left: 10px;">
			<table width="100%" border="0" cellspacing="0" cellpadding="0">
				<tr>
					<td width="93%" class="ct_ttl01">���� �����ȸ</td>
				</tr>
			</table>
		</td>
		<td width="12" height="37"><img src="/images/ct_ttl_img03.gif"	width="12" height="37"></td>
	</tr>
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0"	style="margin-top: 10px;">
	<tr>
		<td colspan="11" >��ü ${resultPage.totalCount} �Ǽ�, ���� ${resultPage.currentPage} ������</td>
	</tr>
	<tr>
		<td class="ct_list_b" width="100">No<br>
			<h7 >(no click:���Ż�����)</h7>
			
		</td>
		
		
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">ȸ��ID
		<br>
			<h7 >(id click:ȸ��������)</h7>
		</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b" width="150">�����ڸ�</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">��ǰ��</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">������</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">�����Ȳ</td>
		<td class="ct_line02"></td>
		<td class="ct_list_b">����</td>
	</tr>
	<tr>
		<td colspan="11" bgcolor="808285" height="1"></td>
	</tr>
	
	<c:set var="i" value="0" />
	<c:forEach var="purchase" items="${list}">
		<c:set var="i" value="${ i+1 }" />
	
	
	<tr class="ct_list_pop">
		<td align="center">
			${ i }<div id=tranNoj style="display:none">${purchase.tranNo}</div>
		</td>
		<td></td>
		<td align="left">
			${purchase.buyer.userId}
		</td>
		<td></td>
		<td align="left">${purchase.receiverName}</td>
		<td></td>
		<td align="left">${purchase.purchaseProd.prodName}</td>
		<td></td>
		<td align="left">${purchase.orderDate}</td>
		<td></td>
		<td align="left">
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '0  ')}">
		�Ǹ���
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '1  ')}">
		���ſϷ� (�����)
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '2  ')}">
		����� 
		</c:if>
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '3  ')}">
		��ۿϷ� (����Ȯ��) 
		</c:if>
		
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '4  ')}">
		�������  
		</c:if>
		
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '5  ')}">
		��ǰ�Ϸ�
		</c:if>
		
		</td>
		<td></td>
		
		<td align="left">
				
		<c:if test="${! empty purchase.tranCode && (purchase.tranCode eq '2  ')}">
		<a href= "/purchase/updateTranCodeListPurchase?tranNo=${purchase.tranNo}&tranCode=3">����Ȯ��</a>
		<a href= "/purchase/updateTranCodeListPurchase?tranNo=${purchase.tranNo}&tranCode=5">��ǰ��û</a>
		</c:if>
		<c:if test="${! empty purchase.tranCode && !(purchase.tranCode eq '2  ')}">
			 
		</c:if>
		
		</td>
		
	</tr>
	<tr>
	
	
		<td id="${purchase.buyer.userId}" colspan="11" bgcolor="D6D7D6" height="1"></td>
		</tr>
	</c:forEach>
	
	
</table>

<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
	<tr>
		<td align="center">
		   <input type="hidden" id="currentPage" name="currentPage" value=""/>
		   
			<jsp:include page="../common/pageNavigator.jsp"/>	
			
    	</td>
	</tr>
</table>

<!--  ������ Navigator �� -->
</form>

</div>

</body>
</html>