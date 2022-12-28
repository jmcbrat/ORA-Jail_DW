select
   1 as inmate
   ,js.c_time_served
   ,case when js.m_charge_State <2 THEN 1 ELSE 0 END as pre_trial
   ,case when js.m_charge_State <2 and js.m_chg_fel=1 then 1 else 0 end as pr_fel
   ,case when js.m_charge_State <2 and js.m_chg_mis=1 then 1 else 0 end as pr_mis
   ,case when js.m_charge_State <2 and js.m_chg_civ=1 then 1 else 0 end as pr_civ
   ,case when js.m_charge_State <2 and js.m_chg_ord=1 then 1 else 0 end as pr_ord
   ,case when js.m_charge_State <2 and js.m_chg_blank=1 then 1 else 0 end as pr_oth
   ,case when js.m_charge_State >=2 THEN 1 ELSE 0 END as post_trial
   ,case when js.m_charge_State >=2 and js.m_chg_fel=1 then 1 else 0 end as po_fel
   ,case when js.m_charge_State >=2 and js.m_chg_mis=1 then 1 else 0 end as po_mis
   ,case when js.m_charge_State >=2 and js.m_chg_civ=1 then 1 else 0 end as po_civ
   ,case when js.m_charge_State >=2 and js.m_chg_ord=1 then 1 else 0 end as po_ord
   ,case when js.m_charge_State >=2 and js.m_chg_blank=1 then 1 else 0 end as po_oth
   ,case when js.c_hold_cnt >0 then 1 else 0 end as hold
   ,js.h_parole as probation
   ,js.m_c_macomb_county as macomb
   ,js.m_c_wayne as wayne
   ,js.m_c_oakland as oakland
   ,js.m_c_kent as kent
   ,js.m_c_stclair as stclair
   ,js.m_c_washtenaw as washtenaw
   ,js.m_c_genesee as genesee
   ,js.m_c_ingham as ingham
   ,js.m_c_other_county as other_mi
   ,js.m_c_state as state
   ,js.m_c_other_state as other_state
   ,js.m_c_unknown as not_listed
   ,js.h_ice as federal
   ,js.h_prison as prison
   ,js.h_foc as foc
   ,decode(js.demo_juv,'Y',1,0)
   --,js.*
from jail_snap js
where to_char(js.snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy');


select
   sum(1) as inmate
   ,sum(js.c_time_served)
   ,sum(case when js.m_charge_State <2 THEN 1 ELSE 0 END) as pre_trial
	,sum(case when js.m_charge_State <2 THEN js.c_time_served ELSE 0 END) as pre_trial_ts
   ,sum(case when js.m_charge_State <2 and js.m_chg_fel>=1 then 1 else 0 end) as pr_fel
   ,sum(case when js.m_charge_State <2 and js.m_chg_fel>=1 then js.c_time_served else 0 end) as pr_fel_ts
   ,sum(case when js.m_charge_State <2 and js.m_chg_mis>=1 then 1 else 0 end) as pr_mis
   ,sum(case when js.m_charge_State <2 and js.m_chg_mis>=1 then js.c_time_served else 0 end) as pr_mis_ts
   ,sum(case when js.m_charge_State <2 and js.m_chg_civ>=1 then 1 else 0 end) as pr_civ
   ,sum(case when js.m_charge_State <2 and js.m_chg_civ>=1 then js.c_time_served else 0 end) as pr_civ_ts
   ,sum(case when js.m_charge_State <2 and js.m_chg_ord>=1 then 1 else 0 end) as pr_ord
   ,sum(case when js.m_charge_State <2 and js.m_chg_ord>=1 then js.c_time_served else 0 end) as pr_ord_ts
   ,sum(case when js.m_charge_State <2 and js.m_chg_blank>=1 then 1 else 0 end) as pr_oth
   ,sum(case when js.m_charge_State <2 and js.m_chg_blank>=1 then js.c_time_served else 0 end) as pr_oth_ts
   ,sum(case when js.m_charge_State >=2 THEN 1 ELSE 0 END) as post_trial
   ,sum(case when js.m_charge_State >=2 THEN js.c_time_served ELSE 0 END) as post_trial_ts
   ,sum(case when js.m_charge_State >=2 and js.m_chg_fel=1 then 1 else 0 end) as po_fel
   ,sum(case when js.m_charge_State >=2 and js.m_chg_fel=1 then js.c_time_served else 0 end) as po_fel_ts
   ,sum(case when js.m_charge_State >=2 and js.m_chg_mis=1 then 1 else 0 end) as po_mis
   ,sum(case when js.m_charge_State >=2 and js.m_chg_mis=1 then js.c_time_served else 0 end) as po_mis_ts
   ,sum(case when js.m_charge_State >=2 and js.m_chg_civ=1 then 1 else 0 end) as po_civ
   ,sum(case when js.m_charge_State >=2 and js.m_chg_civ=1 then js.c_time_served else 0 end) as po_civ_ts
   ,sum(case when js.m_charge_State >=2 and js.m_chg_ord=1 then 1 else 0 end) as po_ord
   ,sum(case when js.m_charge_State >=2 and js.m_chg_ord=1 then js.c_time_served else 0 end) as po_ord_ts
   ,sum(case when js.m_charge_State >=2 and js.m_chg_blank=1 then 1 else 0 end) as po_oth
   ,sum(case when js.m_charge_State >=2 and js.m_chg_blank=1 then js.c_time_served else 0 end) as po_oth_ts
   ,sum(case when js.c_hold_cnt >0 then 1 else 0 end) as hold
   ,sum(case when js.c_hold_cnt >0 then js.c_time_served else 0 end) as hold_ts
   ,0 as probation --sum(case when js.h_parole>0 then 1 else 0 end ) as probation
   ,0 as probation_ts -- sum(case when js.h_parole >0  THEN js.c_time_served else 0 end) as probation_ts
   ,sum(case when js.h_c_macomb_county>0 then 1 else 0 end) as macomb
   ,sum(case when js.h_c_macomb_county>0 THEN js.c_time_served else 0 end) as macomb_ts
   ,sum(case when js.h_c_wayne>0 then 1 else 0 end ) as wayne
   ,sum(case when js.h_c_wayne>0 THEN js.c_time_served else 0 end) as wayne_ts
   ,sum(case when js.h_c_oakland>0 then 1 else 0 end ) as oakland
   ,sum(case when js.h_c_oakland >0 THEN js.c_time_served else 0 end) as oakland_ts
   ,sum(case when js.h_c_kent>0 then 1 else 0 end ) as kent
   ,sum(case when js.h_c_kent >0  THEN js.c_time_served else 0 end) as kent_ts
   ,sum(case when js.h_c_stclair>0 then 1 else 0 end ) as stclair
   ,sum(case when js.h_c_stclair >0 THEN js.c_time_served else 0 end) as stclair_ts
   ,sum(case when js.h_c_washtenaw >0 then 1 else 0 end ) as washtenaw
   ,sum(case when js.h_c_washtenaw >0 THEN js.c_time_served else 0 end) as washtenaw_ts
   ,sum(case when js.h_c_genesee>0 then 1 else 0 end ) as genesee
   ,sum(case when js.h_c_genesee >0 THEN js.c_time_served else 0 end) as genesee_ts
   ,sum(case when js.h_c_ingham >0 then 1 else 0 end ) as ingham
   ,sum(case when js.h_c_ingham >0 THEN js.c_time_served else 0 end) as ingham_ts
   ,sum(case when js.h_c_other_county >0 then 1 else 0 end ) as other_mi
   ,sum(case when js.h_c_other_county >0 THEN js.c_time_served else 0 end) as other_mi_ts
   ,sum(case when js.h_c_state >0 then 1 else 0 end ) as state
   ,sum(case when js.h_c_state >0 THEN js.c_time_served else 0 end) as state_ts
   ,sum(case when js.h_c_other_state> 0 then 1 else 0 end ) as other_state
   ,sum(case when js.h_c_other_state >0 THEN js.c_time_served else 0 end) as other_state_ts
   ,sum(case when js.h_c_unknown>0 then 1 else 0 end ) as not_listed
   ,sum(case when js.h_c_unknown >0 THEN js.c_time_served else 0 end) as not_listed_ts
   ,sum(case when js.h_ice >0 then 1 else 0 end ) as federal
   ,sum(case when js.h_ice >0 THEN js.c_time_served else 0 end) as federal_ts
   ,sum(case when js.h_prison>0 or js.h_parole > 0 then 1 else 0 end ) as prison
   ,sum(case when js.h_prison >0 or js.h_parole > 0  THEN js.c_time_served else 0 end) as prison_ts
   ,sum(case when js.h_foc>0 then 1 else 0 end ) as foc
   ,sum(case when js.h_foc >0 THEN js.c_time_served else 0 end) as foc_ts
   ,sum(decode(js.demo_juv,'Y',1,0)) as JUV
   ,sum(case when decode(js.demo_juv,'Y',1,0) = 1 THEN js.c_time_served else 0 end) as JUV_ts

   ,sum(case when js.hyta = 1 and js.c_hold_cnt =0
              and nvl(js.m_charge_State,0)=0 THEN 1 ELSE 0 END) as HYTA

   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 THEN 1 ELSE 0 END) as NS
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 THEN js.c_time_served ELSE 0 END) as NS_ts
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_fel>=1 then 1 else 0 end) as ns_fel
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_fel>=1 then js.c_time_served else 0 end) as ns_fel_ts
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_mis>=1 then 1 else 0 end) as ns_mis
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_mis>=1 then js.c_time_served else 0 end) as ns_mis_ts
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_civ>=1 then 1 else 0 end) as ns_civ
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_civ>=1 then js.c_time_served else 0 end) as ns_civ_ts
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_ord>=1 then 1 else 0 end) as ns_ord
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_ord>=1 then js.c_time_served else 0 end) as ns_ord_ts
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_blank>=1 then 1 else 0 end) as ns_oth
   ,sum(case when js.m_charge_state is null and hyta = 0 and js.c_hold_cnt = 0 and c_sent_cnt = 0 and c_unsent_cnt = 0 and js.m_chg_blank>=1 then js.c_time_served else 0 end) as ns_oth_ts
   ,sum(case when js.hyta = 1 and js.c_hold_cnt =0
              and nvl(js.m_charge_State,0)=0 THEN js.c_time_served ELSE 0 END) as HYTA

   --,js.*
from jail_snap js
where to_char(js.snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy');
