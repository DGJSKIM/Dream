commit;
-- 제품 테이블

rollback;
SELECT *
FROM tbl_product;

-- 제품 재고 테이블
select *
from tbl_product_stock;

insert 

-- 좋아요 테이블
select *
from tbl_like;

-- 좋아요 테이블 갯수 세기
select count(*)
from tbl_like
where product_num =5;


-- member 테이블
select *
from tbl_member;
-- 
select *
from TBL_MEMBER_LOGIN;

-- 장바구니 테이블
select *
from tbl_cart;

-- 포인트 테이블
select *
from tbl_point;

commit;

insert into tbl_point (point_num, userid,  point_amount , status,  event_type)
values(seq_point_num.nextval , 'karina@gmail.com' ,200, '적립',  '가입축하');


insert into tbl_point (point_num, userid, product_num, point_amount , status,  event_type)
values(seq_point_num.nextval , 'karina@gmail.com',161 ,1000, '차감',  '테스트구매');


insert into tbl_member (userid , username, MOBILE)
values ('kjsaj0525@gmail.com' , '김진석',01044463319);
insert into tbl_member_login (userid , passwd)
values ('kjsaj0525@gmail.com' , 'qwer1234$');

insert into tbl_cart (CART_NUM, USERID, PRODUCT_NUM, CART_CNT , PRODUCT_SIZE) 
values(seq_cart_num.nextval , 'kjsaj0525@gmail.com',161,1, 'S');

-- status 체크제약 ( “적립” / “차감” / “만료” )
-- product_num not null 해제 or  tbl_buylist 에서 order num 으로 변경희망

select sum(point_amount)
from tbl_point
where status = '차감' and userid = 'karina@gmail.com';

select sum(point_amount)
from tbl_point
where status = '적립' and userid = 'karina@gmail.com';

commit;

SELECT SUM(point_amount)over(PARTITION by status), status
FROM tbl_point
where userid = 'karina@gmail.com';

-- 유저아이디로 그 멤버의 남은 포인트 조회
SELECT SUM(CASE WHEN  status = '적립' THEN point_amount
        WHEN  status = '차감' THEN -point_amount
        else 0 END)
FROM tbl_point
where userid = 'jangjy@gmail.com';

select userid, point_num, point_amount, event_date, status, event_type,
    sum(CASE WHEN  status = '적립'  THEN point_amount
        WHEN  status = '차감' THEN -point_amount 
        else 0 END)OVER(ORDER BY point_num) as sum
from tbl_point
where userid = 'karina@gmail.com'
order by point_num;


select userid, point_num, point_amount, event_date, status, event_type,
    sum(CASE WHEN  status = '적립'  THEN point_amount
        WHEN  status = '차감' THEN -point_amount 
        else 0 END)OVER(ORDER BY point_num) as sum,
    sum(CASE WHEN  status in ('적립' , '차감')  THEN 1 end)OVER(ORDER BY point_num) as point_number_see    
from tbl_point
where userid = 'karina@gmail.com'
order by point_num desc;


String sql = "select userid, point_num, point_amount, event_date, status, event_type,\n"+
"    sum(CASE WHEN  status = '적립'  THEN point_amount\n"+
"        WHEN  status = '차감' THEN -point_amount \n"+
"        else 0 END)OVER(ORDER BY point_num) as sum,\n"+
"    sum(CASE WHEN  status in ('적립' , '차감')  THEN 1 end)OVER(ORDER BY point_num) as point_number_see    \n"+
"from tbl_point\n"+
"where userid = 'karina@gmail.com'\n"+
"order by point_num;";

select *
from tbl_member;

update set membership = ''
where userid = kari;

commit;


-- 비밀번호, 상태창, 멤버쉽, 휴면유무
select * from tbl_member_login;



select * 
from tbl_login_record;


select *
from TBL_MEMBER_LOGIN;

select product_num, product_size, size_cnt
						from tbl_product_stock 
					where product_num = 5;

insert into tbl_product_stock (product_num, product_size, size_cnt)
values (162 , 'S' , 11);
insert into tbl_product_stock (product_num, product_size, size_cnt)
values (162 , 'M' , 20);
insert into tbl_product_stock (product_num, product_size, size_cnt)
values (162 , 'L' , 1007);

String sql = "select product_num, product_size, size_cnt\n"+
"					 from tbl_product_stock \n"+
"                 where product_num = 161\n"+
"                 order by product_size asc;\n"+;

commit;

update ;

String sql = "select product_num, rigister_date, product_name, product_image, category, detail_category,price, discount_rate, gender, product_size, sale, product_cnt\n"+
"from tbl_product\n"+
"where product_num = 1 ";





select userid, product_num
from tbl_like
where userid=? and product_num=?


String sql = "select userid, product_num\n"+
"from tbl_like\n"+
"where userid=? and product_num=?";


select * from tbl_member;

insert into tbl_like(userid, product_num)
values('karina@gmail.com', 1);

select userid, product_num
from tbl_like;

select *
from tbl_member;



create or replace procedure pcd_stock_insert 
(SIZE_CNT   IN  NUMBER)
is
begin
     for i in 926..9 loop
         insert into tbl_product_stock(product_num, PRODUCT_SIZE, SIZE_CNT) 
         values(i,'freeSize', SIZE_CNT); 
     end loop;
end pcd_stock_insert;

exec pcd_stock_insert(30);
commit;

update tbl_product_stock set SIZE_CNT = 0 where product_size = 'freeSiz';
commit;


select * from tbl_product_stock
where PRODUCT_NUM >0
order by 1;

delete from tbl_product_stock
where product_num >= 568 and product_num <= 657 and  PRODUCT_SIZE = 'freeSize';

delete from tbl_product
where product_num = 10;

commit;
select * from tbl_product 

order by 1; 

rollback;

 select point_num, userid,point_amount,event_date, status, event_type 
from tbl_point
  
 order by 1 desc;

delete from tbl_product 
 where PRODUCT_NUM = 2;
 
 
 select *
 from tbl_product;
 
   update tbl

  
  
   commit;
--    없으면


insert into tbl_like(userid, product_num)
values('karina@gmail.com', 2);


--있으면

delete from tbl_like
where userid = 'karina@gmail.com'  and product_num = 1;


String sql = "delete from tbl_like\n"+
"where userid = 'karina@gmail.com'  and product_num = 1;";
select userid, product_num 
 from tbl_like 
 where userid='karina@gmail.com' and product_num = 2 ;
 
 
  create sequence seq_point_num
    start with 1
    increment by 1
    nomaxvalue
    nominvalue
    nocycle
    nocache;
    
    
    -- 겹치면 업데이트 없으면 인서트
MERGE INTO tbl_cart
USING tbl_cart
ON (userid='kjsaj0525@gmail.com' and PRODUCT_NUM = 162 and product_size='M')
WHEN MATCHED THEN
UPDATE SET cart_cnt = cart_cnt+1
WHEN NOT MATCHED THEN
insert (CART_NUM, USERID, PRODUCT_NUM, CART_CNT , PRODUCT_SIZE) 
values(seq_cart_num.nextval , 'kjsaj0525@gmail.com',162,1, 'M');

select * from tbl_cart;


select * from tbl_cart;


MERGE INTO tbl_cart 
USING dual 
ON (userid= 'kjsaj0525@gmail.com' and PRODUCT_NUM = 161 and product_size='L')
 WHEN MATCHED THEN 
UPDATE SET cart_cnt = cart_cnt+ 1 
WHEN NOT MATCHED THEN 
insert (CART_NUM, USERID, PRODUCT_NUM, CART_CNT , PRODUCT_SIZE) 
values(seq_cart_num.nextval , 'kjsaj0525@gmail.com' ,161,1, 'L');

select *
from tbl_product
where product_num = 161;





update tbl_product set  PRODUCT_IMAGE = '커플파자마4.PNG,커플파자마5.PNG ,커플파자마6.PNG'
where product_num = 631;
commit;
---------------------------------------------------------------------------------------------------------------------------
--//////////////////////////// 조명-장스탠드 시작 ///////////////////////////////--

--//////////////////////////// 조명-장스탠드 시작 ///////////////////////////////--

--장스탠드1
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '듀플렉스 장스탠드', '장스탠드1.PNG', '조명', '장스탠드', 78000, 0.2, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드2
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '마켓비 장스탠드', '장스탠드2.PNG', '조명', '장스탠드', 85000, 0.2, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드3
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '화이트컬러 장스탠드', '장스탠드3.PNG', '조명', '장스탠드', 37000, 0.2, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드4
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '', '장스탠드4.PNG', '조명', '장스탠드', 12800, 0.1, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드5
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '샛별 장스탠드', '장스탠드5.PNG', '조명', '장스탠드', 14500, 0.1, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드6
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '리모컨형 장스탠드', '장스탠드6.PNG', '조명', '장스탠드', 22300, 0.2, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드7
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '모던타입 장스탠드', '장스탠드7.PNG', '조명', '장스탠드', 32000, 0.1, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드8
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '퍼타입 장스탠드', '장스탠드8.PNG', '조명', '장스탠드', 180000, 0.1, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드9
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '심플 블랙 장스탠드', '장스탠드9.PNG', '조명', '장스탠드', 17000, 0.1, '없음', '그 자체만으로 감성이 되는 장스탠드');

--장스탠드10
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '롱아일랜드 장스탠드', '장스탠드10.PNG', '조명', '장스탠드',230000 , 0.1, '없음', '고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드11
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '유러피안 장스탠드', '장스탠드11.PNG', '조명', '장스탠드',80000 , 0.1, '없음','고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드12
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '충전심 감성 장스탠드', '장스탠드12.PNG', '조명', '장스탠드',70000 , 0.1, '없음','고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드13
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '스피아노 장스탠드', '장스탠드13.PNG', '조명', '장스탠드', 20000, 0.1, '없음','고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드14
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, 'Moon 장스탠드', '장스탠드14.PNG', '조명', '장스탠드',100000 ,0.1, '없음', '고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드15
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '유니콘 장스탠드', '장스탠드15.PNG', '조명', '장스탠드', 210000, 0.5, '없음','고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드16
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '오로라 컬러 장스탠드', '장스탠드16.PNG', '조명', '장스탠드', 70000, 0.2, '없음','고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드17
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '프리즘 플로어 장스탠드', '장스탠드17.PNG', '조명', '장스탠드',80000 , 0, '없음','고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드18
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '시티타입 장스탠드', '장스탠드18.PNG', '조명', '장스탠드',79000 , 0.1, '없음','고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드19
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '벨기에 스타일 장스탠드', '장스탠드19.PNG', '조명', '장스탠드',89000 ,0.1, '없음', '고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드20
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '넥스트배드 장스탠드', '장스탠드20.PNG', '조명', '장스탠드', 99000, 0.2, '없음','고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드21
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '천둥의신 토르 장스탠드', '장스탠드21.PNG', '조명', '장스탠드',56000 , 0.2, '없음', '고급스러운 디자인으로 공간의 품격을 높여줍니다');

--장스탠드22
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '아이언맨 슈트 장스탠드', '장스탠드22.PNG', '조명', '장스탠드', 64000, 0.2, '없음', '감성에 빛을 더하다');

--장스탠드23
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '나이아가라 폭포 장스탠드', '장스탠드23.PNG', '조명', '장스탠드', 37000, 0.2, '없음',  '감성에 빛을 더하다');

--장스탠드24
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '투플레이스 장스탠드', '장스탠드24.PNG', '조명', '장스탠드',21000 , 0.2, '없음',  '감성에 빛을 더하다');

--장스탠드25
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '야자수 장스탠드', '장스탠드25.PNG', '조명', '장스탠드', 87000, 0.2, '없음',  '감성에 빛을 더하다');

--장스탠드26
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '미피 장스탠드', '장스탠드26.PNG', '조명', '장스탠드', 64000, 0.2, '없음',  '감성에 빛을 더하다');

--장스탠드27
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '실리콘 헤드 장스탠드', '장스탠드27.PNG', '조명', '장스탠드',22000 , 0.2, '없음',  '감성에 빛을 더하다');

--장스탠드28
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '가로등 스타일 장스탠드', '장스탠드28.PNG', '조명', '장스탠드', 270000, 0.2, '없음',  '감성에 빛을 더하다');

--장스탠드29
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '식물등 장스탠드', '장스탠드29.PNG', '조명', '장스탠드', 128000, 0.2, '없음',  '감성에 빛을 더하다');

--장스탠드30
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '다이아 장스탠드', '장스탠드30.PNG', '조명', '장스탠드', 4800000, 0.1, '없음',  '오직 Dream 에서만 만나는 다이아세공장인 조쉬의 역작');

--//////////////////////////// 조명-장스탠드 끝 ///////////////////////////////---

--장스탠드4
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '귀여운 장스탠드', '장스탠드4.PNG', '조명', '장스탠드', 12800, 0.1, '없음', '그 자체만으로 감성이 되는 장스탠드');



--//////////////////////////// 조명-북라이트 시작 ///////////////////////////////----
--북라이트1
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '집게형 북라이트', '북라이트1.PNG', '조명', '북라이트', 11000, 0.2, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트2
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '충전식 북라이트', '북라이트2.PNG', '조명', '북라이트', 12000, 0, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트3
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '클립형 북라이트', '북라이트3.PNG', '조명', '북라이트', 13000, 0, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트4
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '모던타입 북라이트', '북라이트4.PNG', '조명', '북라이트', 18000, 0.1, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트5
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '우드텍스쳐 북라이트', '북라이트5.PNG', '조명', '북라이트', 21400, 0.2, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트6
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '무선 고양이 북라이트', '북라이트6.PNG', '조명', '북라이트', 22000, 0.3, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트7
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '라이트 패널 북라이트', '북라이트7.PNG', '조명', '북라이트', 22800, 0.1, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트8
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '코끼리 북라이트', '북라이트8.PNG', '조명', '북라이트', 33000, 0, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트9
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '휴대용 북라이트', '북라이트9.PNG', '조명', '북라이트', 28000, 0.15, '없음', '늦은밤 당신의 독서를 도와줄 파트너');

--북라이트10
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '엄마손 북라이트', '북라이트10.PNG', '조명', '북라이트', 17000, 0, '없음','늦은밤 당신의 독서를 도와줄 파트너');

--북라이트11
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '킹스 북라이트', '북라이트11.PNG', '조명', '북라이트', 8500, 0, '없음','늦은밤 당신의 독서를 도와줄 파트너');

--북라이트12
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '온이어 북라이트', '북라이트12.PNG', '조명', '북라이트',7900, 0, '없음', '독서시간을 환하게 밝혀줄');

--북라이트13
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '이마켓 북라이트', '북라이트13.PNG', '조명', '북라이트', 6800, 0, '없음','독서시간을 환하게 밝혀줄');

--북라이트14
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '넥밴드형 북라이트', '북라이트14.PNG', '조명', '북라이트', 14500, 0.1, '없음','독서시간을 환하게 밝혀줄');

--북라이트15
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '레트로 북라이트', '북라이트15.PNG', '조명', '북라이트', 21800, 0.15, '없음', '독서시간을 환하게 밝혀줄');

--북라이트16
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '실리콘 램프 북라이트', '북라이트16.PNG', '조명', '북라이트', 20000, 0.1, '없음', '독서시간을 환하게 밝혀줄');

--북라이트17
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '스타라이트 북라이트', '북라이트17.PNG', '조명', '북라이트', 16000, 0.15, '없음', '독서시간을 환하게 밝혀줄');

--북라이트18
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '독서실 북라이트', '북라이트18.PNG', '조명', '북라이트', 8000, 0, '없음','독서시간을 환하게 밝혀줄');

--북라이트19
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '강아지 북라이트', '북라이트19.PNG', '조명', '북라이트', 7300, 0, '없음', '독서시간을 환하게 밝혀줄');

--북라이트20
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '터치식 북라이트', '북라이트20.PNG', '조명', '북라이트', 12800, 0.1, '없음', '독서시간을 환하게 밝혀줄');

--북라이트21
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '살구라이트 북라이트', '북라이트21.PNG', '조명', '북라이트', 16800, 0.25, '없음', '독서시간을 환하게 밝혀줄');

--북라이트22
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '눈보호 북라이트', '북라이트22.PNG', '조명', '북라이트', 17000, 0.1, '없음', '독서시간을 환하게 밝혀줄');

--북라이트23
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '스탠드형 북라이트', '북라이트23.PNG', '조명', '북라이트', 14580, 0.1, '없음', '독서시간을 환하게 밝혀줄');

--북라이트24
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, 'C타입 충전형 북라이트', '북라이트24.PNG', '조명', '북라이트', 12300, 0, '없음', '독서시간을 환하게 밝혀줄');

--북라이트25
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '책갈피형 북라이트', '북라이트25.PNG', '조명', '북라이트', 12000, 0, '없음', '일상에 감성을 더해줄 북라이트');

--북라이트26
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '센서 북라이트', '북라이트26.PNG', '조명', '북라이트', 13000, 0, '없음',  '일상에 감성을 더해줄 북라이트');

--북라이트27
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '3단 접이식 북라이트', '북라이트27.PNG', '조명', '북라이트',18000 , 0, '없음',  '일상에 감성을 더해줄 북라이트');

--북라이트28
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '유니콘 북라이트', '북라이트28.PNG', '조명', '북라이트', 14000, 0, '없음',  '일상에 감성을 더해줄 북라이트');

--북라이트29
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '굿나잇 북라이트', '북라이트29.PNG', '조명', '북라이트', 13900, 0, '없음',  '일상에 감성을 더해줄 북라이트');

--북라이트30
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '거치형 북라이트', '북라이트30.PNG', '조명', '북라이트', 21800, 0, '없음',  '일상에 감성을 더해줄 북라이트');

--//////////////////////////// 조명-북라이트 끝 ///////////////////////////////----

--//////////////////////////// 조명-무드등 시작 ///////////////////////////////----

--무드등1
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, 'Moon 무드등', '무드등1.PNG', '조명', '무드등', 32000, 0.1, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등2
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, 'Hell 무드등', '무드등2.PNG', '조명', '무드등', 23000 , 0.1, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등3
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '토끼 무드등', '무드등3.PNG', '조명', '무드등', 23000, 0.1, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등4
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '스페이스 무드등', '무드등4.PNG', '조명', '무드등',17000 , 0.5, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등5
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '세가토이 홈스타 무드등', '무드등5.PNG', '조명', '무드등', 18000, 0.1,'없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등6
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '수면유도 무드등', '무드등6.PNG', '조명', '무드등', 60000, 0.1, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등7
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '오르골 취침 무드등 ', '무드등7.PNG', '조명', '무드등', 58000, 0.1, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등8
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '우드 린넨 무드등', '무드등8.PNG', '조명', '무드등', 27000, 0.2, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등9
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '포켓몬 무드등(피카츄)', '무드등9.PNG', '조명', '무드등', 43000, 0.5, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등10
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '포켓몬 무드등(메타몽) ', '무드등10.PNG', '조명', '무드등', 43000, 0.5, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등11
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '포켓몬 무드등(잠만보)', '무드등11.PNG', '조명', '무드등', 43000, 0.5, '없음',  '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등12
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '강아지 무드등', '무드등12.PNG', '조명', '무드등', 21000, 0.1, '없음',  '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등13
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '고양이 무드등', '무드등13.PNG', '조명', '무드등', 17000, 0.1, '없음',  '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등14
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '토스트 무드등', '무드등14.PNG', '조명', '무드등', 30000, 0.2, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등15
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '드림캐쳐 무드등', '무드등15.PNG', '조명', '무드등', 65000, 0.3, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등16
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '감성 무드등', '무드등16.PNG', '조명', '무드등', 17000, 0.2, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등17
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '스노우플라워 무드등', '무드등17.PNG', '조명', '무드등',18000 , 0.2, '없음',  '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등18
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '심플 디자인 무드등', '무드등18.PNG', '조명', '무드등', 17000, 0.2, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등19
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '모던타입 무드등', '무드등19.PNG', '조명', '무드등', 17000, 0, '없음',  '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등20
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '스페이스쉽 무드등', '무드등20.PNG', '조명', '무드등', 18900, 0, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등21
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '머쉬룸 무드등', '무드등21.PNG', '조명', '무드등', 9800, 0.1, '없음',  '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등22
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '마리오 무드등', '무드등22.PNG', '조명', '무드등', 21000, 0.1, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등23
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '클라우드 무드등', '무드등23.PNG', '조명', '무드등', 20500, 0.2, '없음',  '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등24
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '행운을 불러오는 고양이 무드등', '무드등24.PNG', '조명', '무드등', 23000, 0.2, '없음',  '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등25
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '오리 무드등', '무드등25.PNG', '조명', '무드등', 23200, 0.2, '없음', '캐릭터 무드등으로 집안 분위기를 바꿔보세요.');

--무드등26
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '실리콘 고양이 무드등', '무드등26.PNG', '조명', '무드등', 25800, 0.2, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등27
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '홀로그램 유리돔 무드등', '무드등27.PNG', '조명', '무드등', 28900, 0.3, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등28
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '스노우맨 무드등', '무드등28.PNG', '조명', '무드등', 19000, 0.1, '없음','공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등29
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, 'USB 타입 무드등', '무드등29.PNG', '조명', '무드등', 10900, 0.1, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--무드등30
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '큐브 무드등', '무드등30.PNG', '조명', '무드등', 12000, 0.1, '없음', '공간의 제약없이 무드등으로 나만의 감성을 연출하세요.');

--//////////////////////////// 조명-무드등 끝 ///////////////////////////////----


--//////////////////////////// 조명-LED양초 시작 ///////////////////////////////---

--LED양초1
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '양초 캔들 티라이트', 'LED양초1.PNG', '조명', 'LED양초',6450 , 0.5, '없음', '작은 빛이 공간을 바꿉니다');

--LED양초2
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, 'LED 양초 티라이트', 'LED양초2.PNG', '조명', 'LED양초', 8500, 0.15, '없음', '작은 빛이 공간을 바꿉니다');

--LED양초3
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '오래가는 LED 양초', 'LED양초3.PNG', '조명', 'LED양초', 17000, 0.1, '없음','작은 빛이 공간을 바꿉니다');

--LED양초4
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '모던홀릭 LED 캔들', 'LED양초4.PNG', '조명', 'LED양초', 14300, 0.1, '없음','작은 빛이 공간을 바꿉니다');

--LED양초5
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '양초 무드등 리모컨세트', 'LED양초5.PNG', '조명', 'LED양초', 12000, 0.2, '없음', '작은 빛이 공간을 바꿉니다');

--LED양초6
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '로즈 LED 양초', 'LED양초6.PNG', '조명', 'LED양초', 11000, 0.2, '없음', '작은 빛이 공간을 바꿉니다');

--LED양초7
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '하이아트 LED 양초', 'LED양초7.PNG', '조명', 'LED양초', 7000, 0.2, '없음', '작은 빛이 공간을 바꿉니다');

--LED양초8
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '아둥 LED 양초', 'LED양초8.PNG', '조명', 'LED양초', 23000, 0.1, '없음', '작은 빛이 공간을 바꿉니다');

--LED양초9
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '스토리빙 LED 양초', 'LED양초9.PNG', '조명', 'LED양초', 22000, 0.1, '없음', '작은 빛이 공간을 바꿉니다');

--LED양초10
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, 'NoFire LED 양초', 'LED양초10.PNG', '조명', 'LED양초', 12000, 0.1, '없음', '작은 빛이 공간을 바꿉니다');

--LED양초11
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '케이트가든 LED 양초', 'LED양초11.PNG', '조명', 'LED양초', 7000, 0.1, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초12
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '미니 LED 양초 세트', 'LED양초12.PNG', '조명', 'LED양초', 8000, 0.2, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초13
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '머레이 LED 양초', 'LED양초13.PNG', '조명', 'LED양초', 9000, 0.15, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초14
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '촛불타입 LED 양초', 'LED양초14.PNG', '조명', 'LED양초', 23000, 0.15, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초15
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '디오 LED 양초', 'LED양초15.PNG', '조명', 'LED양초', 12000, 0.1, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초16
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '샴페인골드 LED 양초', 'LED양초16.PNG', '조명', 'LED양초', 11000, 0.1, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초17
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '루아르모 LED 양초', 'LED양초17.PNG', '조명', 'LED양초', 11000, 0.1, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초18
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '흔들흔들 LED 양초', 'LED양초18.PNG', '조명', 'LED양초', 14000, 0.2, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초19
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '꼬마 멜팅 LED 양초', 'LED양초19.PNG', '조명', 'LED양초', 18900, 0, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초20
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '이케아 LED 양초', 'LED양초20.PNG', '조명', 'LED양초', 10900, 0, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초21
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '이벤트용 하트 LED 양초', 'LED양초21.PNG', '조명', 'LED양초', 20900, 0, '없음',  '우아하고 섬세하게 감성을 더하세요');

--LED양초22
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '글리터 펄 LED 양초', 'LED양초22.PNG', '조명', 'LED양초', 58000, 0.5, '없음', '우아하고 섬세하게 감성을 더하세요');

--LED양초23
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '파티용 LED 양초', 'LED양초23.PNG', '조명', 'LED양초', 23000, 0, '없음', '작은 차이가 공간을 바꿉니다');

--LED양초24
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '파라핀 LED 양초', 'LED양초24.PNG', '조명', 'LED양초', 14600, 0, '없음','작은 차이가 공간을 바꿉니다');

--LED양초25
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '연꽃 LED 양초', 'LED양초25.PNG', '조명', 'LED양초', 23000, 0, '없음', '작은 차이가 공간을 바꿉니다');

--LED양초26
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '모던타입 LED 양초', 'LED양초26.PNG', '조명', 'LED양초', 7800, 0, '없음', '작은 차이가 공간을 바꿉니다');

--LED양초27
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '수퍼블릭 LED 양초', 'LED양초27.PNG', '조명', 'LED양초', 11900, 0, '없음', '작은 차이가 공간을 바꿉니다');

--LED양초28
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '글라스 LED 양초', 'LED양초28.PNG', '조명', 'LED양초', 13400,0, '없음', '작은 차이가 공간을 바꿉니다');

--LED양초29
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, '할로윈 호박 LED 양초', 'LED양초29.PNG', '조명', 'LED양초', 14200, 0, '없음', '작은 차이가 공간을 바꿉니다');

--LED양초30
insert into tbl_product(PRODUCT_NUM, REGISTER_DATE, PRODUCT_NAME, PRODUCT_IMAGE, CATEGORY, DETAIL_CATEGORY,PRICE,DISCOUNT_RATE,GENDER,PRODUCT_CONTENT) 
values(seq_product_num.nextval, sysdate, 'For Kids LED 양초', 'LED양초30.PNG', '조명', 'LED양초', 16800, 0, '없음', '작은 차이가 공간을 바꿉니다');

--//////////////////////////// 조명-LED양초 끝 ///////////////////////////////-----
select * from tbl_product
where product_num = 161;

commit;
update tbl_product set PRODUCT_NAME = '디저트 먼지없는 침대패드드' , PRODUCT_IMAGE = '침대커버11.PNG,침대커버12.PNG ,침대커버13.PNG' , PRICE = '26900' , DISCOUNT_RATE = '0.05' , PRODUCT_CONTENT = '먼지걱정 없는 신소재, 프리미엄 세미화이바 침대패드 체크버전 '
where product_num = 161;

select * from tbl_buylist;

select * from tbl_member
where userid = ;



update tbl_member_login set  passwd = ? , secession = ? , rest_member = ?
where userid = ?

update tbl_member set  username = ? , membershio = ? , membership_register_date =?
where userid = ?

commit;
select * from tbl_member;
select * from tbl_member_login;




String sql = "update tbl_member_login set  passwd = ? , secession = ? , rest_member = ?\n"+
"where userid = ?";

String sql = "update tbl_member set  username = ? , membershio = ? , membership_register_date =?\n"+
"where userid = ?";




select * from tbl_member_login
where  userid = 'ggoma5@gmail.com';

commit;

rollback;

update tbl_member_login set  passwd = 'qwer1234$', secession = 0 , rest_member = 0
where userid = 'ggoma5@gmail.com';

update tbl_member_login set   secession = 0 , rest_member = 1
where userid = 'ggoma120@gmail.com';


select * from tbl_buylist;
commit;
alter table tbl_buylist add product_size NVARCHAR2(10 CHAR);
--==============================================================================================================================
-- 쪽지 작업 시작

CREATE TABLE tbl_message
(
messageno number not null, 
fk_sender_userid NVARCHAR2(40) not null,
fk_Recipient_userid NVARCHAR2(40) not null,
title NVARCHAR2(50) not null,
Contents NVARCHAR2(500) not null,
Shipping date default sysdate not null,
read_check Number(1) default 0 not null,
sender_delete Number(1) default 0 not null,
Recipient_delete Number(1) default 0 not null

,constraint PK_tbl_message_messageno primary key(messageno) 
,constraint FK_tbl_message_fk_sender_userid foreign key(fk_sender_userid) references tbl_member(userid) 
,constraint FK_tbl_message_fk_Recipient_userid foreign key(fk_Recipient_userid) references tbl_member(userid)
,constraint CK_tbl_message_read_check check( read_check in (0,1) )
,constraint CK_tbl_message_sender_delete check( sender_delete in (0,1) )
,constraint CK_tbl_message_Recipient_delete check( Recipient_delete in (0,1) )
);

commit;
 

insert into tbl_message (messageno, fk_sender_userid,  fk_Recipient_userid , title,  Contents)
values(seq_messageno_num.nextval,'kjsaj0525@gmail.com',  'kjsaj0525@gmail.com' , '제목',  '내용' );
  
select * from tbl_message;  

select * from tbl_member;
select * from tbl_search_keyword;

commit;
select * from tbl_point;
select * from tbl_buylist;
select * from tbl_product_stock;



commit;



select * from tbl_like
where userid='kjsaj0525@gmail.com' and product_num= 7;

String sql = 
"select * from tbl_like\n"+
"where userid='kjsaj0525@gmail.com' and product_num= 7;";

tbl_message
{
sender_userid
Recipient_userid
title
Contents (내용)
Shipping time -- 보낸시간 (얘로 정렬 예정)
read_check -- 읽었는지 확인(0,1)
sender_delete(보낸쪽에서 삭제처리)
Recipient_delete(받는쪽에서 삭제처리)
}

//=== 구현 기능 === //

// 쪽지 보내기 

commit;
insert into tbl_message (messageno, fk_sender_userid, fk_Recipient_userid, title, Contents)
values(seq_message_num.nextval , 'kjsaj0525@gmail.com' ,'kjsaj0525@gmail.com','제목', '내용last');


// 받은 쪽지 조회

select messageno, fk_sender_userid, fk_Recipient_userid, title, Contents, Shipping, read_check, sender_delete, Recipient_delete
from tbl_message
where  fk_Recipient_userid = 'kjsaj0525@gmail.com' and Recipient_delete = 0;
String sql = "\n"+
"select messageno, fk_sender_userid, fk_Recipient_userid, title, Contents, Shipping, read_check, sender_delete, Recipient_delete\n"+
"from tbl_message\n"+
"where  fk_Recipient_userid = 'kjsaj0525@gmail.com' and Recipient_delete = 0;\n"+
"  ";

// 보낸 쪽지 조회
select messageno, fk_sender_userid, fk_Recipient_userid, title, Contents, Shipping, read_check, sender_delete, Recipient_delete
from tbl_message
where  fk_sender_userid = 'kjsaj0525@gmail.com' and sender_delete= 0;

String sql = " select messageno, fk_sender_userid, fk_Recipient_userid, title, Contents, Shipping, read_check, sender_delete, Recipient_delete "+
" from tbl_message "+
" where  fk_sender_userid = 'kjsaj0525@gmail.com' and sender_delete= 0 ";

select messageno, fk_sender_userid, fk_Recipient_userid, title, Contents, Shipping, read_check, sender_delete, Recipient_delete  
from tbl_message  
where  fk_Recipient_userid = 'kjsaj0525@gmail.com' and Recipient_delete = 0 
order by messageno desc;

commit;
// read_check
메시지 내용 띄우면서 read_check 0에서 1로
이후 바깥에서 아이콘 읽은 편지로 변경

// 삭제기능
보낸쪽지에서 삭제 =>  sender_delete  0 에서 1로 변경 
받은쪽에서 삭제 => Recipient_delete 0 에서 1로 변경

select * from tbl_message;

commit;

-- 받은 메시지 삭제
update tbl_message set  RECIPIENT_DELETE = 1
where MESSAGENO in (122, 124, 126);

String sql = " update tbl_message set  RECIPIENT_DELETE = 1 "+
" where MESSAGENO in (122, 124, 126) ";

-- 보낸 메시지 삭제
update tbl_message set  SENDER_DELETE = 1
where MESSAGENO in (122, 124, 126);

-- 메시지 읽음 처리
update tbl_message set  RECIPIENT_DELETE = 1
where MESSAGENO in (122, 124, 126);






// 안읽은 쪽지 개수 count
select count(*)
from tbl_message
where FK_RECIPIENT_USERID = 'kjsaj0525@gmail.com' and read_check=0; 


select * from tbl_message;

select * from tbl_product_stock;

insert

// --- 만들 페이지 --- //

받은 페이지목록
보낸 페이지목록

+ 모달 


create user semi_orauser4 identified by aclass default tablespace users;

