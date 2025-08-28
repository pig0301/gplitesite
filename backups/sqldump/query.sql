--建行与我行金价对比

select

tx_dt, min(tx_tm) as start_tm, max(tx_tm) as end_tm,

count(*) as price_cnt,
cast(avg(icbc_price1 - ccb_price1) as decimal(18, 2)) as avg_100g_diff,
cast(avg(icbc_price2 - ccb_price2) as decimal(18, 2)) as avg_store_diff

from (
	SELECT 

	to_char(create_dttm, 'yyyy-mm-dd') as tx_dt,
	to_char(create_dttm, 'HH24:MI') as tx_tm,

	max(case when product_name = '如意金条100g' then price else null end) as icbc_price1,
	max(case when product_name like '建行%100%' then price else null end) as ccb_price1,

	max(case when product_name = '如意金条200g' then price - 1 else null end) as icbc_price2,
	max(case when product_name = '建行易存金' then price else null end) as ccb_price2

	FROM (
		select create_dttm, product_name, price
		from public.coding_spider_product_storage_h
		
		union all
		
		select create_dttm, product_name, price
		from public.coding_spider_product_storage
	) t1
	
	group by 1, 2
) t1

where tx_tm between '09:10' and '17:00'

group by 1
order by 1 desc