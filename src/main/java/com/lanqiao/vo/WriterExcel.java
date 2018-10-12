package com.lanqiao.vo;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.*;

import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.List;

public class WriterExcel {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		
		List<Student> list = new ArrayList<Student>();
		list.add(new Student(19,"ddd","fds","ddd","菜单",1568,5648,"成都"));
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy/MM/dd");
		FileOutputStream fileOut = null;
		try {
			fileOut = new FileOutputStream("学生信息.xls");
			//创建一个工作簿
			Workbook wb = new HSSFWorkbook();
			Sheet sheet = wb.createSheet("学生信息");
			
			int rowIdx = 0;
			for (Student stu : list) {
				//新建一行
				Row row = sheet.createRow(rowIdx++);
				Cell cell = null;
				cell = row.createCell(0);
				CellStyle style = cell.getCellStyle();
				style.setAlignment(CellStyle.ALIGN_CENTER);
				cell.setCellStyle(style); //设置单元格的样式
				cell.setCellValue(stu.getStuNo());
				
				cell = row.createCell(1);
				cell.setCellValue(stu.getStuName());
				
				cell = row.createCell(2);
				cell.setCellValue(stu.getIdCard());
				
				cell = row.createCell(3);
				cell.setCellValue(stu.getEduction());

				cell = row.createCell(4);
				cell.setCellValue(stu.getProfession());

				cell = row.createCell(5);
				cell.setCellValue(stu.getPhoneNumber());

				cell = row.createCell(6);
				cell.setCellValue(stu.getQqNumber());

				cell = row.createCell(7);
				cell.setCellValue(stu.getCity());
			}
			//写入文件
			wb.write(fileOut);
			fileOut.close();
			System.out.println("--------------完成------------------------");
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

	}

}
