//package com.coi;
//
//
//import org.springframework.stereotype.Service;
//import org.springframework.beans.factory.annotation.Autowired;
//
//import java.util.Map;
//
//@Service
//public class MyDataService implements MyDataRepository  {
//
//    @Autowired
//    private MyDataRepository myDataRepository;
//
//    public void addData(Map<String, Object> dataMap) {
//        DackleDataInsertionDO myData = new DackleDataInsertionDO();
//        myData.setGsm((Double) dataMap.get("gsm"));
//        myData.setPapertype((Double) dataMap.get("papertype"));
//        myData.setPriority((Double) dataMap.get("priority"));
//        myData.setQuantity((Double) dataMap.get("quantity"));
//        myData.setPartyName((String) dataMap.get("partyName"));
//        myData.setSize((Double) dataMap.get("length")+"*"+(Double) dataMap.get("width"));
//        myDataRepository.save(myData);
//    }
//
//	@Override
//	public void save(DackleDataInsertionDO myData) {
//		// TODO Auto-generated method stub
//		
//	}
//}