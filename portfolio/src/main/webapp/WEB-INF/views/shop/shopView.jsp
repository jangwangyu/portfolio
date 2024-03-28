<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html lang="Ko"> 
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Home</title>
    <link href="/css/layout.css" rel="stylesheet" type="text/css" />
    <link href="/css/shopView.css" rel="stylesheet" type="text/css" />
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>
<body id="main">
    <div id="wrap">
        <jsp:include page="/WEB-INF/views/Interface/interface.jsp"/>
        <!-- 본문 -->
        <div id="container">
        	<div id="contents">
				<div class="all_width">
					<div class="headcategory path">
						<span>현재위치</span>
					</div>
					<div class="x-product x-product-detail">
						<div class="detailArea" style="min-height:auto;">
							<div class="x-product-image imgArea">
								<div class="keyImg">
									<div class="thumbnail">
										<img src="${view.gdsImg }">
									</div>
								</div>
							</div>
								<div class="infoArea">
									<form role="form" method="post">
										<input type="hidden" id="gdsNum" name="gdsNum" value="${view.gdsNum}" />
									</form>
									<div class="headingArea">
										<h2>${view.gdsName }</h2>
									</div>
									<span class="x-product x-product-additional simple">
										<b>
											gdsdes
										</b>
									</span>
									<div id="detail_table" class="x-product x-product-detaildesign">
										<table border="1">
											<tbody>
												<tr title="판매가" class="x-record">
													<th scope="row">
														<span style="font-size:12px; color:#555555;">판매가</span>
													</th>
													<td>
														<span style="font-size:12px; color:#555555;">
															<strong id="span_product_price_text">${view.gdsPrice}원</strong>
														</span>
														<input id="gdsPrice" name="gdsPrice" value="gdsPrice" type="hidden">
													</td>
												</tr>
											</tbody>
										</table>
										<table border="1" class="x-product x-product-option x-record-">
											<tbody class="x-product x-product-option x-record-">
												<tr>
													<th scope="row">사이즈</th>
													<td>
														<select class="ProductOption0">
															<option value="*">- [필수] 옵션을 선택해 주세요 -</option>
															<option value="**" disabled>-------------------</option>
															<option value="M">M</option>
															<option value="L">L</option>
														</select>
													</td>
												</tr>
											</tbody>
											<tbody class="x-product x-product-option x-record-">
												<tr>
													<th scope="row">색상</th>
								                    <td>
									                    <select class="ProductOption0">
									                    	<option value="*">- [필수] 옵션을 선택해 주세요 -</option>
									                    	<option value="**">-------------------</option>
									                    	<option value="">asd</option>
									                    </select>
								                    </td>
								                </tr>
							                </tbody>
										</table>
										<table border="1">
											<colgroup>
												<col style="width:284px;">
												<col style="width:80px;">
												<col style="width:110px;">
											</colgroup>
											<tr>
												<th scope="col">상품명</th>
						                        <th scope="col">상품수</th>
						                        <th scope="col">가격</th>
						                    </tr>
						                    <tbody class="option_product">
						                    	<tr class="option_product ">
							                    	<td>
							                    		<p class="product">${view.gdsName }
								                    		<br> - 
								                    		<span></span>
								                    	</p>
								                    </td>
							                    	<td>
							                    		<span class="quantity" style="width:65px;">
							                    			<input type="number" id="option_box1_quantity" class="quantity_opt eProductQuantityClass numBox" min="1" max="${view.gdsStock}" value="1" readonly="readonly">
							                    			<a href="#none" class="up eProductQuantityUpClass">
							                    			<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_up.gif" id="option_box1_up" class="option_box_up" alt="수량증가">
							                    		</a>
							                    		<a href="#none" class="down eProductQuantityDownClass" data-target="option_box1_down">
							                    			<img src="//img.echosting.cafe24.com/design/skin/default/product/btn_count_down.gif" id="option_box1_down" class="option_box_down" alt="수량감소">
							                    		</a>
							                    		</span>
							                    	</td>
							                    	<td class="right">
							                    		<span id="option_box1_price">
							                    			<input type="hidden" class="option_box_price">
							                    			<span class="ec-front-product-item-price">${view.gdsPrice }원</span>
							                    		</span>
							                    	</td>
							                    </tr>
						                    </tbody>
										</table>
										<div id="totalPrice" class="totalPrice">
							                <strong>총 상품금액</strong>
							                	(수량) :
							                <span class="total">
								                <strong><em>0원</em></strong> 
								                (0개)
							                </span>
							            </div>
										<div class="x-product x-product-action ">
											<div class="ec-base-button gColumn">
							                    <a href="#none" class="btnSubmit sizeXL p_bg " onclick="" id="bt_buynow">
							                        <span id="btnBuy">바로 구매하기</span>
							                    </a>
							                    <button type="button" class="btnNormal sizeXL addCart_btn">장바구니</button>
							                    <a href="#none" onclick="#" class="btnNormal sizeXL " id="bt_wish">♥</a>
							                </div>
											<!-- 네이버 체크아웃 구매 버튼 -->
											<div id="NaverChk_Button" style="display: block;">
												<div id="#" class="npay_type_A_2">	
													<div id="NPAY_BUTTON_BOX_ID" class="npay_button_box ">		
														<div class="npay_button">			
															<div class="npay_text">
																<span class="npay_blind">NAVER 네이버 ID로 간편구매 네이버페이</span>
															</div>				
															<table class="npay_btn_list" cellspacing="0" cellpadding="0">
																<tbody>
																	<tr>    
																		<td class="npay_btn_item"> 
																		   	<a id="" href="#" class="npay_btn_link npay_btn_pay btn_green" style="box-sizing:content-box; " title="새창">
																		   		<span class="npay_blind">네이버페이 구매하기</span>
																		   	</a>    
																		</td>    
																		<td class="npay_btn_item btn_width">        
																			<a id="#" href="#" class="npay_btn_link npay_btn_zzim " style="box-sizing:content-box; " title="새창">
																				<span class="npay_blind">찜하기</span>
																			</a>    
																		</td>
																	</tr>
																</tbody>
															</table>		
														</div>		
													</div>
												</div>
											</div>
										</div>
									</div>
								</div>
						</div>
					</div>
					<div class="x-product x-product-additional">
						<div id="prdDetail" class="detail_tab">
							<div class="cont">
								<div style="text-align:center;">
									<p style="font-size: 9pt; text-align:center;">${view.gdsDes }</p>
								</div>
							</div>
						</div>
					</div>
				</div>        	
			<jsp:include page="/WEB-INF/views/Interface/footer.jsp"/>
        	</div>
    	</div>
    </div>
</body>
<script>
	$(".up").click(function(){
   		var num = $(".numBox").val();
   		var plusNum = Number(num) + 1;
   
   		if(plusNum >= ${view.gdsStock}) {
    		$(".numBox").val(num);
   		} else {
    		$(".numBox").val(plusNum);          
   		}
  	});
  
  	$(".down").click(function(){
   		var num = $(".numBox").val();
   		var minusNum = Number(num) - 1;
   
   		if(minusNum <= 0) {
    		$(".numBox").val(num);
   		} else {
    		$(".numBox").val(minusNum);          
   		}
  	});
</script>
<script>
	$(".addCart_btn").click(function(){
		
		var gdsNum = $("#gdsNum").val();
		var cartStock = $(".numBox").val();
		
		console.log("gdsNum : " + gdsNum);
		console.log("cartStock : " + cartStock);
		
		var data = {
				gdsNum : gdsNum,
				cartStock : cartStock
			};
		
		$.ajax({
			url : "/shop/addCart",
			type : "post",
			data : data,
			success : function(result){
				if(result == "true"){
					alert("장바구니에 담았습니다")
					$(".numBox").val("1");
				}else{
					alert("로그인이 필요한 서비스입니다.")
					$(".numBox").val("1")
				}
			},
			error : function(){
				alert("장바구니 담기 실패")				
			}
		});
	});
</script>
</html>