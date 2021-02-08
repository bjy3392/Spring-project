<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<c:set var="contextPath" value="${pageContext.request.contextPath }"/>
<%@ include file="/WEB-INF/views/include/nav.jsp" %>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title>SUBWAY</title>
	<style>
	    #td1,#td8,#td15,#td22,#td29,#td36 {
	      color: red;
	    }
	
	    #td7,#td14,#td21,#td28,#td35,#td42 {
	      color: blue;
	    }
	
	    .today {
	      background-color: #f94e3f;
	      font-size: 1.5em;
	      /* font-family: cursive; */
	      /* color: #fff; */
	    }
  	</style>
</head>
<body>
	<div class="w3-content" style="max-width: 1200px; margin-top: 250px">
		<div class="container" style="margin-top: 30px;margin-bottom: 30px;">
    <div class="row">
      <div class="col-sm-12" style="font-size:1.8em;text-align:center;">
			  - 매출관리 -
			  		
      </div>
      <div class="col-sm-12">
        <br/>  
      </div>
      <div class="col-sm-12" style="font-size: 1.4em;text-align: center;">
        <button class="btn btn-secondary btn-sm" onclick="location.href='${contextPath }/store/viewSalesCalendar?yy=${yy-1}&mm=${mm}'" title="이전년도">◁◁</button>
        <button class="btn btn-secondary btn-sm" onclick="location.href='${contextPath }/store/viewSalesCalendar?yy=${yy}&mm=${mm-1}'" title="이전월">◀</button>
        &nbsp; <font size="5">${yy}년 ${mm+1}월 </font> &nbsp;
        <button class="btn btn-secondary btn-sm" onclick="location.href='${contextPath }/store/viewSalesCalendar?yy=${yy}&mm=${mm+1}'" title="다음월">▶</button>
        <button class="btn btn-secondary btn-sm" onclick="location.href='${contextPath }/store/viewSalesCalendar?yy=${yy+1}&mm=${mm}'" title="다음년도">▷▷</button>
        &nbsp; &nbsp;
        <button class="btn btn-secondary" onclick="location.href='${contextPath }/store/viewSalesCalendar'" title="오늘날짜"><i class="fa fa-home"></i></button>
        <button class="btn btn-secondary" onclick="location.href='${contextPath }/store/viewAnalysisChart'">그래프 보기</button>
      </div>
    </div>
    <div class="col-sm-12">
      <br/>
    </div>
    <div class="row">
      
      <div class="col-sm-12" style="text-align:left;height:auto;">
        <table class="table table-bordered" style="height:100%">
          <tr style="text-align:center;font-size:1em;background-color:#eee;height:10%">
            <th style="color:red;width:13%;vertical-align:middle;">일</th>
            <th style="width:13%;vertical-align:middle;">월</th>
            <th style="width:13%;vertical-align:middle;">화</th>
            <th style="width:13%;vertical-align:middle;">수</th>
            <th style="width:13%;vertical-align:middle;">목</th>
            <th style="width:13%;vertical-align:middle;">금</th>
            <th style="color:blue;width:13%;vertical-align:middle;">토</th>
          </tr>
          <tr>
            
            <c:set var="cnt" value="1"/>

              <!-- 이전월의 마지막 날짜를 출력하는 부분 -->
              <c:forEach var="preDay" begin="${preLastDay - (startWeek - 2) }" end="${preLastDay}">
                <td id="td${cnt}" style="color: #ddd;font-size:0.6em">
                  ${preYear}-${preMonth+1}-${preDay}
                </td>
                <c:set var="cnt" value="${cnt=cnt+1}"/>
              </c:forEach>

              <!-- 해당월에 대한 날짜를 반복 출력 -->
              <c:forEach begin="1" end="${lastDay}" varStatus="st">
                
								<c:set var="ymd">${yy}-${mm+1}-${st.count}</c:set>
                <c:set var="todaySw" value="${yy == toYear && mm == toMonth && st.count == toDay ? 1 : 0}"/>
                <td id="td${cnt}" ${todaySw == 1 ? 'class=today' : '' } style="font-size:0.9em;padding:8px;" onclick="newWinCheck('${ymd}')">
                  ${st.count}
                  <c:if test="${!empty memoryArr[st.count-1]}"><br/>${memoryArr[st.count-1]}</c:if>
                </td>
                <c:if test="${cnt % 7 == 0}">
                  </tr><tr>
                </c:if>
                <c:set var="cnt" value="${cnt=cnt+1}"/>
              </c:forEach>

               <!-- 다음월의 날짜를 출력한다. -->
               <c:forEach begin="${nextStartWeek}" end="7" varStatus="nextDay">
                <td id="td${cnt}" style="color:#ddd;font-size:0.6em">
                  ${nextYear}-${nextMonth+1}-${nextDay.count}
                </td>
                <c:set var="cnt" value="${cnt=cnt+1}"/>
              </c:forEach>

          </tr>
        </table>
      </div>
    </div>
  </div>
	</div>
</body>
<%@ include file="/WEB-INF/views/include/footer.jsp" %>
</html>