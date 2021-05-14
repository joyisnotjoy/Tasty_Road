<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- Modal - 댓글 쓰기/ 수정 시 사용되는 모달창  -->
 <div class="modal fade" id="wait" role="dialog">
  <div class="modal-dialog">
   <div class="modal-content">
    <div class="modal-header">
     <button type="button" class="close" data-dismiss="modal">&times;</button>
     <h4 class="modal-title">
      <i class="fa fa-comments fa-fw"></i>
      <span id="replyModalTitle">대기열 수정</span>
     </h4>
    </div>
    <div class="modal-body">
     <form>
      <div class="form-group" id="shopNoDiv">
       <input name="shopNo" type="text" class="form-control" id="shopNo" readonly="readonly" value="${vo.no }">
      </div>
      <div class="form-group" id="nowTalbeDiv">
       <label for="now">사용 중인 Table: </label>
       <input name="now" type="text" class="form-control" id="now" readonly="readonly">
      </div>
      <div class="form-group" id="totalTableDiv">
       <label for="total">전체 Table</label>
       <input>
      </div>
     </form>
    </div>
   </div>
  </div>
 </div>
 <!-- Modal - 댓글 쓰기/ 수정 시 사용되는 모달끝  -->
</body>
</html>