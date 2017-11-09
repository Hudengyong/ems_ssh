package com.study.domain;

import java.util.HashSet;
import java.util.Set;

public class Dept {
		private int id;
		private String  dname;
		private String location;
		private Set<Emp> emps=new HashSet<>();
		
		public Set<Emp> getEmps() {
			return emps;
		}
		public void setEmps(Set<Emp> emps) {
			this.emps = emps;
		}
		public int getId() {
			return id;
		}
		public void setId(int id) {
			this.id = id;
		}
		public String getDname() {
			return dname;
		}
		public void setDname(String dname) {
			this.dname = dname;
		}
		public String getLocation() {
			return location;
		}
		public void setLocation(String location) {
			this.location = location;
		}
		@Override
		public String toString() {
			return "Dept [id=" + id + ", dname=" + dname + ", location=" + location + "]";
		}
		
}
