<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Tasty 사다리</title>
    <link rel="stylesheet" href="../css/style.css">
    <style>
#startBtn {
	margin-left: 30px;
	margin-right: 30px;
	margin-bottom: 10px;
}

div.tableDiv {
  margin-left:50px;
}

td.hTD {
  width:100px;
  height:2px;
  background-color:#000000;
}

td.vTD {
  width:3px;
  height:25px;
  background-color:#000000;
}

td.dotTD {
  width:2px;
  height:2px;
  background-color:#000000;
}

td.blankTD {
  width:100px;
  height:2px;
}

span.txtSpan {
  width:100px;
  text-align:center;
}

input.txt {
  width:95px;
}
</style>
<script>
////////// 상수 //////////
var MAX_HORIZONTAL_BAR = 8;      //최대 가로줄 갯수
var HORIZONTAL_BAR = 0;        //가로줄
var VERTICAL_BAR = 1;        //세로줄
var DIRECTION_RIGHT = 0;      //오른쪽
var DIRECTION_LEFT = 1;        //왼쪽

////////// 상수 //////////

////////// 전역 변수 //////////
var tableRowSize = 0;        //사다리 테이블 가로 크기
var tableColSize = 0;        //사다리 테이블 세로 크기
var peopleCount = 2;        //참가자 수
var debugFlag = true;        //디버깅 플래그
var oLadderDiv = null;        //사다리 TABLE DIV
var oDebugDiv = null;        //디버그용 DIV
var oLadderTable = null;      //사다리 테이블
var ladderArray = null;        //사다리 정보 이차 배열
////////// 전역 변수 //////////

//사다리 만들기
function makeLadder() {
  initData();
  //입력한 참가자 값
  var nameArray = new Array();
  var oNames = document.getElementsByName("peopleName");
  for (var i=0; i<oNames.length; i++) {
    nameArray[i] = oNames[i].value;
  }
  //입력한 결과 값
  var resultArray = new Array();
  var oResults = document.getElementsByName("result");
  for (var i=0; i<oResults.length; i++) {
    resultArray[i] = oResults[i].value;
  }

  //사다리 테이블 DIV 내용 삭제
  oLadderDiv.innerHTML = "";

  //시작 버튼
  for (var i=0; i<peopleCount; i++) {
    var oInput = document.createElement("input");
    oInput.type = "button";
    oInput.value = "시작";
    oInput.name = "startBtn";
    oInput.id = "startBtn";
    var oSpan = document.createElement("span");
    oSpan.className = "txtSpan";
    oSpan.appendChild(oInput);
    oLadderDiv.appendChild(oSpan);
  }

  //한 줄 뛰우기
  var oDiv = document.createElement("div");
  oDiv.style.height = "10px";
  oLadderDiv.appendChild(oDiv);
  //참가자
  for (var i=0; i<peopleCount; i++) {
    var oInput = document.createElement("input");
	    oInput.type = "text";
	    oInput.className = "txt";
	    oInput.name = "peopleName";
	    oInput.id = "peopleName";
    if (i < nameArray.length) oInput.value = nameArray[i];
 		   var oSpan = document.createElement("span");
		    oSpan.className = "txtSpan";
		    oSpan.appendChild(oInput);
		    oLadderDiv.appendChild(oSpan);
  }

  //테이블 생성
  var oTable = document.createElement("table");
  oTable.border = 0;
  oTable.cellPadding = 0;
  oTable.cellSpacing = 0;
  oTable.id = "ladderTable";

  //행
  for (var i=0; i<tableRowSize; i++) {
    var oTR = document.createElement("tr");

    //열
    for (var j=0; j<tableColSize; j++) {
      var oTD = document.createElement("td");
      //class 설정
      if (j % 2 == 0) {
        if (i % 2 == 0) {
          oTD.className = "vTD";
        } else {
          oTD.className = "dotTD";
        }
      } else {
        if ((i % 2 == 1) && (i < tableRowSize -1)) {
          if (ladderArray[i][j]) {
            oTD.className = "hTD";
          }
        }
      }
      oTR.appendChild(oTD);
    }
    oTable.appendChild(oTR);
  }

  //테이블을 오른쪽으로 밀기 위한 DIV
  var oTableDiv = document.createElement("div");
  oTableDiv.className = "tableDiv";
  oTableDiv.appendChild(oTable);
  oLadderDiv.appendChild(oTableDiv);

  //결과
  for (var i=0; i<peopleCount; i++) {
    var oInput = document.createElement("input");
    oInput.type = "text";
    oInput.className = "txt";
    oInput.name = "result";
    oInput.id = "result";
    if (i < resultArray.length) oInput.value = resultArray[i];
    var oSpan = document.createElement("span");
    oSpan.className = "txtSpan";
    oSpan.appendChild(oInput);
    oLadderDiv.appendChild(oSpan);
  }

  //DIV에 테이블을 appendChild하면
  //테이블이 보여야 하는데 보이지 않아 이렇게 처리
  //Internet Explorer 7 에러?
  oLadderDiv.innerHTML = oLadderDiv.innerHTML;
  oLadderTable = document.getElementById("ladderTable");

  //시작 버튼에 이벤트 붙이기
  //시작 버튼 생성 시에 이벤트를 붙이면 실행되지 않음
  //이건 IE, FF 모두에서 발생!
  var oButtons = document.getElementsByName("startBtn");
  for (var i=0; i<peopleCount; i++) {
    addEvent(oButtons[i], "click", startGame, false);
  }
}

//데이터 초기화
function initData() {

  tableRowSize = MAX_HORIZONTAL_BAR * 2 + 1;
  tableColSize = peopleCount * 2 - 1;

  //테이블과 사다리 가로줄 배열의 크기는 같다.
  ladderArray = new Array();
  for (var i=0; i<tableRowSize; i++) {
    ladderArray[i] = new Array();
    for (var j=0; j<tableColSize; j++) {
      ladderArray[i][j] = false;
    }
  }

  //맨 첫번째와 마지막 가로줄, 세로줄을 제외한 나머지에 가로줄을 설정
  for (var i=1; i<tableColSize; i+=2) {
    var hBarCount = 0;  //한 열의 가로줄 갯수
    for (var j=1; j<tableRowSize; j+=2) {

      //1/2 확률로 가로줄 세팅
      var rate = Math.floor(Math.random() * 2);
      if (rate == 0) {
        if (checkAdjasentBar(j, i)) {
          ladderArray[j][i] = true;
          hBarCount++;
        }
      }

      //가로줄 최대 3개
      if (hBarCount >= 3) {
        j = tableRowSize;
      }
    }

    //하나도 없을 경우 재시작
    if (hBarCount == 0) {
      i-=2;  //i를 감소시키면 자동 증가해서 값이 변하지 않아 재시작
    }
  }
}

//왼쪽 열에 가로줄이 있는지 체크
function checkAdjasentBar(i, j) {
  //좌: i, j-2
  if (j-2 >= 0 && ladderArray[i][j-2]) return false;
  return true;
}

//이벤트 붙이기
function addEvent(elm, evType, fn, useCapture) {
  if (elm.addEventListener) {
    elm.addEventListener(evType, fn, useCapture);
  }
  else if (elm.attachEvent) {
    elm.attachEvent('on'+evType, fn);
  }
}

//참가자 추가
function addPeople() {
  peopleCount++;
  makeLadder();
}

//참가차 삭제
function deletePeople() {
  if (peopleCount == 2) return;
  peopleCount--;
  makeLadder();
}

//게임 시작
function startGame(evt) {
  var targetE;
  if (!evt) {
    evt = window.event;
  }
  if (evt.target) {
    targetE = evt.target;
  } else if (evt.srcElement) {
    targetE = evt.srcElement;
  }
  if (targetE.nodeType==3) {
    targetE = targetE.parentNode;
  }

  //어떤 시작 버튼을 눌렀는지 알아낸다
  var selectedIndex = -1;
  var oButtons = document.getElementsByName("startBtn");
  for (var i=0; i<oButtons.length; i++) {
    if (oButtons[i] == targetE) {
      selectedIndex = i;
      break;
    }
  }
 
  //테이블 색 지우기
  for (var i=0; i<tableRowSize; i++) {
    for (var j=0; j<tableColSize; j++) {
      var oCell = oLadderTable.rows[i].cells[j];
      if (oCell.className != "")
        oCell.style.backgroundColor = "#000000";
    }
  }

  //선택한 참가자 표시
  var sColor = getRandomColor();
  var oNames = document.getElementsByName("peopleName");
  oNames[selectedIndex].style.backgroundColor = sColor;

  //시작
  findRoute(VERTICAL_BAR, DIRECTION_RIGHT, 0, selectedIndex * 2);

  //결과 표시 
  endColIndex = Math.floor(endColIndex / 2);
  var oResults = document.getElementsByName("result");
  oResults[endColIndex].style.backgroundColor = sColor;
}

//무작위 색 코드 조회
function getRandomColor() {
  var sColor = getRandomHexaNumber() + getRandomHexaNumber() + getRandomHexaNumber() +
        getRandomHexaNumber() + getRandomHexaNumber() + getRandomHexaNumber();
  return "#"+sColor;
}

var hexaArray = new Array("0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "a", "b", "c", "d", "e", "f");

//무작위 16진수 숫자 조회
function getRandomHexaNumber() {
  var randomNum = Math.floor(Math.random() * 5) + 10;
  return hexaArray[randomNum];
}

var endColIndex = 0;

function findRoute(barType, direction, startRowIndex, startColIndex) {

  //가로 체크
  if (barType == HORIZONTAL_BAR) {
    //끝
    if (startRowIndex > tableRowSize - 1) {
      endColIndex = startColIndex;
      return;
    }
    //점 칠하기
    fillColor(startRowIndex, startColIndex);
    if (direction == DIRECTION_RIGHT) {
      //밖으로 벗어나지 않았을 경우
      if (startColIndex + 1 < tableColSize) {
        //오른쪽 가로줄이 있을 경우
        if (ladderArray[startRowIndex][startColIndex+1]) {
          fillColor(startRowIndex, ++startColIndex);  //가로줄 칠하기
          fillColor(startRowIndex, ++startColIndex);  //점 칠하기
        }

        //왼쪽 가로줄이 있을 경우
        else if (ladderArray[startRowIndex][startColIndex-1]) {
          fillColor(startRowIndex, --startColIndex);  //가로줄 칠하기
          fillColor(startRowIndex, --startColIndex);  //점 칠하기
          direction = DIRECTION_LEFT;
        }
      } else {

        //왼쪽 가로줄이 있을 경우
        if (ladderArray[startRowIndex][startColIndex-1]) {
          fillColor(startRowIndex, --startColIndex);  //가로줄 칠하기
          fillColor(startRowIndex, --startColIndex);  //점 칠하기
        }

        //밖으로 벗어나면 방향 바꿈
        direction = DIRECTION_LEFT;
      }
    } else if (direction == DIRECTION_LEFT) {

      //밖으로 벗어나지 않았을 경우
      if (startColIndex - 1 >= 0) {

        //왼쪽 가로줄이 있을 경우
        if (ladderArray[startRowIndex][startColIndex-1]) {
          fillColor(startRowIndex, --startColIndex);  //가로줄 칠하기
          fillColor(startRowIndex, --startColIndex);  //점 칠하기
        }
        //오른쪽 가로줄이 있을 경우
        else if (ladderArray[startRowIndex][startColIndex+1]) {
          fillColor(startRowIndex, ++startColIndex);  //가로줄 칠하기
          fillColor(startRowIndex, ++startColIndex);  //점 칠하기
          direction = DIRECTION_RIGHT;
        }
      } else {
        //오른쪽 가로줄이 있을 경우
        if (ladderArray[startRowIndex][startColIndex+1]) {
          fillColor(startRowIndex, ++startColIndex);  //가로줄 칠하기
          fillColor(startRowIndex, ++startColIndex);  //점 칠하기
        }

        //밖으로 벗어나면 방향 바꿈
        direction = DIRECTION_RIGHT;
      }
    }
   
    //탐색
    findRoute(VERTICAL_BAR, direction, startRowIndex+1, startColIndex);
 
  //세로 체크
  } else if (barType == VERTICAL_BAR) {

    //세로줄 칠하기
    fillColor(startRowIndex, startColIndex);

    //탐색
    findRoute(HORIZONTAL_BAR, direction, startRowIndex+1, startColIndex);
  }
}

function fillColor(i, j) {
  if (i < 0 || i >= tableRowSize) return;
  if (j < 0 || j >= tableColSize) return;
  var oCell = oLadderTable.rows[i].cells[j];
  oCell.style.backgroundColor = "#ff0000";
}
 
//디버깅용 출력
function print(s) {
  if (!debugFlag) return;
  oDebugDiv.innerHTML += s;
}

//화면 초기화(onload)
function initPage() {

  //객체 초기화
  oLadderDiv = document.getElementById("ladderDiv");
  oDebugDiv = document.getElementById("debugDiv");
  makeLadder();
}
</script>
</head>
<body onload="initPage();">
<form name="ladderForm">
<!-- 참가차 추가, 삭제 -->
<input type="button" value="인원 추가" onclick="addPeople();">
<input type="button" value="삭제" onclick="deletePeople();">
<br><br>
<!-- 사다리 테이블 DIV -->
<div id="ladderDiv"></div>
<br><br>

<div id="debugDiv"></div>

</form>
</body>

</html>