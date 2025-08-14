select 
*, 
null as new_col  
from  {{ ref("obt_sales_overview")}}