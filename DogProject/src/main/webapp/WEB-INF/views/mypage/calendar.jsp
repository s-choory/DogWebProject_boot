<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
  <meta charset="UTF-8">
  <!-- fullcalendar 경로 -->
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<link href='resources/fullcalendar-5.11.5/lib/main.css' rel='stylesheet' />
<script src='resources/fullcalendar-5.11.5/lib/main.js'></script>
<!-- 부트스트랩 -->
<!-- <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-HwwvtgBNo3bZJJLYd8oVXjrBZt8cqVSpeBNS5n7C8IVInixGAoxmnlMuBnhbgrkm" crossorigin="anonymous"></script>
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-4bw+/aepP/YC94hEpVNVgiZdgIC5+VKNBQNGCHeKRQN+PtmoHDEXuppvnDJzQIu9" crossorigin="anonymous"> -->
 <script>

 		var calendar = null;
        var initialLocaleCode = 'ko';
        var localeSelectorEl = document.getElementById('locale-selector');
        
            $(document).ready(function (){
 
                $(function () {
                    var request = $.ajax({
                        url: "mypage/calendar", // 변경하기
                        method: "GET",
                        dataType: "json",
                        contentType: 'application/json' // 일단 이거 추가함
                    });
                    request.done(function (data) {
                        console.log(data); // log 로 데이터 찍어주기.
                        var calendarEl = document.getElementById('calendar');
                        calendar = new FullCalendar.Calendar(calendarEl, {
                            initialView: 'dayGridMonth',
                            timeZone: 'Asia/Seoul', // 서울 시간대로 설정 이거 설정안하면 시간꼬임
                            headerToolbar: {
                                left: 'prev,next today',
                                center: 'title',
                                right: 'dayGridMonth,timeGridWeek,timeGridDay,listWeek'
                            },
                        //    allDaySlot: false,  // 이거를 어떻게 해야하나
                            navLinks: true,
                            editable: true,
                            selectMirror: true,
                            dayMaxEvents: true,
                            selectable: true,
                            droppable: true,
                            // eventAdd: function () { // 이벤트가 추가되면 발생하는 이벤트
                            //     // console.log()
                            // },
 
                          	/* 드래그로 이벤트 수정하기 */
                        eventDrop: function (info){
 
                            if(confirm("'"+ info.event.title +"'일정을 수정하시겠습니까 ?")){
 
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();
 
                            obj.title = info.event._def.title;
                            obj.start = info.event._instance.range.start;
                            obj.end = info.event._instance.range.end;
 
                            obj.oldTitle = info.oldEvent._def.title;
                            obj.oldStart = info.oldEvent._instance.range.start;
                            obj.oldEnd = info.oldEvent._instance.range.end;
 
                            events.push(obj);
 
                            console.log(events);
                            }else{
                                // Get 방식으로 데이터를 조회해서 가져와야하는데 새로고침 하지 않고는 어떻게
                                // 해야할지 감이 안잡혀서 우선 reload 방식으로..
                                location.reload();
                            }
                            $(function modifyData() { //수정
                                $.ajax({
                                    url: "mypage/calendar/updateEvent",
                                    method: "PATCH",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                            })
 
 
                        }, // end eventDrop
                            eventResize: function (info){
                                console.log(info);
                                if(confirm("'"+ info.event.title +"'일정을 Resize 하시겠습니까 ??")){
 
                                var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                                var obj = new Object();
 
                                obj.title = info.event._def.title;
                                obj.start = info.event._instance.range.start;
                                obj.end = info.event._instance.range.end;
 
                                obj.oldTitle = info.oldEvent._def.title;
                                obj.oldStart = info.oldEvent._instance.range.start;
                                obj.oldEnd = info.oldEvent._instance.range.end;
 
                                events.push(obj);
 
                                console.log(events);
                                }else{
                                    location.reload();
                                }
                                $(function modifyData() {
                                    $.ajax({
                                        url: "mypage/calendar/updateEvent",
                                        method: "PATCH",
                                        dataType: "json",
                                        data: JSON.stringify(events),
                                        contentType: 'application/json',
                                    })
                                })
                            }, // end eventResize
 
                        	 /* 드래그로 이벤트 추가하기 */
                        select: function (arg) { // 캘린더에서 이벤트를 생성할 수 있다.
 							//여기서 모달창 띄우기
                            var title = prompt('일정을 입력해주세요.');
                            if (title) {
                                calendar.addEvent({
                                    title: title,
                                    start: arg.start,
                                    end: arg.end,
                                    allDay: arg.allDay
                                })
                            }
 
                            console.log(arg);
 
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();     // Json 을 담기 위해 Object 선언
 
                                obj.title = title; 
                                obj.start = arg.start; 
                                obj.end = arg.end;
                                events.push(obj);
                            var jsondata = JSON.stringify(events);
                            console.log("selectfun: "+jsondata);
 
 
                            $(function saveData(jsondata) {
                                $.ajax({
                                    url: "mypage/calendar/addEvent",
                                    method: "POST",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                                     .done(function (events) {
                                  //    alert(events);
                                      })
                                     .fail(function (request, status, error) {
                                  //    alert("에러 발생" + error);
                                      console.log("saveData 에러"+ error);
                                     });
                                calendar.unselect()
                            });
                        },
 
                         	/* 이벤트 선택해서 삭제하기 */
                        eventClick: function (info){
                            if(confirm("'"+ info.event.title +"'일정을 삭제하시겠습니까 ?")){
                                // 확인 클릭 시
                                info.event.remove();
 
                            console.log(info.event);
                            var events = new Array(); // Json 데이터를 받기 위한 배열 선언
                            var obj = new Object();
                                obj.title = info.event._def.title;
                                obj.start = info.event._instance.range.start;
                                obj.end = info.event._instance.range.end;
                                events.push(obj);
 
                            console.log(events);
                            } //end if
                            
                            $(function deleteData(){
                                $.ajax({
                                    url: "mypage/calendar/deleteEvent",
                                    method: "DELETE",
                                    dataType: "json",
                                    data: JSON.stringify(events),
                                    contentType: 'application/json',
                                })
                                	.done(function (events) {
                                    alert(events);
                                    })
                                   .fail(function (request, status, error) {
                               //     alert("에러 발생" + error);
                                    console.log("삭제에러"+ error);
                                   });
                            })
                        },
                            locale: 'ko',
                            // eventRemove: function (obj) { // 이벤트가 삭제되면 발생하는 이벤트
                        //
                        // },
                            events: data
                        });
                        calendar.render();
                        
                    }); // end request.done
 
                    });
 
        });
    </script>
     <style>
    #calendar {
            max-width: 1100px;
            margin: 40px auto;
            padding: 0 10px;
        }
    </style> 
    
<title>MyCalendar</title>
</head>
<!-- 바디바디 -->

