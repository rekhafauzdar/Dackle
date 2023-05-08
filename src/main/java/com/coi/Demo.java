package com.coi;


import java.text.ParseException;
import java.text.SimpleDateFormat;

//<td><a href="deleteuser.jsp?id=${u.getId()}">Delete</a></td></tr>  

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.HashMap;
import java.util.LinkedList;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;
import java.util.Set;
import java.util.stream.Collectors;
import java.util.LinkedHashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.BeanPropertyRowMapper;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Service;
import org.springframework.ui.ModelMap;

import com.coi.entity.DackleOrders;
import com.coi.entity.DackleSystemUser;
import com.coi.repository.DackleSystemUserRepository;
import com.coi.repository.MyDataRepository;

@Service
public class Demo {
	
	
	@Autowired
	private JdbcTemplate template;
	

//	@Autowired
//	private MyDataService myDataService;
	
	@Autowired
	private MyDataRepository myDataRepository;
	
	
	
	@Autowired
	private DackleSystemUserRepository dackleSystemUserRepository;
	
	
	double rw = 0d;
	Map<String, Map<String, Object>> paperDetails = null;
	
	public void hello() {
		myDataRepository.findAll();
	}
	
	
	
	
	public void calculate(HashMap<String, String> param, ModelMap modelMap) {	
		
		
		paperDetails =  getPaperOrdersMap(param);
		
		
		if(paperDetails!=null && paperDetails.size() > 0) {
			
		
		saveOrders();
		
		
		
		
		 double gsm =(double) paperDetails.entrySet().iterator().next().getValue().get("gsm");
		 Integer paperType =(Integer) paperDetails.entrySet().iterator().next().getValue().get("papertype");
		
		
		List<Double> gsmList = new ArrayList<Double>(Arrays.asList(250d, 260d, 285d, 296d, 320d, 350d, 400d, 450d));
		if (paperType == 1) {
			if (gsmList.subList(0, 4).contains(gsm)) {
				rw = 290;
			} else if (gsmList.subList(4, 8).contains(gsm)) {
				rw = 292;
			}
		} else if (paperType == 2) {
			if (gsmList.subList(0, 4).contains(gsm)) {
				rw = 288;
			} else if (gsmList.subList(4, 6).contains(gsm)) {
				rw = 290;
			} else if (gsmList.subList(6, 8).contains(gsm)) {
				rw = 292;
			}
		}
		
		
		
		Map<String,Map<String, Object>> calculatedMap = new LinkedHashMap<String, Map<String,Object>>();
		int calculatedMapId = 0;
		
		
		int leftOrederSize = paperDetails.entrySet().stream().filter(i -> !i.getValue().containsKey("isDone"))
				.collect(Collectors.toList()).size();	
		
		while (leftOrederSize > 1) {

			Map<String, Object> map = getOrdersToProcessWithMinWastage();					
			calculatedMapId++;
			
			Map<String, Object>	 paper1 = paperDetails.get(map.get("paper1"));
			Map<String, Object>	 paper2 = paperDetails.get(map.get("paper2"));

			// l*w*gsm g/m2;
			double paper1Width = (double) paper1.get("width"); // cm
			double paper1Length = (double) paper1.get("length"); // cm
			double gsm1 = (double) paper1.get("gsm");
			
			paper1Width = paper1Width / 100; // convert into meter
			paper1Length = paper1Length / 100; // convert into meter
			
			double paper1Weight = paper1Width * paper1Length * gsm1; // gram per meter square
			
			
			double paper1Quantity = (double) paper1.get("quantity"); // tone
			paper1Quantity = paper1Quantity * 1000000; // gram 			
			Integer paper1Cut = (Integer) map.get("paperCust1");
			

			double paper2Width = (double) paper2.get("width"); // cm
			double paper2Length = (double) paper2.get("length"); // cm
			double gsm2 = (double) paper1.get("gsm");
			paper2Width = paper2Width / 100; // convert into meter
			paper2Length = paper2Length / 100; // convert into meter
			
			double paper2Weight = paper2Width * paper2Length * gsm2; // gram per meter square
			double paper2WeightOrder = (double) paper2.get("quantity"); // tone
			
			paper2WeightOrder = paper2WeightOrder * 1000000; // gram 
			Integer paper2Cut = (Integer) map.get("paperCust2");

			double paper1Produce = (double) (paper1.containsKey("produced")?paper1.get("produced"):0d),
					paper2Produce = (double) (paper2.containsKey("produced")?paper2.get("produced"):0d);
//			boolean isPaper1OrederReached = false;
//			boolean isPaper2OrederReached = false;
			double prod1= 0d;
			double prod2=0d;
			
			while ((paper1Quantity >= paper1Produce) && (paper2WeightOrder >= paper2Produce)) {				
								
				paper1Produce = paper1Produce + (paper1Cut * paper1Weight);
				paper2Produce = paper2Produce + (paper2Cut * paper2Weight);
				paper1.put("produced", paper1Produce );
				paper2.put("produced", paper2Produce);				
				
				prod1 = prod1 + (paper1Cut * paper1Weight);
				prod2 = prod2 + (paper2Cut * paper2Weight);
				
			}
			
			double Remaining1=0d, Remaining2=0d;			
			if (paper1Quantity <= paper1Produce) {
				paper1.put("isDone", true);			
				
			}
			if (paper2WeightOrder <= paper2Produce) {
				paper2.put("isDone", true);
				
			}			
			map.put("prod1", prod1);	map.put("prod2", prod2);			
			map.put("total_prod1", paper1Produce);	map.put("total_prod2", paper2Produce);
			
			double sheets1 = paper1Produce/paper1Weight, sheets2 = paper2Produce/paper2Weight;
			
			map.put("sheets1", sheets1); map.put("sheets2", sheets2);		
			map.put("Remain1", Remaining1);	map.put("Remain2", Remaining2);	
			
			if(paper1Quantity > paper1Produce) {
				Remaining1 = paper1Quantity-paper1Produce;		
			
			}
			
			if(paper2WeightOrder > paper2Produce) {
				Remaining2 = paper2WeightOrder-paper2Produce;	
			
			}
			
			
			calculatedMap.put(calculatedMapId+"", map);		
			
			leftOrederSize = paperDetails.entrySet().stream().filter(i -> !i.getValue().containsKey("isDone"))
					.collect(Collectors.toList()).size();
			
		
		}
		
		
		
		modelMap.put("orderDetails", paperDetails);
		modelMap.put("prod", calculatedMap);
					
	}	
	
	}
	


	public Map<String, Object> getOrdersToProcessWithMinWastage() {

	Map<String, Map<String,Object>> tmpOrderMap = paperDetails.entrySet().stream().filter(i->!i.getValue().containsKey("isDone"))
		.collect(Collectors.toMap(Map.Entry::getKey, Map.Entry::getValue));
	
		Set<String> keys = tmpOrderMap.keySet();		
		
		List<String> keysList = keys.stream().sorted().collect(Collectors.toList());
		Map<Double,Map<String, Object>> minWastageCalculatedOrderList = new HashMap<Double,Map<String, Object>>();
		
		for (int i = 0; i < keysList.size() - 1; i++)
		{
			Map<String,Object> calMap = paperWastageCalculate(keysList.get(0), keysList.get(i + 1), rw);
			
			minWastageCalculatedOrderList.put((Double) calMap.get("wastage"),calMap);
		}
		
		System.out.println("calualte minimum wastage...........................");
		System.out.println(minWastageCalculatedOrderList);	
		
		
		
		
		List<Double> keys2 = minWastageCalculatedOrderList.keySet().stream().collect(Collectors.toList());
		keys2.sort((i1,i2)->i1.compareTo(i2));
		
		
		System.out.println(keys2);
		
		return minWastageCalculatedOrderList.get(keys2.get(0));
	}
	
	

	
	
	private Map<String, Object> paperWastageCalculate(String paperKey1, String paperKey2, double rw) {

		double width1 = (Double) paperDetails.get(paperKey1).get("width");
		double width2 = (Double) paperDetails.get(paperKey2).get("width");
		
		if(width1>width2) {
			String tmpPaperKey1 = paperKey1;
			paperKey1=paperKey2;
			paperKey2 = tmpPaperKey1;			
			width1 = (Double) paperDetails.get(paperKey1).get("width");
			width2 = (Double) paperDetails.get(paperKey2).get("width");
		} 
		
		String paperCountStr1 = (rw / width1) + "";
		paperCountStr1 = paperCountStr1.split("\\.")[0];//3
		
		int paperCount1 = Integer.parseInt(paperCountStr1);
		
		double firstPageWastageWidth = rw % width1;//52
		
		Integer tmpFirstPageCount = 0, tmpSecondPageCount = 0;
		
		Map<Double, Map<String, Object>> allPaperCalculatioin = new HashMap<Double, Map<String, Object>>();
		
		tmpFirstPageCount = paperCount1;//3
		
		
		for (int i = 0; i < paperCount1; i++) {
			tmpFirstPageCount = tmpFirstPageCount - 1;//2,1,0
			tmpSecondPageCount = tmpSecondPageCount + 1;//1,2,3------------240+52%68.6
			
			//double wastage = rw-((width1*tmpFirstPageCount)+(width2*tmpSecondPageCount));
			double wastage = ((width1 * tmpSecondPageCount) + firstPageWastageWidth) % width2;	//(80*1+52)%68.6=63.4-----------160+52%68.6=6.2
			
     		Map<String, Object> calculatedPaper = new HashMap<>();
			calculatedPaper.put("paper1", paperKey1);
			calculatedPaper.put("paper2", paperKey2);
			calculatedPaper.put("paperCust1", tmpFirstPageCount);//2,1,0
			calculatedPaper.put("paperCust2", tmpSecondPageCount);//1,2,3
			calculatedPaper.put("wastage", wastage);		
						
			if(tmpFirstPageCount>=1 && tmpSecondPageCount>=1 ) {
			
			allPaperCalculatioin.put(wastage, calculatedPaper);
			}
			              
		}
		
		
		
		System.out.println("------------wastage and all paper calculation----------");
	 
		System.out.println(allPaperCalculatioin);
		
		List<Double> list = allPaperCalculatioin.keySet().stream().sorted().collect(Collectors.toList());
		
		return allPaperCalculatioin.get(list.get(0));
	}

	
	
	

	public  Map<String, Map<String, Object>> getPaperOrdersMap(HashMap<String, String> param) {
		
		
		
		String strOrderIds = param.get("order_ids").toString();
		String[] strIdsArrays =  strOrderIds.split(",");
		
		List<String> orderIdsList = new LinkedList<String>();
		
		for(int i=0;i<strIdsArrays.length;i++) {
			if(strIdsArrays[i].length()>0) {
				orderIdsList.add(strIdsArrays[i]);				
			}
		}
		



		Map<String, Map<String, Object>> paperOrdersMap = new HashMap<String, Map<String, Object>>();
		
		for(String orderId : orderIdsList) {			
			
			Map<String, Object> paperOrder = new HashMap<String, Object>();
		
			paperOrder.put("gsm", Double.parseDouble(param.get("gsm_"+orderId)));
			paperOrder.put("partyName", param.get("partyname_"+orderId));
			paperOrder.put("width", Double.parseDouble(param.get("size_"+orderId).split("-")[0]));
			paperOrder.put("length", Double.parseDouble(param.get("size_"+orderId).split("-")[1]));
			paperOrder.put("quantity", Double.parseDouble(param.get("quantity_"+orderId)));
			paperOrder.put("priority", Integer.parseInt(param.get("priority_"+orderId)));	
			paperOrder.put("papertype", Integer.parseInt(param.get("papertype_"+orderId)));	
			
			paperOrder.put("orderdate", param.get("orderdate_"+orderId));
			
			System.out.println(param.get("orderdate_"+orderId));
			
			paperOrdersMap.put(orderId, paperOrder);
			
//			 storeInDb(paperOrder);
			
			
		}		
		return paperOrdersMap;
	}
	
	
	private void saveOrders() {
		
		  for(Entry<String, Map<String, Object>> dataMap: paperDetails.entrySet()) {
				DackleOrders myData = new DackleOrders();
				
		        myData.setGsm((Double) dataMap.getValue().get("gsm"));
		        myData.setPapertype((Integer) dataMap.getValue().get("papertype"));
		        myData.setPriority((Integer) dataMap.getValue().get("priority"));
		        myData.setQuantity((Double) dataMap.getValue().get("quantity"));
		        myData.setPartyName((String) dataMap.getValue().get("partyName"));
		        myData.setWidth((Double) dataMap.getValue().get("width"));
		        myData.setLength((Double) dataMap.getValue().get("length"));
		       
		        
		        try {
					Date date1=new SimpleDateFormat("yyyy-MM-dd").parse((String) dataMap.getValue().get("orderdate"));
					
					System.out.println(date1);
					
					 myData.setOrdDate(date1);
					
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}  

		        
		        
		        myDataRepository.save(myData);
	        }
		
	}

	public Boolean login(ModelMap modelMap, HashMap<String, String> param) {
		
		String username = param.get("username");
		String password = param.get("password");
		
		List<DackleSystemUser> userInfo = dackleSystemUserRepository.findAllByUserName(username);
		
		if(userInfo!=null && userInfo.size()>0) {
		System.out.println(userInfo.get(0).getContactNo());
		
		if(password.equals(userInfo.get(0).getPassword())) {
			return true;
		}
		}
		
				return false;		
	}

	public void getPrevOrders(ModelMap modelMap, HashMap<String, String> param) {
		
		String fromdate = param.get("fromdate");
		String todate = param.get("todate");
		String partyName = param.get("partyname");
		String gsm = param.get("gsm");
		String quantity = param.get("quantity");
		
		//System.out.println(fromdate + todate);
		
		String flt = "";
		
		
		
		flt = (partyName!=null&&!partyName.isEmpty())?" where party_name LIKE '%"+partyName+"%'":flt;
		flt = (fromdate!=null && !fromdate.isEmpty() && todate!=null && !todate.isEmpty())? flt.length()==0?" where ord_date BETWEEN '"+fromdate+"' AND '"+todate+"' ": flt+" and ord_date BETWEEN '"+fromdate+"' AND '"+todate+"' ":flt;
		
		
		
		flt = (gsm!=null && !gsm.isEmpty())? flt.length()==0?" where gsm ="+gsm+"": flt+" and gsm ="+gsm+"" :flt;
		flt = (quantity!=null && !quantity.isEmpty())? flt.length()==0?" where order_qty="+quantity+"":flt+ " and order_qty="+quantity+"":flt;
		
		
		String query ="SELECT * FROM railway.dackle_orders "+flt+";";
		
		List<DackleOrders> orders = template.query(query, BeanPropertyRowMapper.newInstance(DackleOrders.class));
		
		//System.out.println(orders.size());
		
		modelMap.put("orders", orders);
		modelMap.put("fromdate", fromdate);
		modelMap.put("todate", todate);
		
		modelMap.put("partyname", partyName);
		modelMap.put("gsm", gsm);
		modelMap.put("quantity", quantity);
		
	}
	
	
	
		
		
		public void userRegistration(ModelMap modelMap, HashMap<String, String> param) {
			
			DackleSystemUser myData = new DackleSystemUser();
			
	
			 myData.setName((String) param.get("name"));
			 myData.setGender(Integer.parseInt(param.get("gender")));
			 myData.setUserName((String) param.get("userName"));
			 myData.setContactNo((String) param.get("contactNo"));
			 myData.setMailId((String) param.get("mailId"));
			 myData.setCreateDate(new Date());
			 myData.setActive(true);
			 myData.setPassword((String) param.get("password"));
			 
			 myData.setGender(Integer.parseInt( param.get("gender")));	
			 
			 dackleSystemUserRepository.save(myData);
			
		        
	        }
		
	}
	
	
	
	
	

