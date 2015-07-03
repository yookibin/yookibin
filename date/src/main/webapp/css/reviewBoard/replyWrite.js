/**
 * 
 */
var root=null;

function writeToServer(requestRoot,place_code){
    alert("확인");
    root=requestRoot;
    
    alert("dd:"+root+","+place_code);
    
    var writeReply=$("#writeReply").val();
    var sendData="place_code="+place_code+"&lineReply="+writeReply;
    var replyurl=root+"/reviewBoard/replyWrite.do?"+sendData;
    //.json 사용 할껏이다
    
    $.ajax({
      url:replyurl, 
      type:"get",
      dataType:"text",
    /*  success:function(data){
          var result=data.split(",");
          var bunho=result[0].trim();         //배열임 json아님
          var reply=result[1].trim();
          alert(bunho+"|"+reply);
          
          var spanBunho=document.createElement("span");
          spanBunho.className="cssBunho";
          spanBunho.innerHTML=bunho;
          
          var spanReply=document.createElement("span");
          spanReply.className="cssReply";
          spanReply.innerHTML=reply;
          
          var spanUpDel=document.createElement("span");
          spanUpDel.className="cssUpDel";
          
          var aUpdate=document.createElement("a");
          aUpdate.href="javascript:upSelectToServer("+bunho+",\'"+root+"\')";
          aUpdate.innerHTML="수정 &nbsp";
          
          
          var aDelete=document.createElement("a");
          aDelete.href="javascript:deleteToServer("+bunho+",\'"+root+"\')";
          aDelete.innerHTML="삭제 ";
          
          spanUpDel.appendChild(aUpdate);
          spanUpDel.appendChild(aDelete);
          
          
          
          div.appendChild(spanBunho);
          div.appendChild(spanReply);
          div.appendChild(spanUpDel);
          //newReply.appendChild(div);
          newReply.insertBefore(div,newReply.firstChild);
         
      },
      error:function(xhr,status,error){
         alert(xhr+","+status+","+error);
      }
      */
    });
}
 