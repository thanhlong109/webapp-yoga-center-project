/*
	lấy ra thời khóa biểu của 1 user có id = 2
*/
select * from tblAccount a join tblRegistrationCourse rc on (a.account_id=2 and a.account_id = rc.account_id)
join tblCourse c on rc.course_id = c.course_id
join tblClassSchedule cs on rc.registration_id = cs.registration_id
join tblTimeSchedule ts on cs.time_schedule_id = ts.time_schedule_id

/*
	lấy ra các môn học mà user id = 2 đã đăng ký
*/
select * from tblAccount a join tblRegistrationCourse rc on (a.account_id=2 and a.account_id = rc.account_id)
join tblCourse c on rc.course_id = c.course_id

/*
	lấy ra các khung giờ học khác nhau của course có id = 1
*/
select * from tblCourse c join tblTimeSchedule ts on (  c.course_id=2 and c.course_id = ts.course_id)

