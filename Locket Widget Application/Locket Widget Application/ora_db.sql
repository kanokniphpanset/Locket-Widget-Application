---------------------------------------------------------------------users-----------------------------------------------------------------------------------------------------------------------
CREATE TABLE users (
    user_id        CHAR(20 CHAR) NOT NULL,
    username     VARCHAR2(180 CHAR),
    password       VARCHAR2(100 CHAR),
    email               VARCHAR2(180 CHAR),
    tel_num        VARCHAR2(100 CHAR),
    profilepic         VARCHAR2(255 CHAR),
    CONSTRAINT user_userid PRIMARY KEY (user_id)
);


------------------------------------------------------------------------------------Post---------------------------------------------------------------------------------------------------
CREATE TABLE post (
    post_id     CHAR(10 CHAR) NOT NULL,
    photopath   VARCHAR2(255 CHAR),
    caption     VARCHAR2(180 CHAR),
    upload_date DATE,
    CONSTRAINT post_postid PRIMARY KEY (post_id)
);


------------------------------------------------------------------------------------Albums-----------------------------------------------------------------------------------------------
CREATE TABLE albums (
    albumid    CHAR(10 CHAR) NOT NULL,
    albumname  VARCHAR2(180 CHAR),
    createdate DATE,
    user_id    CHAR(20 CHAR) NOT NULL,
    CONSTRAINT albums_albumid PRIMARY KEY (albumid),
    CONSTRAINT albums_fk_users FOREIGN KEY (user_id) REFERENCES users(user_id)
);


------------------------------------------------------------------------------------Admin------------------------------------------------------------------------------------------------
CREATE TABLE admin (
    adminid   CHAR(10 CHAR) NOT NULL,
    name      VARCHAR2(180 CHAR),
    email         VARCHAR2(180 CHAR),
    position    VARCHAR2(180 CHAR),
    phone_num VARCHAR2(180 CHAR),
    CONSTRAINT admin_adminid PRIMARY KEY (adminid)
);



------------------------------------------------------------------------------------Report------------------------------------------------------------------------------------------------
CREATE TABLE report (
    report_id      CHAR(10 CHAR) NOT NULL,
    report_date    DATE,
    status            VARCHAR2(255 CHAR),
    report_message VARCHAR2(255 CHAR),
    user_id        CHAR(20 CHAR) NOT NULL,
    post_id        CHAR(10 CHAR) NOT NULL,
    admin_id CHAR(10 CHAR) NOT NULL,
    CONSTRAINT report_reportid PRIMARY KEY (report_id),
    CONSTRAINT report_fk_users FOREIGN KEY (user_id) REFERENCES users(user_id),
    CONSTRAINT report_fk_post FOREIGN KEY (post_id) REFERENCES post(post_id),
    CONSTRAINT report_fk_admin FOREIGN KEY (admin_id) REFERENCES admin(adminid)
);



------------------------------------------------------------------------------------messages--------------------------------------------------------------------------------------------
CREATE TABLE messages (
    messageid       CHAR(10 CHAR) NOT NULL,
    datesend        DATE,
    message         VARCHAR2(255 CHAR),
    post_id         CHAR(10 CHAR) NOT NULL,
    user_id_send    CHAR(20 CHAR) NOT NULL,
    user_id_recived CHAR(20 CHAR) NOT NULL,
    CONSTRAINT messages_messageid primary key (messageid),
    CONSTRAINT messages_fk_users_send FOREIGN KEY (user_id_send)  REFERENCES users(user_id),
    CONSTRAINT messages_fk_users_recive FOREIGN KEY (user_id_recived)  REFERENCES users(user_id),
    CONSTRAINT messages_fk_post FOREIGN KEY (post_id) REFERENCES post(post_id)
);


------------------------------------------------------------------------------------friendrequest--------------------------------------------------------------------------------------------
CREATE TABLE friendrequest (
    request_id     CHAR(10 CHAR) NOT NULL,
    status         VARCHAR2(180 CHAR),
    request_date   DATE,
    user_id_recived CHAR(20 CHAR) NOT NULL,
    user_id_send   CHAR(20 CHAR) NOT NULL,
    CONSTRAINT friendrequest_requestid primary key (request_id),
    CONSTRAINT friendrequest_fk_user_id_send FOREIGN KEY (user_id_send) REFERENCES users(user_id),
    CONSTRAINT friendrequest_fk_user_id_recived FOREIGN KEY (user_id_recived) REFERENCES users(user_id)
);

------------------------------------------------------------------------------------Friend_Member--------------------------------------------------------------------------------------------
CREATE TABLE Friend_Member(
    FRIENDSHIPDATE          DATE,          
    USER_ID_OWNER   CHAR(20 CHAR) NOT NULL, 
    USER_ID_FRIEND  CHAR(20 CHAR) NOT NULL,
    CONSTRAINT Friend_Member_fk_Users_Owner FOREIGN KEY (USER_ID_OWNER) REFERENCES users(user_id),
    CONSTRAINT Friend_Member_fk_Users_Friend FOREIGN KEY (USER_ID_FRIEND) REFERENCES users(user_id)
    );
    
------------------------------------------------------------------------------------user_id_reciver--------------------------------------------------------------------------------------------
CREATE TABLE user_id_reciver (
    user_id_send   CHAR(20 CHAR) NOT NULL,
    user_id_recived CHAR(20 CHAR) NOT NULL,
    post_id        CHAR(10 CHAR) NOT NULL,
    CONSTRAINT user_id_reciver_fk_send FOREIGN KEY (user_id_send) REFERENCES users(user_id),
    CONSTRAINT user_id_reciver_fk_recive FOREIGN KEY (user_id_recived) REFERENCES users(user_id),
    CONSTRAINT user_id_reciver_fk_post FOREIGN KEY (post_id) REFERENCES post(post_id)
);

------------------------------------------------------------------------------------addphoto_albums--------------------------------------------------------------------------------------------
CREATE TABLE addphoto_albums (
    post_post_id   CHAR(10 CHAR) NOT NULL,
    albums_albumid CHAR(10 CHAR) NOT NULL,
    CONSTRAINT addphoto_fk_post FOREIGN KEY (post_post_id) REFERENCES post(post_id),
    CONSTRAINT addphoto_fk_album FOREIGN KEY (albums_albumid) REFERENCES albums(albumid)
);


------------------------------------------------------------------------------------Update----------------------------------------------------------------------------------------------------------------------
---users
INSERT INTO users(user_id,username,password,tel_num,profilepic) VALUES('UID0000001','cirito','qwerty1234','0925648274','selfies01.png');
INSERT INTO users(user_id,username,password,tel_num,profilepic) VALUES('UID0000002','gamin','asdf1209','0925648275','selfies02.png');
INSERT INTO users(user_id,username,password,tel_num,profilepic) VALUES('UID0000003','Arku_Surasit','ilove69iSmyLife','0925648276','selfies03.jpg');
INSERT INTO users(user_id ,username,password,tel_num,profilepic) VALUES('UID0000004','eimi fukada' ,'zxcvbn8753','0925648277','selfies04.jpg');
INSERT INTO users(user_id,username,password,tel_num,profilepic) VALUES('UID0000005','eva elfie', 'fasfk554', '0925648278', 'selfies05.jpg');
INSERT INTO users(user_id,username,password,tel_num,profilepic) VALUES('UID0000006','samulai','gas8456','0925648279','selfies06.jpg');
INSERT INTO users(user_id ,username,password,tel_num,profilepic) VALUES('UID0000007', 'kimuji','fsafqf77','0925648280','selfies07.jpg');
INSERT INTO users(user_id,username,password,tel_num,profilepic) VALUES('UID0000008','dakky','hswg55','0925648281','selfies08.jpg');
INSERT INTO users(user_id,username,password,tel_num,profilepic) VALUES('UID0000009','dickky','adfasafas12','0925648282','selfies09.jpg');
INSERT INTO users(user_id,username,password,tel_num,profilepic) VALUES('UID0000010','jimmy','sadda454','0925648283','selfies10.jpg');

UPDATE USERS set email ='ciritoLnw@gmail.com'  WHERE USER_ID = 'UID0000001';
UPDATE USERS set email = 'gamin555@gmail.com' WHERE USER_ID = 'UID0000002';
UPDATE USERS set email = 'Arku_Surasit@gmail.com' WHERE USER_ID = 'UID0000003';
UPDATE USERS set email = 'emi696969@gmail.com' WHERE USER_ID = 'UID0000004';
UPDATE USERS set email = 'eva_elfie424@gmail.com' WHERE USER_ID = 'UID0000005';
UPDATE USERS set email = 'samulai69@gmail.com' WHERE USER_ID = 'UID0000006';
UPDATE USERS set email = 'kimuji255@gmail.com' WHERE USER_ID = 'UID0000007';
UPDATE USERS set email = 'dakky33@gmail.com' WHERE USER_ID = 'UID0000008';
UPDATE USERS set email = 'dickky693@gmail.com' WHERE USER_ID = 'UID0000009';
UPDATE USERS set email = 'jimmyButtler@gmail.com' WHERE USER_ID = 'UID0000010';

INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000011','jop','44120','0976534901','selfies11.jpg','jop@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000012','poppie','askfjapkf','0891890098','selfies12.jpg','jumsdav@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000013','yupp','71047098','0803456789','selfies13.jpg','yuppLnw@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000014','Helloworld','gjiq1891','0847653903','selfies14.jpg','Helloworld@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000015','pp','lsdkvnl','085635689','selfies15.jpg','ppwner@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000016','yu','aS12McVD','0984922229','selfies16.jpg','yuaremyeiei@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000017','max',';sdvm123','0981238892','selfies17.jpg','Maximum@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000018','Ejan',',lkdfp457','090456789','selfies18.jpg','Edekhearrr@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000019','DekD',';sfgaf89080','0993456689','selfies19.jpg','Raknakaaa@gmail.com');
INSERT INTO users(user_id,username,password,tel_num,profilepic,email ) VALUES('UID0000020','Mommee','xmfbnlsk918','0805678899','selfies20.jpg','Aibaakekor@gmail.com');

---post
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000001', 'pic05651.png', '??????????', TO_DATE('18/11/2565', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000002','pic0332.jpg','???????????', TO_DATE('07/10/2564', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000003','pic0344.jpg','???????????????????',TO_DATE('28/02/2567', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000004','pic0114.jpg','???????????????????', TO_DATE('04/05/2566', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000005','pic2575.jpg','??????????????', TO_DATE('06/07/2565', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000006','pic4047.jpg','????????????', TO_DATE('04/08/2565', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000007','pic8757.jpg','????????????????? ??????????????????????????????????', TO_DATE('05/07/2565', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000008','pic05445.jpg','???????????????????????', TO_DATE('20/10/2565', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000009','pic0779.jpg','???????????????????', TO_DATE('30/11/2566', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000010','pic17850.jpg','???????????????', TO_DATE('10/08/2565', 'DD/MM/YYYY'));
INSERT INTO post(Post_id, photopath, Caption, upload_date) VALUES ('P000000011','pic1111.jpg','??????????????? ?????????????????', TO_DATE('10/07/2565', 'DD/MM/YYYY'));



--albums

 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000001', 'cat', TO_DATE('14/10/2565', 'DD/MM/YYYY'), 'UID0000001');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000002', 'view', TO_DATE('15/11/2565', 'DD/MM/YYYY'), 'UID0000002');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000003', 'sea',TO_DATE('17/12/2565', 'DD/MM/YYYY'), 'UID0000003');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000004', 'sun',TO_DATE('11/11/2565', 'DD/MM/YYYY'), 'UID0000004');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000005', 'fox',TO_DATE('18/12/2566', 'DD/MM/YYYY'), 'UID0000005');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000006', 'dog',TO_DATE('24/04/2566', 'DD/MM/YYYY'), 'UID0000006');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000007','rabbit', TO_DATE('14/10/2565', 'DD/MM/YYYY'), 'UID0000007');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000008', 'kangaroo', TO_DATE('21/04/2566', 'DD/MM/YYYY'), 'UID0000008');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000009','doraemon', TO_DATE('14/05/2566', 'DD/MM/YYYY'), 'UID0000009');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000010','mountain', TO_DATE('15/11/2565', 'DD/MM/YYYY'), 'UID0000010');
 INSERT INTO albums (albumid, albumname, createdate, user_id) VALUES ('al00000011', 'Zoo', TO_DATE('15/11/2565', 'DD/MM/YYYY'), 'UID0000011');
 

--admin
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000001', 'Naruto' , 'narutohokakak@gmail.com' ,'Empoyee', '0675648274');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000002','sasuke','sasukelovenaruto@gmail.com','CEO','0825648233');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000003','sakura	','sakuraaaa@gmail.com','Empoyee','0935834276');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000004','kakashi','kakashilnwza@gmail.com','Empoyee','0625643478');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000005','shoji','shojiitadori@gmail.com','Empoyee','0825644501');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000006','lee','leezeedza@gmail.com','Empoyee','0652648279');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000007','inu','inukito@gmail.com','Empoyee','0825648280');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000008','gaara','gaara23@gmail.com','Empoyee','0625648281');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000009','eren yeager','eren.y@gmail.com','Empoyee','0925648282');
INSERT INTO admin (adminid,name,email,position,phone_num) VALUES('AD00000010','luffy','luffykub@gmail.com','Empoyee','0925648283');

--report
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000001',TO_DATE('04/01/2566', 'DD/MM/YYYY'),'?????????','UID0000003','P000000009','AD00000001','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000002',TO_DATE('18/02/2566', 'DD/MM/YYYY'),'?????????','UID0000003','P000000002','AD00000002','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000003',TO_DATE('29/05/2566', 'DD/MM/YYYY'),'?????????????','UID0000003','P000000003','AD00000003','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000004',TO_DATE('11/07/2566', 'DD/MM/YYYY'),'?????????','UID0000003','P000000004','AD00000004','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000005' , TO_DATE('23/08/2566','DD/MM/YYYY'),'??????????????????!!!','UID0000003','P000000005','AD00000005','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000006' , TO_DATE('06/10/2566','DD/MM/YYYY'),'????','UID0000006','P000000006','AD00000006','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000007' , TO_DATE('15/11/2566','DD/MM/YYYY'),'????????????','UID0000003','P000000007','AD00000007','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000008' , TO_DATE('03/12/2566','DD/MM/YYYY'),'?????????!','UID0000006','P000000008','AD00000008','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000009' , TO_DATE('17/01/2567','DD/MM/YYYY'),'?????????????','UID0000003','P000000001','AD00000009','Waiting for fix');
INSERT INTO report(report_id,report_date,report_message,user_id,post_id,admin_id,status) VALUES('re00000010' , TO_DATE('25/03/2567','DD/MM/YYYY'),'??????????????????','UID0000006','P000000002','AD00000010','Waiting for fix');

--messages
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000001',TO_DATE('02/06/2565', 'DD/MM/YYYY'), '?????????','P000000001','UID0000001', 'UID0000002');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000002',TO_DATE('07/06/2565', 'DD/MM/YYYY'), '???????????????????? ?????????????????????','P000000002','UID0000002','UID0000001');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000003',TO_DATE('11/06/2565', 'DD/MM/YYYY'), '?????????????????','P000000003','UID0000003', 'UID0000004');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000004',TO_DATE('20/06/2565', 'DD/MM/YYYY'), '?????','P000000004','UID0000004', 'UID0000005');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000005',TO_DATE('30/06/2565', 'DD/MM/YYYY'), '???????????','P000000005','UID0000005', 'UID0000003');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000006',TO_DATE('17/07/2565', 'DD/MM/YYYY'), '????????','P000000006','UID0000006','UID0000007');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000007',TO_DATE('25/07/2565', 'DD/MM/YYYY'), '????????','P000000007','UID0000007','UID0000006');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000008',TO_DATE('30/07/2565', 'DD/MM/YYYY'), '???????????','P000000008','UID0000008','UID0000010');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000009',TO_DATE('27/08/2565', 'DD/MM/YYYY'), '???????????','P000000009','UID0000009','UID0000008');
INSERT INTO Messages (messageid, datesend, message, post_id, User_id_send,User_id_recived) VALUES( 'MSG0000010',TO_DATE('14/09/2565', 'DD/MM/YYYY'), '???????????????','P000000010','UID0000010','UID0000008');

--friendrequest
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000001','waiting	',TO_DATE('1/10/2564', 'DD/MM/YYYY'),'UID0000001','UID0000011');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000002','accepted',TO_DATE('2/10/2564', 'DD/MM/YYYY'),'UID0000002','UID0000012');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000003','accepted',TO_DATE('3/10/2564', 'DD/MM/YYYY'),'UID0000003','UID0000020');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000004','denied',TO_DATE('4/10/2564', 'DD/MM/YYYY'),'UID0000004','UID0000013');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000005','accepted',TO_DATE('5/10/2564', 'DD/MM/YYYY'),'UID0000005','UID0000014');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000006','waiting	',TO_DATE('6/10/2564', 'DD/MM/YYYY'),'UID0000006','UID0000015');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000007','waiting	',TO_DATE('7/10/2564', 'DD/MM/YYYY'),'UID0000007','UID0000016');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000008','waiting	',TO_DATE('8/10/2564', 'DD/MM/YYYY'),'UID0000008','UID0000017');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000009','waiting	',TO_DATE('9/10/2564', 'DD/MM/YYYY'),'UID0000009','UID0000018');
INSERT INTO friendrequest(request_id,status,request_date,User_id_send,User_id_recived) VALUES('FRE0000010','waiting	',TO_DATE('10/10/2564', 'DD/MM/YYYY'),'UID0000010','UID0000019');

--Friend_Member
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('08-FEB-65','DD/MM/YYYY'),'UID0000001','UID0000003');          
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('19-APR-65','DD/MM/YYYY'),'UID0000002','UID0000006');         
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('25-JUN-65','DD/MM/YYYY'),'UID0000003','UID0000002');          
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('10-AUG-65','DD/MM/YYYY'),'UID0000004','UID0000002');          
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('17-SEP-65','DD/MM/YYYY'),'UID0000005','UID0000005');          
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('03-NOV-65','DD/MM/YYYY'),'UID0000006','UID0000007');          
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('14-DEC-65','DD/MM/YYYY'),'UID0000007','UID0000008');          
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('09-JAN-66','DD/MM/YYYY'),'UID0000008','UID0000006');          
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('22-MAR-66','DD/MM/YYYY'),'UID0000009','UID0000010');          
INSERT INTO Friend_Member (FRIENDSHIPDATE,USER_ID_OWNER,USER_ID_FRIEND) VALUES ( TO_DATE('25-MAR-67','DD/MM/YYYY'),'UID0000010','UID0000001'); 
--user_id_reciver
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000001','UID0000001','UID0000008');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000001','UID0000001','UID0000002');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000001','UID0000001','UID0000003');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000001','UID0000001','UID0000004');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000001','UID0000001','UID0000005');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000002','UID0000002','UID0000001');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000002','UID0000002','UID0000005');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000003','UID0000008','UID0000001');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000009','UID0000009','UID0000007');
Insert into user_id_reciver(post_id,user_id_send,user_id_recived) VALUES('P000000009','UID0000009','UID0000010');
--addphoto_albums
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000001','al00000001');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000002','al00000002');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000003','al00000003');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000004','al00000005');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000005','al00000005');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000006','al00000005');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000007','al00000006');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000008','al00000007');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000009','al00000007');
INSERT INTO AddPhoto_albums(post_post_id,albums_albumid) VALUES('P000000010','al00000009');



commit;

--SELECT * FROM post;


--DROP TABLE ADMIN;
--DROP TABLE REPORT;
--DROP TABLE USERS;
--DROP TABLE POST;
--DROP TABLE MESSAGES;
--DROP TABLE user_id_reciver;
--DROP TABLE ALBUMS;
--DROP TABLE ADDPHOTO_ALBUMS;
--DROP TABLE friendrequest;
--DROP TABLE Friend_Member;

--1.Reported_list : user
CREATE OR REPLACE VIEW Reported_list AS
SELECT users.user_id,username,email,count(report_id)report_total 
FROM users,report
WHERE users.user_id = report.user_id 
GROUP BY users.user_id,username,email;

--2 PHOTO_PERMISSION
CREATE OR REPLACE VIEW PHOTO_PERMISSION AS
SELECT user_id_reciver.post_id,user_id_recived reciver 
FROM user_id_reciver,post
WHERE user_id_reciver.post_id = post.post_id;

--3 USERPHOTOCOUNT
CREATE OR REPLACE VIEW USERPHOTOCOUNT AS
SELECT users.user_id , count(post_id)total_post 
FROM users,user_id_reciver
WHERE users.user_id = user_id_reciver.user_id_send(+) 
GROUP BY users.user_id;

--4 ALBUMS_POST
CREATE OR REPLACE VIEW ALBUMS_POST AS
SELECT albumID,albumname,post_ID,caption,user_id
FROM addphoto_albums,albums,post
WHERE POST_POST_ID = post_ID AND albums.albumid = addphoto_albums.albums_albumid;

--5 November2565_photos
CREATE OR REPLACE VIEW November2565_photos AS
SELECT user_id_reciver.post_id,post.upload_date,users.user_id owner
FROM users,post,user_id_reciver
WHERE users.user_id = user_id_reciver.user_id_send AND post.post_id = user_id_reciver.post_id 
AND (post.upload_date LIKE '%NOV%') AND (post.upload_date LIKE '%65%') ;

--6 Reply_post
CREATE OR REPLACE VIEW Reply_Post AS
SELECT users.username,users.user_id,message,Post.Post_id,(messages.user_id_recived)Recived
FROM Users,messages,Post
WHERE users.user_id = messages.user_id_send AND Post.post_id = messages.post_id;

--7 User_Friend_Member
CREATE OR REPLACE VIEW User_Friend_Member AS
SELECT users.user_id,User_id_Friend,Friendshipdate  
FROM Users,friend_member
WHERE users.user_id = friend_member.user_id_owner;

--8 UsersMessage
CREATE OR REPLACE VIEW UsersMessage AS
SELECT users.username,users.user_id,message,(messages.user_id_recived)Recived
FROM Users,messages
WHERE users.user_id = messages.user_id_send;

--9 User_Album_owner :
CREATE OR REPLACE VIEW User_Album_owner AS
SELECT users.user_id,username,albumid,albumname 
FROM users,albums
WHERE users.user_id = albums.user_id;

--10.ShowAllPost
CREATE OR REPLACE VIEW ShowAllPost AS
SELECT users.user_id,photopath,caption,upload_date
FROM users,post,user_id_reciver
WHERE users.user_id = user_id_reciver.user_id_send AND post.post_id = user_id_reciver.post_id ;


SELECT * FROM tab;
SELECT * FROM user_id_reciver;


CREATE OR REPLACE PROCEDURE AddPost (
    p_user_id_send    CHAR,                           -- ผู้ส่ง
    p_user_id_recived_list  SYS.ODCIVARCHAR2LIST,     -- List ของผู้รับหลายคน
    p_photopath       VARCHAR2,                       -- Path ของรูปภาพ
    p_caption         VARCHAR2,                       -- คำบรรยาย
    p_upload_date     DATE                            -- วันที่อัพโหลด
) IS
    v_post_id CHAR(10 CHAR);                          -- post_id ใหม่
    v_last_post_id CHAR(10 CHAR);                     -- post_id ล่าสุดจากตาราง post
    v_new_post_num NUMBER;                            -- post_id ใหม่ที่เป็นตัวเลข
    v_user_count NUMBER;                              -- ใช้สำหรับตรวจสอบว่าผู้ใช้มีอยู่หรือไม่
BEGIN
    -- ดึงค่าตัวล่าสุดของ post_id จากตาราง post
    SELECT MAX(post_id)
    INTO v_last_post_id
    FROM post;

    -- แปลงค่าตัวเลขจาก post_id ล่าสุด และเพิ่มค่า +1
    IF v_last_post_id IS NOT NULL THEN
        v_new_post_num := TO_NUMBER(SUBSTR(v_last_post_id, 2)) + 1;  -- ลบตัวอักษรที่เป็น prefix แล้วแปลงเป็นตัวเลข
    ELSE
        v_new_post_num := 1;  -- หากยังไม่มี post_id ให้เริ่มต้นจาก 1
    END IF;

    -- สร้าง post_id ใหม่ โดยใส่ prefix 'P' นำหน้า และใช้ LPAD เพื่อให้เป็นรหัสแบบ 10 หลัก
    v_post_id := 'P' || LPAD(v_new_post_num, 9, '0');

    -- เพิ่มข้อมูลในตาราง post
    INSERT INTO post (post_id, photopath, caption, upload_date)
    VALUES (v_post_id, p_photopath, p_caption, p_upload_date);

    -- ตรวจสอบว่าผู้ส่งมีอยู่ในตาราง users หรือไม่
   -- ตรวจสอบว่าผู้ส่งมีอยู่ในตาราง users หรือไม่
SELECT COUNT(*)
INTO v_user_count
FROM users
WHERE TRIM(UPPER(user_id)) = TRIM(UPPER(p_user_id_send));

IF v_user_count = 0 THEN
    RAISE_APPLICATION_ERROR(-20001, 'Sender user does not exist');
END IF;

-- วนลูปเพื่อเพิ่มข้อมูลในตาราง user_id_reciver ทีละผู้รับ
FOR i IN 1..p_user_id_recived_list.COUNT LOOP
    -- ตรวจสอบว่าผู้รับแต่ละคนมีอยู่ในตาราง users หรือไม่
    SELECT COUNT(*)
    INTO v_user_count
    FROM users
    WHERE TRIM(UPPER(user_id)) = TRIM(UPPER(p_user_id_recived_list(i)));

    IF v_user_count = 0 THEN
        RAISE_APPLICATION_ERROR(-20002, 'Receiver user does not exist: ' || p_user_id_recived_list(i));
    END IF;

    -- เพิ่มข้อมูลลงในตาราง user_id_reciver
    INSERT INTO user_id_reciver (user_id_send, user_id_recived, post_id)
    VALUES (p_user_id_send, p_user_id_recived_list(i), v_post_id);
END LOOP;


    -- บันทึกข้อมูล
    COMMIT;
END AddPost;
/


SELECT * FROM Users;


DECLARE
    v_recived_list SYS.ODCIVARCHAR2LIST := SYS.ODCIVARCHAR2LIST('UID0000003','UID0000004' );
BEGIN
    AddPost('UID0000001', v_recived_list, '/path/to/photo.jpg', 'Hello word', SYSDATE);
END;
/
commit;
