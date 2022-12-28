select id.offender_id,
       ab.booking_id,
       ab.entity_id
	 ,nvl((select count(offender_id) from  publicview.mt_jil_charge jc3 where jc3.offender_id = id.offender_id and trans_type = 'H' group by offender_id),0) as hold_cnt
	 ,nvl((select count(offender_id) from  publicview.mt_jil_charge jc3 where jc3.offender_id = id.offender_id and trans_type = 'S' group by offender_id),0) as sent_cnt
	 ,nvl((select count(offender_id) from  publicview.mt_jil_charge jc3 where jc3.offender_id = id.offender_id and trans_type = 'U' group by offender_id),0) as unsent_cnt
	 ,round(sysdate - epic.ef_epic_date_to_date(b.accept_date),2) as MSC_Time_Served
	 ,epic.ef_epic_date_to_date(b.accept_date) as book_Accept
	 ,jc.court_name

/*,MCA_ct(jc.court_name,1) as word1
,MCA_ct(jc.court_name,2) as word2
,MCA_ct(jc.court_name,3) as word3
,MCA_ct(jc.court_name,4) as word4
,MCA_ct(jc.court_name,5) as word5
,MCA_ct(jc.court_name,6) as word6 */
,MCA_courtdetail(MCA_ct(jc.court_name,1),MCA_ct(jc.court_name,2),MCA_ct(jc.court_name,3),MCA_ct(jc.court_name,4),MCA_ct(jc.court_name,5),MCA_ct(jc.court_name,6), 'T') as court_type
,MCA_courtdetail(MCA_ct(jc.court_name,1),MCA_ct(jc.court_name,2),MCA_ct(jc.court_name,3),MCA_ct(jc.court_name,4),MCA_ct(jc.court_name,5),MCA_ct(jc.court_name,6), 'C') as county
,MCA_courtdetail(MCA_ct(jc.court_name,1),MCA_ct(jc.court_name,2),MCA_ct(jc.court_name,3),MCA_ct(jc.court_name,4),MCA_ct(jc.court_name,5),MCA_ct(jc.court_name,6), 'M') as McCourt
--,jc.*
from epic.eh_active_booking ab,
     epic.eh_offender_ids id,
     epic.eh_booking b,
     publicview.mt_jil_charge jc
where ab.entity_id = id.entity_id
  and ab.booking_id = b.booking_id
  and jc.offender_id = id.offender_id
  order by id.offender_id, decode(trans_type,'H',1,'S',2,'U',3,4)
