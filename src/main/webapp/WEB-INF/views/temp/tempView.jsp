<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Temp</title>
</head>
<body>
 <div class="container">
  <h1>게시판 글 보기</h1>
  <button type="button">like</button><br>
  <button type="button">unlike</button><br>
  <ul class="list-group">
   <li class="list-group-item row">
    <div class="col-md-2 title_label">가게명</div>
    <div class="col-md-10">${vo.shopName }</div>
   </li>
   <li class="list-group-item row">
    <div class="col-md-2 title_label">사업자번호</div>
    <div class="col-md-10">${vo.shopNo }</div>
   </li>
   <li class="list-group-item row">
    <div class="col-md-2 title_label">총 자리</div>
    <div class="col-md-10"><pre>${vo.total }</pre></div>
    <button type="button">&#43;</button><br>
    <button type="button">&#45;</button><br>
   </li>
   <li class="list-group-item row">
    <div class="col-md-2 title_label">현재 자리</div>
    <div class="col-md-10">${vo.now }</div>
    <button type="button">&#43;</button><br>
    <button type="button">&#45;</button><br>
   </li>
   <li class="list-group-item row">
    <div class="col-md-2 title_label">대기열</div>
    <div class="col-md-10">${vo.wait }</div>
   </li>
  </ul>
 </div>
</body>
</html>