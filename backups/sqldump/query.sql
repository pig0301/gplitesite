--建行与我行金价对比

select

tx_dt, count(*) as price_cnt,
avg(icbc_price - ccb_price) as avg_price_diff

from (
	SELECT 

	to_char(create_dttm, 'yyyy-mm-dd') as tx_dt,
	to_char(create_dttm, 'HH24:MI') as tx_tm,

	max(case when product_name = '如意金条100g' then price else null end) as icbc_price,
	max(case when product_name = '建行投资金条(100克)' then price else null end) as ccb_price

-- 	max(case when product_name = '如意金条200g' then price - 1 else null end) as icbc_price,
-- 	max(case when product_name = '建行易存金' then price else null end) as ccb_price

	FROM public.coding_spider_product_storage_h
	group by 1, 2
) t1

where tx_tm between '09:10' and '17:00'
and icbc_price is not null and ccb_price is not null

group by 1
order by 1