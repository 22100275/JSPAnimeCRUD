package com.example.jspanimecrud;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.sql.SQLException;

public class FileUpload {

    public BoardVO uploadPhoto(HttpServletRequest request) {
        String filename = "";
        int sizeLimit = 15 * 1024 * 1024; // 15 MB

        String realPath = request.getServletContext().getRealPath("upload");
        File dir = new File(realPath);
        if (!dir.exists()) dir.mkdirs();

        BoardVO one = new BoardVO();
        MultipartRequest multpartRequest = null;
        try {
            multpartRequest = new MultipartRequest(
                    request,
                    realPath,
                    sizeLimit,
                    "utf-8",
                    new DefaultFileRenamePolicy()
            );

            // 파일명 설정
            filename = multpartRequest.getFilesystemName("img");
            one.setImg(filename); // 파일 이름 설정

            // 나머지 파라미터 설정
            String no = multpartRequest.getParameter("no");
            if (no != null && !no.equals("")) one.setNo(Integer.parseInt(no));
            one.setName(multpartRequest.getParameter("name"));
            one.setAuthor(multpartRequest.getParameter("author"));
            one.setGenre(multpartRequest.getParameter("genre"));
            // 날짜는 다루지 않을 것이므로 해당 코드는 제외하였습니다.
            // one.setDate(Date.valueOf(multpartRequest.getParameter("date"))); // 'date' 필드가 있다고 가정하면 이와 같이 설정해야 함.
            one.setRating(Integer.parseInt(multpartRequest.getParameter("rating")));
            one.setEpisode(Integer.parseInt(multpartRequest.getParameter("episode")));
            one.setPg(Integer.parseInt(multpartRequest.getParameter("pg")));
            one.setDirector(multpartRequest.getParameter("director"));

            if(no!=null&&!no.equals("")) {
                BoardDAO dao = new BoardDAO();
                String oldfilename = dao.getPhotoFilename(Integer.parseInt(no));
                if(filename!=null && oldfilename != null) {
                    FileUpload.deleteFile(request, oldfilename);
                }
                else if(filename == null && oldfilename != null) {
                    filename = oldfilename;
                }
            }
            one.setImg(filename);
            return one; // BoardVO 객체 반환

        } catch (IOException e) {
            e.printStackTrace();
            return null; // 예외가 발생하면 null 반환
        } catch (NumberFormatException e) {
            e.printStackTrace();
            return null; // 숫자 변환 중 예외가 발생하면 null 반환
        }
    }



    public static void deleteFile(HttpServletRequest request, String filename) {
        String filePath = request.getServletContext().getRealPath("upload");

        File f = new File(filePath + "/" + filename);
        if(f.exists()) f.delete();
    }
}
