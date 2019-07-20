<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>

<head>

<meta charset="UTF-8">
<title>Scripting Tag</title>

</head>

<body>
	<h2>Scripting Tag</h2>
	
	<!-- 아래와 같이 HTML 내부에서 자바코드를 쓸 수 있는것이 JSP 다. -->
	
	<%! 
		// 선언문 태그. 
		// ! 기호 있는게 선언문. 변수를 선언할 수 있다. 필드에 선언함.
		// 전역변수가 됨.
		// _jspService() 밖에 선언되서 그럼.
		int count = 3 ;
		
		String makeItLower(String data) {
			
			return data.toLowerCase();
			
		}
		
	%>
	
	<%	
		// 스크립틀릿 태그.
		// 아무것도 없는건 자바 로직 코드.
		// 코드가 _jspService() 안에 들어감.
		for (int i = 1; i <= count; i++) {
			
			out.println("Java Server Pages " + i + ".<br>");
			
		}
	
	%>
	
	<%= 
		// 표현문 태그.
		// 변수, 계산식, 메소드 호출 결과를 문자열 형태로 출력하는데 사용.
		makeItLower("Hello World")
	
	%>
	
	<%! // 선언문 태그는 이렇게 아래에 선언해도 위에서 쓸 수 있다.
	
		public int myMethod(int count) {
		
			return ++count;
		
		}
	
	%>
	
	

</body>
</html>