package com.lanqiao.vo;

import org.apache.poi.hssf.usermodel.HSSFWorkbook;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.Row;
import org.apache.poi.ss.usermodel.Sheet;
import org.apache.poi.ss.usermodel.Workbook;

import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;

public class ReadExcel {

	/**
	 * @param args
	 */
	public static void main(String[] args) {
		InputStream is = null;
		try {
			is = new FileInputStream("xihua.xls");
		} catch (FileNotFoundException e) {
			System.out.println("找不到XLS文件！");
			e.printStackTrace();
		}
		
		try {
			// 创建工作本
			Workbook wb = new HSSFWorkbook(is);
			//得到第一个工作表
			Sheet sheet = wb.getSheetAt(0);
			//得到工作表中的行数
			int numberOfRows = sheet.getPhysicalNumberOfRows();
			System.out.println("总行数：" + numberOfRows);
			for (int rowIdx = 1; rowIdx < numberOfRows; rowIdx++) {
				//得到每一行
				Row row = sheet.getRow(rowIdx);
				//得到每一个单元格
				Cell cell = null;
				cell = row.getCell(0);

				int stuNo = (int)cell.getNumericCellValue();
                if (stuNo == 0) {
                    break;
                }
                cell = row.getCell(1);
				if (cell==null) {
					break;
				}
				String stuName = cell.getStringCellValue();
				
				cell = row.getCell(2);
				String idCard = cell.getStringCellValue();
				
				cell = row.getCell(3);
				String education = cell.getStringCellValue();

                cell = row.getCell(4);
                String profession = cell.getStringCellValue();

                cell = row.getCell(5);
                int phoneNumber = (int) cell.getNumericCellValue();

                cell = row.getCell(6);
                int qqNumber = (int)cell.getNumericCellValue();

                cell = row.getCell(7);
                String city = cell.getStringCellValue();
                Student student = new Student(stuNo, stuName, idCard, education, profession, phoneNumber, qqNumber, city);
//                System.out.println(student);
                System.out.println("序号：" + stuNo +
                        "，姓名：" + stuName +
                        "，身份证：" + idCard +
                        "，学历：" + education +
                        "，专业：" + profession +
                        "，手机号码：" + phoneNumber +
                        "，QQ号：" + qqNumber +
                        "，就业城市：" + city);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
