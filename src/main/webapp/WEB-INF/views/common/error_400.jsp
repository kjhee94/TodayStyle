<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>오늘 뭐 입지?</title>
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR:wght@400;500;700&display=swap" rel="stylesheet">

	<style>
		#div1{
            width: 100%;
            height: 100%;
			position: absolute;
            top: 0;
            left: 0;
            
		}
		#div2{         
			width: 300px;
			height: 100px;
			    
			position: absolute;
            top: 50%;
            left: 50%;       
            margin-top: -150px;
            margin-left: -150px;   
            text-align: center; 
            
		}
		#error{            

            font-family: 'Noto Sans KR', sans-serif;
            font-size: 35px;
            font-weight: 700;
            color: #707070;
            margin: 0 auto;
		}
		#content{            
            font-family: 'Noto Sans KR', sans-serif;
            font-size: 20px;
            font-weight: 500;
            color: #707070;
            margin: 0 auto;
		}

	</style>
</head>
<body>
	<div id="div1">
		<div id="div2">
			<div id="error">error :(</div>
			<div id="content">잘못된 접근입니다.</div>
		</div>
	</div>
</body>
</html>