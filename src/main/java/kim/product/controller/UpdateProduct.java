package kim.product.controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import common.controller.AbstractController;
import kim.product.model.InterProductDAO;
import kim.product.model.ProductDAO;

public class UpdateProduct extends AbstractController {

	@Override
	public void execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		if( super.checkLogin(request) ) {
			// 로그인을 했으면
			HttpSession session = request.getSession();
			String loginuserid = (String) session.getAttribute("userid");
			
			if(loginuserid.equalsIgnoreCase("admin")) {
			
				/* !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!
			         파일을 첨부해서 보내는 폼태그가 
			         enctype="multipart/form-data" 으로 되어었다라면
				     HttpServletRequest request 을 사용해서는 데이터값을 받아올 수 없다.
				     이때는 cos.jar 라이브러리를 다운받아 사용하도록 한 후  
				     아래의 객체를 사용해서 데이터 값 및 첨부되어진 파일까지 받아올 수 있다.
				   !!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!    
				*/
				   MultipartRequest mtrequest = null;
				/*
				    MultipartRequest mtrequest 은 
				    HttpServletRequest request 가 하던일을 그대로 승계받아서 일처리를 해주고 
				    동시에 파일을 받아서 업로드, 다운로드까지 해주는 기능이 있다. 	  
				*/
				
				   // 1. 첨부되어진 파일을 디스크의 어느경로에 업로드 할 것인지 그 경로를 설정해야 한다.
				   ServletContext svlCtx = session.getServletContext();
				   String uploadFileDir = "C:\\Users\\sist\\git\\Dream\\Dream\\src\\main\\webapp\\images\\제품이미지";
			   //    System.out.println("=== 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> " + uploadFileDir);  
			   //  === 첨부되어지는 이미지 파일이 올라가는 절대경로 uploadFileDir ==> C:\NCS\workspace(jsp)\.metadata\.plugins\org.eclipse.wst.server.core\tmp1\wtpwebapps\MyMVC\images    
				
			   //  uploadFileDir = "C:\\NCS\\workspace(jsp)\\MyMVC\\src\\main\\webapp\\images";
			   //  위와 같이 하면 파일 업로드 후에 이클립스에서 새로고침을 해주어야 한다.
				   
			/*
			    MultipartRequest의 객체가 생성됨과 동시에 파일 업로드가 이루어 진다.
						 
			    MultipartRequest(HttpServletRequest request,
				       	         String saveDirectory, -- 파일이 저장될 경로
					             int maxPostSize,      -- 업로드할 파일 1개의 최대 크기(byte)
					             String encoding,
					             FileRenamePolicy policy) -- 중복된 파일명이 올라갈 경우 파일명다음에 자동으로 숫자가 붙어서 올라간다.   
					   
			    파일을 저장할 디렉토리를 지정할 수 있으며, 업로드제한 용량을 설정할 수 있다.(바이트단위). 
			    이때 업로드 제한 용량을 넘어서 업로드를 시도하면 IOException 발생된다. 
			    또한 국제화 지원을 위한 인코딩 방식을 지정할 수 있으며, 중복 파일 처리 인터페이스를사용할 수 있다.
					   		
			    이때 업로드 파일 크기의 최대크기를 초과하는 경우이라면 
			    IOException 이 발생된다.
			    그러므로 Exception 처리를 해주어야 한다.                
			 */	   
		
			       // === 파일을 업로드 해준다. === 
				   try {	   
					    mtrequest = new MultipartRequest(request, uploadFileDir, 10*1024*1024, "UTF-8", new DefaultFileRenamePolicy());  
				   } catch(IOException e) {
					    request.setAttribute("message", "업로드 되어질 경로가 잘못되었거나 또는 최대용량 10MB를 초과했으므로 파일업로드 실패함!!");
						request.setAttribute("loc", request.getContextPath()+"/shop/admin/productRegister.up"); 
				   	  
						super.setViewPage("/WEB-INF/msg.jsp");
						return; // 종료
				   }
				   
			       // === 첨부 이미지 파일, 제품설명서 파일을 올렸으니 그 다음으로 제품정보를 (제품명, 정가, 제품수량,...) DB의 tbl_product 테이블에 insert 를 해주어야 한다.  === 	   
				   
			    
				    String product_num = mtrequest.getParameter("product_num");
					String product_name = mtrequest.getParameter("product_name");
					String price = mtrequest.getParameter("price");
					String discount_rate = mtrequest.getParameter("discount_rate");
					String product_content = mtrequest.getParameter("product_content");
					int length = Integer.parseInt(mtrequest.getParameter("length"));
					String img_list = "";
					for(int i=0; i<length; i++) {
						img_list += mtrequest.getParameter("image"+i);
						img_list += ",";
					}
					if(mtrequest.getParameter("attachCount") != "0") {
						System.out.println("add_length"+mtrequest.getParameter("attachCount"));
						int add_length = Integer.parseInt(mtrequest.getParameter("attachCount"));
						for(int i=0; i<add_length; i++) {
							img_list += mtrequest.getFilesystemName("attach"+i);
							img_list += ",";
						}
					}
					
					
					
					
			
					img_list = img_list.substring(0, img_list.length() - 1);
					System.out.println(img_list);
					
					
					
					Map<String, String> paraMap = new HashMap<>();
					paraMap.put("product_name", product_name);
					paraMap.put("price", price);
					paraMap.put("discount_rate", discount_rate);
					paraMap.put("product_content", product_content);
					paraMap.put("img_list", img_list);
					paraMap.put("product_num",product_num);
					
					
		
	
					
					
				  // !!!! 크로스 사이트 스크립트 공격에 대응하는 안전한 코드(시큐어코드) 작성하기 !!!! // 
					/*
					 String pcontent = mtrequest.getParameter("pcontent");
				    pcontent = pcontent.replaceAll("<", "&lt;");
				    pcontent = pcontent.replaceAll(">", "&gt;");
					  */
					
				
				InterProductDAO pdao = new ProductDAO();
				
				int n = pdao.UpdateProduct(paraMap);
				
				if(n ==1 ) {//제품 정보 수정 성공
					String message = "제품 정보가 성공적으로 수정되었습니다";
					String loc = "javascript:location.href = document.referrer";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
				//	super.setRedirect(false);
					super.setViewPage("/WEB-INF/view/msg.jsp");
					return;
				}
				else{//제품 정보 수정 실패
					String message = "제품 정보 수정에 실패했습니다";
					String loc = "javascript:location.href = document.referrer";
					
					request.setAttribute("message", message);
					request.setAttribute("loc", loc);
					
				//	super.setRedirect(false);
					super.setViewPage("/WEB-INF/view/msg.jsp");
					return;
				}
				
			
			
			
				
			}
			else { //  로그인은했는디 일반유저여
				System.out.println("관리자만 이용가능한 기능입니다");
				
				String message = "관리자만 이용가능한 기능입니다!";
				String loc = "javascript:location.href = document.referrer";
				
				request.setAttribute("message", message);
				request.setAttribute("loc", loc);
				
			//	super.setRedirect(false);
				super.setViewPage("/WEB-INF/view/msg.jsp");
				return;
			}
		}else {
			// 로그인을 안 했으면
			String message = "로그인 하세요!!!";
			String loc = "javascript:history.back()";
			
			request.setAttribute("message", message);
			request.setAttribute("loc", loc);
			
		//	super.setRedirect(false);
			super.setViewPage("/WEB-INF/view/msg.jsp");
		}

	}

}
