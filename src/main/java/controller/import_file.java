package controller;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.util.List;
import java.io.BufferedReader;
import java.io.FileReader;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * Servlet implementation class import_file
 */
@WebServlet("/import_file")
public class import_file extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    /**
     * @see HttpServlet#HttpServlet()
     */
    public import_file() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String baoLoi ="";
		String loiAikenChuaFixRegex="File đúng định dạng Aiken format";
		String loiAiken="";
		
		// xử lý upload file khi người dùng nhấn nút thực hiện
				DiskFileItemFactory fileItemFactory = new DiskFileItemFactory();
				ServletFileUpload upload = new ServletFileUpload(fileItemFactory);
				try {
					List<FileItem> fileItems = upload.parseRequest(request);
					for (FileItem fileItem : fileItems) {
						if (!fileItem.isFormField()) {
							// xử lý file
							String nameimg = fileItem.getName();
							System.out.println(nameimg);
							if (!nameimg.equals("")) {
							if ((!nameimg.endsWith(".pdf")) && (!nameimg.endsWith(".txt")) && (!nameimg.endsWith(".doc")) && (!nameimg.endsWith(".docx")))
											baoLoi += "File được chọn không phải là loại file văn bản. Chọn file khác có đuôi txt, pdf, doc, docx";
								request.setAttribute("baoLoi", baoLoi);
								String dirUrl = request.getServletContext()
										.getRealPath("") + File.separator + "files";
								File dir = new File(dirUrl);
								if (!dir.exists()) {
									dir.mkdir();
								}
								String fileImg = dirUrl + File.separator + nameimg;
								File file = new File(fileImg);
								try {
									fileItem.write(file);
									System.out.println("UPLOAD THÀNH CÔNG...!");
									System.out.println("ĐƯỜNG DẪN KIỂM TRA UPLOAD FILE : \n"+dirUrl);
									BufferedReader br = Files.newBufferedReader(file.toPath(), StandardCharsets.UTF_8);
//									String line = null;
//									while (true) {
//										line = br.readLine();
//										if(line==null) {
//											break;
//										} else {
//											System.out.println(line);
//										}
//									}
									
									String line;
									int numberline = 0;
									String regex = "^ANSWER:\\s[A-E]$";

						            while ((line = br.readLine()) != null) {
						            	numberline++;
						                line = line.trim();
						                if (line.isEmpty()) {
						                	loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
						                	loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline + "do khong co noi dung cau hoi";
						                	break;
						                } 
						                else {
						                	String choice ="";
						                	numberline++;
						                	line = br.readLine();
						                	line = line.trim();
						                	if (!line.matches("^A\\.\\s\\S+")) {
						                		loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
						                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline + "loi do dinh dang choice A";
						                		break;
						                	}
						                	else {
						                		numberline++;
						                		choice+="A";
							                	line = br.readLine();
							                	line = line.trim();
							                	if (!line.matches("^B\\.\\s\\S+")) {
							                		loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
							                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline + "loi do dinh dang choice B";
							                		break;
							                	}
							                	else {
							                		numberline++;
							                		choice+="B";
								                	line = br.readLine();
								                	line = line.trim();
								                	if (!line.matches(regex)) {
								                		if (!line.matches("^C\\.\\s\\S+")) {
								                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
									                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline + "loi do dinh dang choice C";
									                		break;
									                	}
								                		else {
								                			numberline++;
									                		choice+="C";
										                	line = br.readLine();
										                	line = line.trim();
										                	if (!line.matches(regex)) {
										                		if (!line.matches("^D\\.\\s\\S+")) {
										                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
											                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+ "loi do dinh dang choice D";
											                		break;
											                	}
										                		else {
										                			numberline++;
											                		choice+="D";
												                	line = br.readLine();
												                	line = line.trim();
												                	if (!line.matches(regex)) {
												                		if (!line.matches("^E\\.\\s\\S+")) {
												                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
													                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline + "loi do dinh dang choice E";
													                		break;
													                	}
												                		else {
												                			numberline++;
													                		choice+="E";
														                	line = br.readLine();
														                	line = line.trim();
														                	if (!line.matches("^ANSWER:\\s[A-E]$")) {
														                		loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
														                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline + "loi do answer";
														                		break;
														                	}
														                	else {
														                		
														                		if (choice.indexOf(line.charAt(8)) == -1)  {
														                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
														                			loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+ "loi do answer khong nam trong so cac choice";
														                			break;
														                		}
														                		else {
														                			numberline++;
														                			line = br.readLine();
														                			if (line.isEmpty()) {
														                				continue;
														                			} else {
														                				loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
														                				loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+"do khong co dong trong sau cau hoi";
														                				break;
														                			}
														                		}
														                	}
												                		}
										                		}
												                	else {
												                		if (!line.matches("^ANSWER:\\s[A-E]$")) {
												                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
													                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline + "loi do answer";
													                		break;
													                	}
													                	else {
													                		
													                		if (choice.indexOf(line.charAt(8)) == -1)  {
													                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
													                			loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline + "loi do answer khong nam trong so cac choice";
													                			break;
													                		}
													                		else {
													                			numberline++;
													                			line = br.readLine();
													                			if (line.isEmpty()) {
													                				continue;
													                			} else {
													                				loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
													                				loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+ "do khong co dong trong sau cau hoi";
													                				break;
													                			}
													                		}
													                	}
												                	}
								                		}
								                	}
										                	else {
										                		if (!line.matches("^ANSWER:\\s[A-E]$")) {
										                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
											                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+"loi do answer";
											                		break;
											                	}
											                	else {
											                		
											                		if (choice.indexOf(line.charAt(8)) == -1)  {
											                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
											                			loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+"loi do answer khong nam trong so cac choice";
											                			break;
											                		}
											                		else {
											                			numberline++;
											                			line = br.readLine();
											                			if (line.isEmpty()) {
											                				continue;
											                			} else {
											                				loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
											                				loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+ "do khong co dong trong sau cau hoi";
											                				break;
											                			}
											                		}
											                	}
										                	}
										                	
							                	}
						                }
								                	else {
								                		if (!line.matches("^ANSWER:\\s[A-E]$")) {
								                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
									                		loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+ "loi do answer";
									                		break;
									                	}
									                	else {
									                		
									                		if (choice.indexOf(line.charAt(8)) == -1)  {
									                			loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
									                			loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+"loi do answer khong nam trong so cac choice";
									                			break;
									                		}
									                		else {
									                			numberline++;
									                			line = br.readLine();
									                			if (line.isEmpty()) {
									                				continue;
									                			} else {
									                				loiAiken = "File không đúng định dạng Aiken tại dòng số "+ numberline;
									                				loiAikenChuaFixRegex = "File không đúng định dạng Aiken tại dòng số "+ numberline+ "do khong co dong trong sau cau hoi";
									                				break;
									                			}
									                		}
									                	}
								                	}
						                
							                	}
						                	}
						                }
						            }      
						            System.out.println(loiAikenChuaFixRegex);
						            System.out.println(loiAiken);
								} catch (Exception e) {
									System.out.println("CÓ LỖI TRONG QUÁ TRÌNH UPLOAD!");
									e.printStackTrace();
								}
							}
						}
					}
					request.setAttribute("loiAiken", loiAiken);
					if(baoLoi.equalsIgnoreCase("") && loiAiken.equalsIgnoreCase("")) {
						request.setAttribute("checkImported", "TVH");
					}
				} catch (FileUploadException e) {
					e.printStackTrace();
				}
				String url="/import_file.jsp";
				
				RequestDispatcher rd = getServletContext().getRequestDispatcher(url);
				rd.forward(request, response);
	}
	
}
