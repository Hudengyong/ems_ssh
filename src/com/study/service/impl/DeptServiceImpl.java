package com.study.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.study.dao.DeptDao;
import com.study.domain.Dept;
import com.study.service.DeptService;

/**
 * @author Mr.Hu
 *
 */
public class DeptServiceImpl implements DeptService {
	
	private DeptDao deptDao;
	
	public void setDeptDao(DeptDao deptDao) {
		this.deptDao = deptDao;
	}
	/**
	 * 添加部门
	 */
	public void addDepartment(Dept dept) {
			try {
				deptDao.addMethod(dept);
			} catch (Exception e) {
				e.printStackTrace();
			}
	}
	public List<Dept> listAllDept() {
		
			try {
				return deptDao.queryAllMethod();
			} catch (Exception e) {
				e.printStackTrace();
			}
			return null;
	}
	/*public List<Dept> listAllDept2(String page, String rows) {
		
			return deptDao.listAllDept2(page,rows);
			
	}*/
	/**
	 * 修改部门信息
	 */
	public void editDept(Dept dept) {
		
			deptDao.editMethod(dept);
			
	}
	/**
	 * 删除部门
	 */
	public void delDept(String deptIdsStr) {
		
		String[] split = deptIdsStr.split("-");
		List<Integer> deptIds=new ArrayList<>();
		for(int i=0;i<split.length;i++) {
			deptIds.add(Integer.parseInt(split[i]));
		};
			for (Integer deptId : deptIds) {
				deptDao.delMethod(deptId.intValue());
			}
		
	}
	@Override
	public List<Dept> listAllDept2(String page, String rows) {
		return null;
	}

}
