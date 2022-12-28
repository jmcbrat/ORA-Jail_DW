select offender_id
       ,js.MSC_PRE_TRIAL
       ,case when js.MSC_PRE_TRIAL = '1' THEN CLASS_FEL ELSE '0' END as pre_T_Fel
       ,case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_MIS ELSE '0' END as pre_T_mis
       ,case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_CIV ELSE '0' END as pre_T_CIV
       ,case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_ORD ELSE '0' END as pre_T_ORD
       ,case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_OTH ELSE '0' END as pre_T_OTH
       ,(select count(*) from jail_snap js where to_char(snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy') and js.MSC_PRE_TRIAL = '1') as preT_total
       ,MSC_POST_TRIAL
       ,case when  js.MSC_POST_TRIAL = '1' THEN CLASS_FEL ELSE '0' END as post_T_Fel
       ,case when  js.MSC_POST_TRIAL = '1' THEN CLASS_MIS ELSE '0' END as post_T_mis
       ,case when  js.MSC_POST_TRIAL = '1' THEN CLASS_CIV ELSE '0' END as post_T_CIV
       ,case when  js.MSC_POST_TRIAL = '1' THEN CLASS_ORD ELSE '0' END as post_T_ORD
       ,case when  js.MSC_POST_TRIAL = '1' THEN CLASS_OTH ELSE '0' END as post_T_OTH
       ,(select count(*) from jail_snap js where to_char(snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy') and js.MSC_POST_TRIAL = '1') as preT_total

       ,decode(HTYPE,0,0,1) as HOLD
       ,HOLD_PROBATION
       ,HOLD_FOC
       ,HOLD_PRISON
       ,HOLD_ICE
       ,HOLD_OTHER_COUNTY
       ,HOLD_OTHER_STATE
       ,DEMO_JUV
       ,(select count(*) from jail_snap js where to_char(snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy') and HTYPE>0) as Hold_total
       ,(select count(*) from jail_snap js where to_char(snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy')) as Total_pop
from jail_snap js
where to_char(snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy') ;



select sum(js_final.Pre_Trial_TS) as Pre_Trial_TS
       ,sum(js_final.Pre_Trial)  as Pre_Trial
       ,sum(js_final.pre_T_Fel_ts ) as pre_T_Fel_ts
       ,sum(js_final.pre_T_Fel )   as pre_T_Fel
       ,sum(js_final.pre_T_mis_ts )  as pre_T_mis_ts
       ,sum(js_final.pre_T_mis )     as pre_T_mis
       ,sum(js_final.pre_T_CIV_ts )  as pre_T_CIV_ts
       ,sum(js_final.pre_T_CIV )     as pre_T_CIV
       ,sum(js_final.pre_T_ORD_ts )  as pre_T_ORD_ts
       ,sum(js_final.pre_T_ORD )     as pre_T_ORD
       ,sum(js_final.pre_T_OTH_ts )  as pre_T_OTH_ts
       ,sum(js_final.pre_T_OTH )    as pre_T_OTH
       ,sum(js_final.post_T_Fel_ts ) as post_T_Fel_ts
       ,sum(js_final.post_T_Fel )   as post_T_Fel
       ,sum(js_final.post_T_mis_ts ) as post_T_mis_ts
       ,sum(js_final.post_T_mis )  as post_T_mis
       ,sum(js_final.post_T_CIV_ts ) as post_T_CIV_ts
       ,sum(js_final.post_T_CIV )     as post_T_CIV
       ,sum(js_final.post_T_ORD_ts ) as post_T_ORD_ts
       ,sum(js_final.post_T_ORD )   as post_T_ORD
       ,sum(js_final.post_T_OTH_ts ) as post_T_OTH_ts
       ,sum(js_final.post_T_OTH )    as post_T_OTH
       ,sum(js_final.HOLD_ts )       as HOLD_ts
       ,sum(js_final.HOLD )          as HOLD
       ,sum(js_final.hold_prob_ts )  as hold_prob_ts
       ,sum(js_final.hold_prob )     as hold_prob
       ,sum(js_final.hold_foc_ts )   as hold_foc_ts
       ,sum(js_final.hold_foc )      as hold_foc
       ,sum(js_final.hold_prison_ts ) as hold_prison_ts
       ,sum(js_final.hold_prison )    as hold_prison
       ,sum(js_final.hold_ice_ts )    as hold_ice_ts
       ,sum(js_final.hold_ice )      as hold_ice
       ,sum(js_final.hold_oth_cty_ts ) as hold_oth_cty_ts
       ,sum(js_final.hold_oth_cty )    as hold_oth_cty
       ,sum(js_final.hold_oth_st_ts )   as hold_oth_st_ts
       ,sum(js_final.hold_oth_st )      as hold_oth_st
       ,sum(js_final.hold_juv_ts )     as hold_juv_ts
       ,sum(js_final.hold_juv )        as hold_juv
       ,sum(js_final.Total_pop_ts )    as Total_pop_ts
       ,sum(js_final.Total_pop )       as Total_pop
from(

select  round(sum(decode(js.MSC_PRE_TRIAL,'1',time_served,0)),2) as Pre_Trial_TS, 0 as Pre_Trial
       ,round(sum(decode(case when js.MSC_PRE_TRIAL = '1' THEN CLASS_FEL ELSE '0' END,'1',time_served,0)),2) as pre_T_Fel_ts,0 as pre_T_Fel
       ,round(sum(decode(case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_MIS ELSE '0' END,'1',time_served,0)),2) as pre_T_mis_ts,0 as pre_T_mis
       ,round(sum(decode(case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_CIV ELSE '0' END,'1',time_served,0)),2) as pre_T_CIV_ts,0 as pre_T_CIV
       ,round(sum(decode(case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_ORD ELSE '0' END,'1',time_served,0)),2) as pre_T_ORD_ts,0 as pre_T_ORD
       ,round(sum(decode(case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_OTH ELSE '0' END,'1',time_served,0)),2) as pre_T_OTH_ts,0 as pre_T_OTH

       ,round(sum(decode(MSC_POST_TRIAL,'1',time_served,0)),2) as POST_TRIAL_ts, 0 as POST_TRIAL
       ,round(sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_FEL ELSE '0' END,'1',time_served,0)),2) as post_T_Fel_ts,0 as post_T_Fel
       ,round(sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_MIS ELSE '0' END,'1',time_served,0)),2) as post_T_mis_ts,0 as post_T_mis
       ,round(sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_CIV ELSE '0' END,'1',time_served,0)),2) as post_T_CIV_ts,0 as post_T_CIV
       ,round(sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_ORD ELSE '0' END,'1',time_served,0)),2) as post_T_ORD_ts,0 as post_T_ORD
       ,round(sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_OTH ELSE '0' END,'1',time_served,0)),2) as post_T_OTH_ts,0 as post_T_OTH

       ,round(sum(decode(HTYPE,0,0,time_served)),2) as HOLD_ts,0 as HOLD
       ,round(sum(decode(HOLD_PROBATION,'1',time_served,0)),2) as hold_prob_ts,0 as hold_prob
       ,round(sum(decode(HOLD_FOC,'1',time_served,0)),2) as hold_foc_ts,0 as hold_foc
       ,round(sum(decode(HOLD_PRISON,'1',time_served,0)),2) as hold_prison_ts,0 as hold_prison
       ,round(sum(decode(HOLD_ICE,'1',time_served,0)),2) as hold_ice_ts,0 as hold_ice
       ,round(sum(decode(HOLD_OTHER_COUNTY,'1',time_served,0)),2) as hold_oth_cty_ts,0 as hold_oth_cty
       ,round(sum(decode(HOLD_OTHER_STATE,'1',time_served,0)),2) as hold_oth_st_ts,0 as hold_oth_st
       ,round(sum(decode(DEMO_JUV,'1',time_served,0)),2) as hold_juv_ts,0 as hold_juv

       ,round(sum(--decode(rownum,1,
            (select js2.time_served from jail_snap js2 where js2.offender_id = js.offender_id and to_char(js2.snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy'))/*,0)*/ ),2) as Total_pop_ts, 0 as total_pop
from jail_snap js
where to_char(snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy')

union

select  0,sum(decode(js.MSC_PRE_TRIAL,'1',1,0)) as Pre_Trial
       ,0,sum(decode(case when js.MSC_PRE_TRIAL = '1' THEN CLASS_FEL ELSE '0' END,'1',1,0)) as pre_T_Fel
       ,0,sum(decode(case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_MIS ELSE '0' END,'1',1,0)) as pre_T_mis
       ,0,sum(decode(case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_CIV ELSE '0' END,'1',1,0)) as pre_T_CIV
       ,0,sum(decode(case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_ORD ELSE '0' END,'1',1,0)) as pre_T_ORD
       ,0,sum(decode(case when  js.MSC_PRE_TRIAL = '1' THEN CLASS_OTH ELSE '0' END,'1',1,0)) as pre_T_OTH

       ,0,sum(decode(MSC_POST_TRIAL,'1',1,0))
       ,0,sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_FEL ELSE '0' END,'1',1,0)) as post_T_Fel
       ,0,sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_MIS ELSE '0' END,'1',1,0)) as post_T_mis
       ,0,sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_CIV ELSE '0' END,'1',1,0)) as post_T_CIV
       ,0,sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_ORD ELSE '0' END,'1',1,0)) as post_T_ORD
       ,0,sum(decode(case when  js.MSC_POST_TRIAL = '1' THEN CLASS_OTH ELSE '0' END,'1',1,0)) as post_T_OTH

       ,0,sum(decode(HTYPE,0,0,1)) as HOLD
       ,0,sum(decode(HOLD_PROBATION,'1',1,0)   )
       ,0,sum(decode(HOLD_FOC,'1',1,0)         )
       ,0,sum(decode(HOLD_PRISON,'1',1,0)      )
       ,0,sum(decode(HOLD_ICE,'1',1,0)         )
       ,0,sum(decode(HOLD_OTHER_COUNTY,'1',1,0))
       ,0,sum(decode(HOLD_OTHER_STATE,'1',1,0))
       ,0,sum(decode(DEMO_JUV,'1',1,0))
       ,0,sum(decode(rownum,1,(select count(*) from jail_snap js where to_char(snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy')),0)) as Total_pop
from jail_snap js
where to_char(snap,'mm/dd/yyyy') =to_char(sysdate,'mm/dd/yyyy')
)  js_final;



