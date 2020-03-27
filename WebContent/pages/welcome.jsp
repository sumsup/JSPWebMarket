<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.Date" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Welcome</title>

</head>

<body>

	<%@ include file="menu.jsp" %>
	

	<%!
	
		String greeting = "웹 쇼핑몰에 오신 것을 환영 합니다";
		String tagline = "Welcome to Web Market!";
		
	%>
	
	<div class="jumbotron">
		<div class="container">
			<h1 class="display-3">
			
				<h1> <%= greeting %> </h1>
				
			</h1>
		</div>
	</div>

	<div class="container">
		<div class="text-center">
		
			<h3> <%= tagline %> </h3>
			<%
			
				response.setIntHeader("Refresh", 5); // 5초마다 화면을 갱신.
				
				Date day = new java.util.Date(); // 현재 날짜와 시간을 얻어온다.
				String am_pm; // am과 pm
				
				int hour = day.getHours(); // 시간.
				int minute = day.getMinutes(); // 분.
				int second = day.getSeconds(); // 초.
				
				if(hour / 12 == 0) {
					// 시간을 12로 나눈게 0이라는 소리는? 밤 12시 이후부터 아침 12시 까지를 12로 나누면,
					// hour는 int 형 이기 때문에 오전에는 0으로 나옴.
					// ex) 새벽 1시 일 때 : 1 / 12 = 0.083333.. 임. int 형 이므로 소숫점 아래는 인식 못함. 그래서 0.
					
					am_pm = "AM"; // 그래서 오전 시간일때는 hour / 12 하면 0이 나오므로 AM 으로 저장. 
					
				} else {
					
					am_pm = "PM";
					hour = hour - 12; // 24시 체계에서는 12를 빼야 함.
					
				}
				
				String CT = hour + ":" + minute + ":" + second + " " + am_pm;
				out.println("현재 접속 시각: " + CT + "\n");
				
			%>
			
		</div>
		<hr>
	</div>
	
	<%@ include file="footer.jsp" %>
	
</body>

</html>