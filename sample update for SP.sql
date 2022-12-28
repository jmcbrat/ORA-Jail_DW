	select decode(jc.trans_type,'H',decode(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),null,0,1)
	             ,0) as Text_hold
	 ,decode(jc.trans_type,'H',CASE --WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'FOC',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'PARO',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'PROB',1,1)>0 THEN 1
	                                --WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'BW',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'PV',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'P V ',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'ABSC',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'PAROLE',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'PROB',1,1)>0 THEN 1
	                                WHEN instr(jc.court_name,'PROB')>0 THEN 1
	                                ELSE 0 END, 0) as Parole_hold
	,decode(jc.trans_type,'H',
	                          case when instr(jc.court_name,'3RD',1,1)>0 and (instr(jc.court_name,'CIR',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)THEN 1
	                               when instr(jc.court_name,'16',1,1)>0 and (instr(jc.court_name,'LIVONIA',1,1)>0 or instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'17',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'18',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'19',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'20',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'21',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'22',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'23',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'24',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'25',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'26',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'27',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'28',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'29',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'30',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'31',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'32',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0 or instr(jc.court_name,'MUN',1,1)>0) THEN 1
	                               when instr(jc.court_name,'33',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'34',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'35',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'36',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'36TH',1,1)>0  THEN 1
	                               when instr(jc.court_name,'19TH',1,1)>0  THEN 1
	                               when instr(jc.court_name,'16-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'17-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'18-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'19-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'20-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'21-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'22-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'23-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'24-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'25-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'26-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'27-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'28-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'29-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'30-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'31-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'32-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'33-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'34-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'35-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'36-',1,1)>0  THEN 1

	                               ELSE 0 END , 0)  as Hold_Wayne_County
	,decode(jc.trans_type,'H',
	                          case when instr(jc.court_name,'6TH',1,1)>0 and (instr(jc.court_name,'CIR',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)THEN 1
	                               --when jc.court_name = '16TH CIRCUIT COURT' THEN 0
	                               --when instr(jc.court_name,'CIRCUIT COURT',1,1)>0 THEN 1
	                               when instr(jc.court_name,'45',1,1)>0 and (instr(jc.court_name,'UTICA',1,1)>0 or instr(jc.court_name,'DC',1,1)>0 or instr(jc.court_name,'DIST',1,1)>0) THEN 1
	                               when instr(jc.court_name,'43',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'43',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'43',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'HAZEL PARK',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'44',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1

	                               when instr(jc.court_name,'45',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'46',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'47',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'48',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'49',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'50',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'51',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'51',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'52',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0 or instr(jc.court_name,'TROY',1,1)>0) THEN 1
	                               when instr(jc.court_name,'52-',1,1)>0  THEN 1
	                               ELSE 0 END , 0)  as Hold_Oakland_County
	,decode(jc.trans_type,'H',
	                          case when instr(jc.court_name,'17TH',1,1)>0 and (instr(jc.court_name,'CIR',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)THEN 1
	                               --when jc.court_name = '16TH CIRCUIT COURT' THEN 0
	                               --when instr(jc.court_name,'CIRCUIT COURT',1,1)>0 THEN 1
	                               when instr(jc.court_name,'59',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'61',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1

	                               when instr(jc.court_name,'62',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'63',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               ELSE 0 END , 0)  as Hold_Kent_County
	,decode(jc.trans_type,'H',
	                          case when instr(jc.court_name,'31ST',1,1)>0 and (instr(jc.court_name,'CIR',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)THEN 1
	                               --when jc.court_name = '16TH CIRCUIT COURT' THEN 0
	                               --when instr(jc.court_name,'CIRCUIT COURT',1,1)>0 THEN 1
	                               when instr(jc.court_name,'72',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'74',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               ELSE 0 END , 0)  as Hold_STClair_County

	,decode(jc.trans_type,'H',
	                          case when instr(jc.court_name,'22ND',1,1)>0 and (instr(jc.court_name,'CIR',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)THEN 1
	                               --when jc.court_name = '16TH CIRCUIT COURT' THEN 0
	                               --when instr(jc.court_name,'CIRCUIT COURT',1,1)>0 THEN 1
	                               when instr(jc.court_name,'14',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'15',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               ELSE 0 END , 0)  as Hold_Washtenaw_County
	,decode(jc.trans_type,'H',
	                          case when instr(jc.court_name,'40TH',1,1)>0 and (instr(jc.court_name,'CIR',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)THEN 1
	                               --when jc.court_name = '16TH CIRCUIT COURT' THEN 0
	                               --when instr(jc.court_name,'CIRCUIT COURT',1,1)>0 THEN 1
	                               when instr(jc.court_name,'71',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               ELSE 0 END , 0)  as Hold_Lapeer_County
	,--decode(jc.trans_type,'H',
	                          case when (NOT (instr(jc.court_name,'6TH',1,1)>0 or  instr(jc.court_name,'17TH',1,1)>0
	                                         OR instr(jc.court_name,'31ST',1,1)>0 OR instr(jc.court_name,'40TH',1,1)>0
	                                         OR instr(jc.court_name,'3RD',1,1)>0) and instr(jc.court_name,'CIR',1,1)>0 or instr(jc.court_name,'CC',1,1)>0) THEN 1
	                               --when jc.court_name = '16TH CIRCUIT COURT' THEN 0
	                               --when instr(jc.court_name,'CIRCUIT COURT',1,1)>0 THEN 1
	                               --when (instr(jc.court_name,'6TH',1,1)=0 or  instr(jc.court_name,'17TH',1,1)=0
	                               --          OR instr(jc.court_name,'31ST',1,1)=0 OR instr(jc.court_name,'40TH',1,1)=0
	                               --          OR instr(jc.court_name,'3RD',1,1)=0) and instr(jc.court_name,'FOC',1,1)>0  THEN 1
	                               --when instr(jc.court_name,'COUNTY',1,1)>0 THEN 1
	                               when (instr(jc.court_name,'6TH',1,1)=0 or  instr(jc.court_name,'17TH',1,1)=0
	                                         OR instr(jc.court_name,'31ST',1,1)=0 OR instr(jc.court_name,'40TH',1,1)=0
	                                         OR instr(jc.court_name,'3RD',1,1)=0) and instr(jc.court_name,'CC',1,1)>0  THEN 1
	                               when instr(jc.court_name,'BIG RAPIDS',1,1)>0  THEN 1
	                               when instr(jc.court_name,' CO ',1,1)>0  THEN 1
	                               when instr(jc.court_name,'07',1,1)>0 and instr(jc.court_name,'DIST',1,1)>0  THEN 1
	                               when instr(jc.court_name,'88',1,1)>0 and instr(jc.court_name,'DIST',1,1)>0  THEN 1
	                               when instr(jc.court_name,'56',1,1)>0 and instr(jc.court_name,'DIST',1,1)>0  THEN 1
	                               when instr(jc.court_name,'12',1,1)>0 and instr(jc.court_name,'DIST',1,1)>0  THEN 1
	                               when instr(jc.court_name,'2ND',1,1)>0 THEN 1
	                                --WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'AWAITING PICK',1,1)>0 THEN 1
	                               ELSE 0 END  as Hold_Other_County
	,CASE WHEN instr(jc.court_name,'ALABAMA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'ALASKA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'ARIZONA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'ARKANSAS',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'CALIFORNIA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'COLORADO',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'CONNECTICUT',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'DELAWARE',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'FLORIDA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'GEORGIA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'HAWAII',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'IDAHO',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'ILLINOIS',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'INDIANA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'IOWA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'KANSAS',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'KENTUCKY',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'LOUISIANA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'MAINE',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'MARYLAND',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'MASSACHUSETTS',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'MINNESOTA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'MISSISSIPPI',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'MISSOURI',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'MONTANA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NEBRASKA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NEVADA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NEW HAMPSHIRE',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NEW JERSEY',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NEW MEXICO',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NEW YORK',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NORTH CAROLINA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NORTH DAKOTA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'OHIO',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'OKLAHOMA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'OREGON',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'PENNSYLVANIA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'RHODE ISLAND',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'SOUTH CAROLINA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'SOUTH DAKOTA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'TENNESSEE',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'NASHVILLE',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'TEXAS',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'UTAH',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'VERMONT',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'VIRGINIA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'WASHINGTON',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'WEST VIRGINIA',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'WISCONSIN',1,1)>0 THEN 1
	      WHEN instr(jc.court_name,'WYOMING',1,1)>0 THEN 1
          WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'EXTRADITION',1,1)>0 THEN 1
	      ELSE 0 END as Hold_Other_State
	,case WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'FEDERAL',1,1)>0 THEN 1
          WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'MILITARY',1,1)>0 THEN 1
          WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'IMMIGRATION/NATURALIZATION ',1,1)>0 THEN 1
          WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'US - ',1,1)>0 THEN 1
          WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'OASH',1,1)>0 THEN 1
	      ELSE 0 END    as Hold_ICE
	 ,CASE WHEN instr(jc.complaint_Dept,'MI DEPT OF CORR',1,1)>0 THEN 1
	                                WHEN instr(jc.complaint_Dept,'MDOC',1,1)>0 THEN 1
	                                when instr(jc.complaint_Dept,'STATE',1,1)>0  THEN 1
	                                WHEN publicview.mf_complaint_dept(jc.charge_id,'H')='MDOC' THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'PRISON',1,1)>0 THEN 1
	                                ELSE 0 END
	         /*,0)*/ as Hold_Prison
	 ,decode(jc.trans_type,'H',CASE WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'FOC',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'NON S',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'NON-S',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'CHILD',1,1)>0 THEN 1
	                                WHEN instr(jc.court_name,'FOC')>0 THEN 1
	                                WHEN instr(jc.court_name,'FRIEND')>0 THEN 1
	                                ELSE 0 END, 0) as FOC_hold
	 /*,decode(jc.trans_type,'H',*/
	        -- ,instr(jc.court_name,'CIRCUIT COURT',1,1)
	,decode(jc.trans_type,'H',
	                          case when instr(jc.court_name,'37',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'38',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'39',1,1)>0 /*and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0)*/ THEN 1
	                               when instr(jc.court_name,'40',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0)  THEN 1
	                               when instr(jc.court_name,'41',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0 or instr(jc.court_name,'UTICA',1,1)>0)  THEN 1
	                               when instr(jc.court_name,'37TH',1,1)>0  THEN 1
	                               when instr(jc.court_name,'41-',1,1)>0  THEN 1
	                               when instr(jc.court_name,'41 B',1,1)>0  THEN 1
	                               when instr(jc.court_name,'41 A',1,1)>0  THEN 1
	                               when instr(jc.court_name,'42',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1
	                               when instr(jc.court_name,'42-',1,1)>0 and (instr(jc.court_name,'ROMEO',1,1)>0) THEN 1
	                               when instr(jc.court_name,'16',1,1)>0 and (instr(jc.court_name,'Circuit',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)  THEN 1
	                               when instr(jc.court_name,'16',1,1)>0 and (instr(jc.court_name,'Circuit',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)  THEN 1
	                               --when instr(jc.court_name,'06',1,1)>0 and (instr(jc.court_name,'Circuit',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)  THEN 1
                                   WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'DISTRICT',1,1)>0 THEN 1
                                   WHEN instr(EPIC.ef_get_attribute_value('CHARGE STATUS',charge_id),'CIRCUIT',1,1)>0 THEN 1
	                                WHEN instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'DO NOT RELEASE',1,1)>0 THEN 1
	                               ELSE 0 END , 0)  as Hold_Macomb_County
/*	 ,(select count(offender_id) from  publicview.mt_jil_charge jc3 where jc3.offender_id = p_offender_id and trans_type = 'H' group by offender_id) as hold_cnt
	 ,(select count(offender_id) from  publicview.mt_jil_charge jc3 where jc3.offender_id = p_offender_id and trans_type = 'S' group by offender_id) as sent_cnt
	 ,(select count(offender_id) from  publicview.mt_jil_charge jc3 where jc3.offender_id = p_offender_id and trans_type = 'U' group by offender_id) as unsent_cnt
*/
	 ,case when instr(jc.court_name,'37',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1 ELSE 0 END as h_DC_37
     ,case when instr(jc.court_name,'38',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1 ELSE 0 END as h_DC_38 --- joe add this one
	,case when instr(jc.court_name,'39',1,1)>0 and instr(upper(jc.court_name),'FRASER',1,1)>0                              THEN 1 ELSE 0 END as h_DC_39_Fraser
	,case when instr(jc.court_name,'39',1,1)>0 and instr(upper(jc.court_name),'ROSEVILLE',1,1)>0                           THEN 1 ELSE 0 END as h_DC_39_ROSEVILLE
	,case when instr(jc.court_name,'40',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0)  THEN 1 ELSE 0 END as h_DC_40_STCLAIRSHORES
	,case when instr(jc.court_name,'41',1,1)>0 and instr(jc.court_name,'SHELBY',1,1)>0                                     THEN 1 ELSE 0 END as h_DC41A_SHELBY
	,case when instr(jc.court_name,'41',1,1)>0 and instr(jc.court_name,' A',1,1)>0                                     THEN 1 ELSE 0 END as h_DC41A_SHELBY
	,case when instr(jc.court_name,'41',1,1)>0 and instr(jc.court_name,'CLINTON',1,1)>0                                    THEN 1 ELSE 0 END as h_DC_41B_CLINTON
	,case when instr(jc.court_name,'42',1,1)>0 and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0)  THEN 1 ELSE 0 END as h_DC_42_1_ROMEO
	,case when instr(jc.court_name,'16',1,1)>0 and (instr(upper(jc.court_name),'CIRCUIT',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)  THEN 1 ELSE 0 END as h_MC_FOC
--	,case when instr(jc.court_name,'06',1,1)>0 and (instr(jc.court_name,'Circuit',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)  THEN 1 ELSE 0 END as h_CC_16
	,case when instr(jc.court_name,'16',1,1)=0 and (instr(upper(jc.court_name),'CIRCUIT',1,1)>0 or instr(jc.court_name,'CC',1,1)>0)  THEN 1 ELSE 0 END as h_MI_CC
	,0 as h_OS_CC
	,case when (instr(jc.court_name,'37',1,1)>0 or instr(jc.court_name,'38',1,1)>0 or instr(jc.court_name,'39',1,1)>0 or
	            instr(jc.court_name,'40',1,1)>0 or instr(jc.court_name,'41',1,1)>0 or instr(jc.court_name,'42',1,1)>0
	           )
	       and (instr(jc.court_name,'DIST',1,1)>0 or instr(jc.court_name,'DC',1,1)>0) THEN 1 ELSE 0 END as h_MI_DC
--	,h_OS_DC                 -- can not give this......
	,CASE WHEN instr(jc.complaint_Dept,'S.E.T.',1,1)>0 THEN 1 ELSE 0 END as h_SET
	,CASE WHEN instr(jc.complaint_Dept,'M.A.T.S.',1,1)>0 THEN 1 ELSE 0 END as h_MATS
	,CASE WHEN instr(jc.complaint_Dept,'M.A.C.E.',1,1)>0 THEN 1 ELSE 0 END as h_MACE
	,CASE WHEN instr(jc.complaint_Dept,'C.O.M.E.T.',1,1)>0 THEN 1 ELSE 0 END as h_COMET
	,CASE WHEN instr(jc.complaint_Dept,'MACOMB COUNTY SHERIFF',1,1)>0 THEN 1 ELSE 0 END as h_MCSO
	,CASE WHEN instr(jc.complaint_Dept,'OAKLAND COUNTY ',1,1)>0 THEN 1
	      WHEN instr(jc.complaint_Dept,'MSP ',1,1)>0 THEN 1
	      WHEN instr(jc.complaint_Dept,'MDOC ',1,1)>0 THEN 1
	      WHEN instr(jc.complaint_Dept,'DETROIT',1,1)>0 THEN 1
	      WHEN instr(jc.complaint_Dept,'WAYNE COUNTY',1,1)>0 THEN 1
	      WHEN instr(jc.complaint_Dept,'ST CLAIR COUNTY ',1,1)>0 THEN 1 ELSE 0 END as h_OT_MI_OTHER
	,CASE WHEN instr(jc.complaint_Dept,'US BORDER PATROL',1,1)>0 THEN 1
	      WHEN instr(jc.complaint_Dept,'IMMIGRATION NATURALIZATION',1,1)>0 THEN 1 ELSE 0 END as h_OT_NonMI
	,CASE WHEN instr(jc.complaint_Dept,'CHESTERFIELD',1,1)>0 THEN 1 ELSE 0 END as h_PD_CHESTERFIELD
	,CASE WHEN instr(jc.complaint_Dept,'EASTPOINTE',1,1)>0 THEN 1 ELSE 0 END as h_PD_EASTPOINTE
	,CASE WHEN instr(jc.complaint_Dept,'CLINTON',1,1)>0 THEN 1 ELSE 0 END as h_PD_CLINTON
	,CASE WHEN instr(jc.complaint_Dept,'FRASER',1,1)>0 THEN 1 ELSE 0 END as h_PD_FRASER
	,CASE WHEN instr(jc.complaint_Dept,'SAINT CLAIR SHORES',1,1)>0 THEN 1 ELSE 0 END as h_PD_STCS
	,CASE WHEN instr(jc.complaint_Dept,'CENTERLINE',1,1)>0 THEN 1 ELSE 0 END as h_PD_CENTERLINE
	,CASE WHEN instr(jc.complaint_Dept,'SHELBY',1,1)>0 THEN 1 ELSE 0 END as h_PD_SHELBY
	,CASE WHEN instr(jc.complaint_Dept,'STERLING HEIGHTS',1,1)>0 THEN 1 ELSE 0 END as h_PD_STERLING_hts
	,CASE WHEN instr(jc.complaint_Dept,'UTICA',1,1)>0 THEN 1 ELSE 0 END as h_PD_UTICA
	,CASE WHEN instr(jc.complaint_Dept,'WARREN',1,1)>0 THEN 1 ELSE 0 END as h_PD_WARREN
	,CASE WHEN instr(jc.complaint_Dept,'ARMADA',1,1)>0 THEN 1 ELSE 0 END as h_PD_ARMADA
	,CASE WHEN instr(jc.complaint_Dept,'MT CLEMENS',1,1)>0 THEN 1 ELSE 0 END as h_PD_MTCLEMENS
	,CASE WHEN instr(jc.complaint_Dept,'NEW BALTIMORE',1,1)>0 THEN 1 ELSE 0 END as h_PD_NEWBALTIMORE
	,CASE WHEN instr(jc.complaint_Dept,'NEW HAVEN',1,1)>0 THEN 1 ELSE 0 END as h_PD_NEWHAVEN
	,CASE WHEN instr(jc.complaint_Dept,'RICHMOND',1,1)>0 THEN 1 ELSE 0 END as h_PD_RICHMOND
	,CASE WHEN instr(jc.complaint_Dept,'ROMEO',1,1)>0 THEN 1 ELSE 0 END as h_PD_ROMEO
	,CASE WHEN instr(jc.complaint_Dept,'MEMPHIS',1,1)>0 THEN 1 ELSE 0 END as h_PD_MEMPHIS
	,CASE WHEN instr(jc.complaint_Dept,'ROSEVILLE',1,1)>0 THEN 1 ELSE 0 END as h_PD_ROSEVILLE

	,CASE WHEN instr(jc.complaint_Dept,'OTHER',1,1)>0 THEN 1 ELSE 0 END as h_PD_OTHER
	,jc.court_name ,jc.complaint_Dept
	--, publicview.mf_is_HYTA_charge2(jc.charge_id)
	from publicview.mt_jil_charge jc
	where jc.offender_id = '162798' --p_offender_id
	  --and instr(EPIC.ef_get_attribute_value('HOLD INFO',charge_id),'SOR',1,1)>0
	  and trans_type = 'H'
	order by jc.offender_id, jc.trans_type  ;
