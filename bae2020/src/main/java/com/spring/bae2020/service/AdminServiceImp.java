package com.spring.bae2020.service;

import java.io.FileOutputStream;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.context.request.RequestContextHolder;
import org.springframework.web.context.request.ServletRequestAttributes;
import org.springframework.web.multipart.MultipartFile;

import com.spring.bae2020.dao.AdminDao;
import com.spring.bae2020.vo.CategoryVo;
import com.spring.bae2020.vo.OptionsVo;
import com.spring.bae2020.vo.ProductVo;
import com.spring.bae2020.vo.SubcategoryVo;

@Service
public class AdminServiceImp implements AdminService{
	@Autowired
	AdminDao adminDao;

	@Override
	public List<CategoryVo> findCategory() {
		return adminDao.findCategory();
	}
	
	@Override
	public void insertCategory(String category_name, String first_code, String mid) {
		adminDao.insertCategory(category_name, first_code, mid);
	}

	@Override
	public void updateCategory(String category_name, String first_code, String category_code) {
		adminDao.updateCategory(category_name, first_code, category_code);
	}

	@Override
	public void deleteCategory(String category_code) {
		adminDao.deleteCategory(category_code);
	}

	@Override
	public void insertProduct(MultipartFile file, ProductVo vo) {
		//실제 서버에 파일을 저장시켜주는 메소드
		try {
			String oFileName = file.getOriginalFilename(); //윈도우에서 사용자가 업로드 시킨 파일명
			String oFileExt = oFileName.substring(oFileName.lastIndexOf(".")+1); //확장자명
			
			String category_code= vo.getCategory_code();
			String product_code = adminDao.findProductCodeByCategory(category_code); 
			String category_first_code = category_code.substring(0,category_code.lastIndexOf("-"));
			String first_code = product_code.substring(0,product_code.lastIndexOf("-"));
			
			//서버에 제품코드와 같은 이름으로 파일명 저장.
			String saveFileName = product_code+"."+oFileExt;
			
			writeFile(file, saveFileName,category_first_code, first_code);
			
			//서버에 저장된 파일의 정보를 vo에 담아서 DB에 저장시킨다.
			vo.setProduct_code(product_code);
			vo.setImage(saveFileName);
			
			adminDao.insertProduct(vo); //정상적으로 서버에 파일이 업로드 된 후 DB에 저장하기 위한 메소드
			
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	private void writeFile(MultipartFile file, String saveFileName,String category_first_code, String first_code) throws IOException {
		byte[] data = file.getBytes();
		
		HttpServletRequest request = ((ServletRequestAttributes)RequestContextHolder.currentRequestAttributes()).getRequest();
		String uploadPath = request.getSession().getServletContext().getRealPath("/")+"resources\\"+ category_first_code+"\\"+first_code +"\\";
		
		FileOutputStream fos = new FileOutputStream(uploadPath + saveFileName);
		fos.write(data);  //서버에 파일이 저장된다.
		
		fos.close();		
	}

	@Override
	public List<ProductVo> findProductByCategory(String category_code) {
		return adminDao.findProductByCategory(category_code);
	}

	@Override
	public void updateProduct(MultipartFile file, ProductVo vo) {
		if(vo.getFileEx().equals("false")) {
			adminDao.updateProduct(vo);
		}
		else {
			//실제 서버에 파일을 저장시켜주는 메소드
			try {
				String oFileName = file.getOriginalFilename(); //윈도우에서 사용자가 업로드 시킨 파일명
				String oFileExt = oFileName.substring(oFileName.lastIndexOf(".")+1); //확장자명
				
				String category_code= vo.getCategory_code();
				String product_code = vo.getProduct_code();
				
				String category_first_code = category_code.substring(0,category_code.lastIndexOf("-"));
				String first_code = product_code.substring(0,product_code.lastIndexOf("-"));
				
				//서버에 제품코드와 같은 이름으로 파일명 저장.
				String saveFileName = product_code+"."+oFileExt;
				vo.setImage(saveFileName);
				
				writeFile(file, saveFileName,category_first_code, first_code);
				
				adminDao.updateProduct(vo);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
	}

	@Override
	public void deleteProduc(String product_code) {
		adminDao.deleteProduct(product_code);
	}

	@Override
	public List<SubcategoryVo> findSUbcategoryBycategory(String category_code) {
		return adminDao.findSUbcategoryBycategory(category_code);
	}

	@Override
	public void insertSubcategory(String category_code, String subcategory_name, String first_code, String mid) {
		adminDao.insertSubcategory(category_code, subcategory_name,first_code,mid);
	}

	@Override
	public void updateSubcategory(String subcategory_name, String first_code, String subcategory_code) {
		adminDao.updateSubcategory(subcategory_name,first_code, subcategory_code);
	}

	@Override
	public void deleteSubcategory(String subcategory_code) {
		adminDao.deleteSubcategory(subcategory_code);
	}

	@Override
	public List<ProductVo> findOptionBySubcategory(String subcategory_code) {
		return adminDao.findOptionBySubcategory(subcategory_code);
	}

	@Override
	public void insertOption(MultipartFile file, OptionsVo vo) {
		//실제 서버에 파일을 저장시켜주는 메소드
		try {
			String oFileName = file.getOriginalFilename(); //윈도우에서 사용자가 업로드 시킨 파일명
			String oFileExt = oFileName.substring(oFileName.lastIndexOf(".")+1); //확장자명
			
			String subcategory_code= vo.getSubcategory_code();
			String option_code = adminDao.findOptionCodeeByCategory(subcategory_code); 
			
			String subcategory_first_code = subcategory_code.substring(0,subcategory_code.lastIndexOf("-"));
			String first_code = option_code.substring(0,option_code.lastIndexOf("-"));
			
			//서버에 제품코드와 같은 이름으로 파일명 저장.
			String saveFileName = option_code+"."+oFileExt;
			
			writeFile(file, saveFileName,subcategory_first_code, first_code);
			
			//서버에 저장된 파일의 정보를 vo에 담아서 DB에 저장시킨다.
			vo.setOption_code(option_code);
			vo.setImage(saveFileName);
			
			adminDao.insertOption(vo); //정상적으로 서버에 파일이 업로드 된 후 DB에 저장하기 위한 메소드
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void updateOption(MultipartFile file, OptionsVo vo) {
		if(vo.getFileEx().equals("false")) {
			adminDao.updateOption(vo);
		}
		else {
			//실제 서버에 파일을 저장시켜주는 메소드
			try {
				String oFileName = file.getOriginalFilename(); //윈도우에서 사용자가 업로드 시킨 파일명
				String oFileExt = oFileName.substring(oFileName.lastIndexOf(".")+1); //확장자명
				
				String subcategory_code= vo.getSubcategory_code();
				String option_code = vo.getOption_code();
				
				String subcategory_first_code = subcategory_code.substring(0,subcategory_code.lastIndexOf("-"));
				String first_code = option_code.substring(0,option_code.lastIndexOf("-"));
				
				//서버에 제품코드와 같은 이름으로 파일명 저장.
				String saveFileName = option_code+"."+oFileExt;
				vo.setImage(saveFileName);
				
				writeFile(file, saveFileName,subcategory_first_code, first_code);
				
				adminDao.updateOption(vo);
				
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}
}




