<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>OneTable</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.js"></script>
</head>
<body onload="SelectAddress();SelectName()">
	
	<select id="SelectName"></select>
	<select id="SelectAddress"></select>
	&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp&nbsp
	<input type="radio" id="onesel" name="onesel" value="a">a
	<input type="radio" id="onesel" name="onesel" value="b">b
	
	
	<input type="checkbox" id="sersel" value="test1"> test1 &nbsp;
    <input type="checkbox" id="sersel" value="test2"> test2 &nbsp;
	
	<br/>
	
	Select:<br />
	<button id="Select" onclick="request_json();">Select !</button>
	
	<table border="1" id="littletable" style="text-align: center;">
		<tr id="headtable">
			<th>id:</th>
			<th>name:</th>
			<th>address:</th>
			<th>price:</th>
			<th>password:</th>
		</tr>
	</table>
	Insert: <br />
	id:<input type="text" id="id" ><br />
	name:<input type="text" id="name" ><br />
	address:<input type="text" id="address" ><br />
	price:<input type="text" id="price" ><br />
	password:<input type="text" id="password" ><br />
	id1:<input type="text" id="id1" ><br />
	name1:<input type="text" id="name1" ><br />
	address1:<input type="text" id="address1" ><br />
	price1:<input type="text" id="price1" ><br />
	password1:<input type="text" id="password1" ><br />
	<button id="Insert" onclick="InsertList()">Insert</button>
	
	<script>
	SelectAddress=function(){
		$.ajax({  
            type:"POST",  
            url:"${pageContext.request.contextPath }/Select1",
            dataType : "json",
            contentType:"application/json;charset=utf-8",  
            data:{
            	"onesel" : $("#onesel").val(),
            	},
            //data:'{"userid":1,"username":"a","userpassword":"b","useraddress":"c"}',  
            success:function(result){  
                //alert(result[1]["productId"]);
               // alert(2);
            	var tempHtml ="";
                for(var i = 0; i< result.length; i++)
                {
                	//alert(result[i]["productAddress"]);
                	tempHtml +="<option value="+result[i]["address"]+">" + result[i]["address"]+ "</option>";
                }
                $("#SelectAddress").append(tempHtml);
            },
            //<a href='javascript:BackCurPageNumIndex()'>Index</a>
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("Error,Exceptions:"+textStatus,"error");
            }
        });
	}
	
	SelectName=function(){
		$.ajax({  
            type:"POST",  
            url:"${pageContext.request.contextPath }/Select1",
            dataType : "json",
            contentType:"application/json;charset=utf-8",  
            data:{
            	//"CurPageNum" : $("#onesel").val(),
            	},
            //data:'{"userid":1,"username":"a","userpassword":"b","useraddress":"c"}',  
            success:function(result){  
                //alert(result[1]["productId"]);
                //alert(2);
            	var tempHtml ="";
                for(var i = 0; i< result.length; i++)
                {
                	//alert(result[i]["productName"]);
                	tempHtml +="<option value="+result[i]["name"]+">" + result[i]["name"]+ "</option>";
                }
                $("#SelectName").append(tempHtml);
            },
            //<a href='javascript:BackCurPageNumIndex()'>Index</a>
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("Error,Exceptions:"+textStatus,"error");
            }
        });
	}
	
	request_json=function(){
		//alert("a")
		$.ajax({  
            type:"POST",  
            url:"${pageContext.request.contextPath }/Select0",
            dataType : "json",
            contentType:"application/json;charset=utf-8",  
            data:{
            	"SelectName" : $("#SelectName").val(),
            	"SelectAddress" : $("#SelectAddress").val(),
            	//"onesel" : $("#onesel").val(),
            	//"sersal" : $("#sersel").val(),
            	},
            success:function(result){  
                //alert("a")
            	//alert(result[0]["id"]);
                var tempHtml="";
                for(var i = 0; i< result.length; i++)
                {
                	
                	tempHtml += "<tr>";
                	tempHtml += "<td>"+result[i]["id"] +"</td>";
                	tempHtml += "<td>"+result[i]["name"] +"</td>";
                	tempHtml += "<td>"+result[i]["price"] +"</td>";
                	tempHtml += "<td>"+result[i]["address"] +"</td>";
                	tempHtml += "<td>"+result[i]["password"] +"</td>";
                	tempHtml += "</tr>";
                }
                tempHtml += "</tr>";
                $("#littletable").append(tempHtml);
            },
            //<a href='javascript:BackCurPageNumIndex()'>Index</a>
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("Error,Exceptions:"+textStatus,"error");
            }
        });
	};
	
	InsertList=function(){
		//alert("1")
		var test={  "test1":{"id":$("#id").val(),"name":$("#name").val(),"address":$("#address").val(),"price":$("#price").val()},
					"test2":{"id":$("#id1").val(),"name":$("#name1").val(),"address":$("#address1").val(),"price":$("#price1").val()}};
		$.ajax({  
            type:"POST",  
            url:"${pageContext.request.contextPath }/InsertList0",
            dataType : 'json',
            contentType:"application/json;charset=utf-8",  
            data:JSON.stringify(test),
            success:function(result){  
                //alert(result[1]["productId"]);
                alert("Success !");
            },
            error : function(XMLHttpRequest, textStatus, errorThrown) {
                alert("Error,Exceptions:"+textStatus,"error");
            }
        });
	}
	</script>

</body>
</html>