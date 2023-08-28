create table tbl_product_01(
	pcode varchar2(10) primary key,
	name varchar2(20),
	cost number(10)
)

create table tbl_shop_01(
scode varchar2(10) primary key,
sname varchar2(20)
)

create table tbl_salelist_01(
	saleno number(10) primary key,
	pcode varchar2(10) not null,
	saledate date,
	scode Varchar2(10) not null, 
	amount number(10)
)
/*DB GROUP BY 랑 ORDER By로 **별 판매액 만들때 쿼리 */
				SELECT  
				tp.pcode, 
    			    tp.name, 
    			    TO_CHAR(SUM(tp.cost * tsl.amount), '999,999,999,999') cost 
    			FROM 
    			    tbl_shop_01 ts 
    			    INNER JOIN tbl_salelist_01 tsl 
    			    ON ts.scode = tsl.scode 
    			    INNER JOIN tbl_product_01 tp 
    			    ON tp.pcode = tsl.pcode 
    			GROUP BY 
    			    tp.pcode, tp.name    			 
    			    ORDER BY  1 ;	

