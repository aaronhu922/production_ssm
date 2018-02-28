/**
 * 
 */
package org.hqu.production_ms.controller;

import org.hqu.production_ms.domain.customize.EUDataGridResult;
import org.hqu.production_ms.service.DueBottleService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

/**
 * @author aahu
 *
 */

@Controller
@RequestMapping("/dueBottle")
public class DueBottleController {

	@Autowired
	private DueBottleService dueBottleService;
	
	//根据客户id查找
	@RequestMapping("/get_duebottles_by_customer")
	@ResponseBody
	public EUDataGridResult getDueBottlesByCustomerID(String searchValue) throws Exception{
		EUDataGridResult result = dueBottleService.getDueBottlesByCustomID(searchValue);
		return result;
	}

	
}
