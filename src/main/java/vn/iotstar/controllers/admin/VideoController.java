package vn.iotstar.controllers.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.Part;
import vn.iotstar.entity.Category;
import vn.iotstar.entity.Video;
import vn.iotstar.services.ICategoryService;
import vn.iotstar.services.IVideoService;
import vn.iotstar.services.impl.CategoryService;
import vn.iotstar.services.impl.VideoService;
import vn.iotstar.utils.Constant;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.util.List;

/*
@MultipartConfig cho phép servlet xử lý việc tải lên nhiều tệp,
với giới hạn về kích thước tệp là 5MB và tổng kích thước yêu cầu là 25MB
 */
@MultipartConfig(fileSizeThreshold = 1024 * 1024,
        maxFileSize = 1024 * 1024 * 5,
        maxRequestSize = 1024 * 1024 * 5 * 5)
@WebServlet(urlPatterns = {"/admin/videos",
        "/admin/video/add",
        "/admin/video/insert",
        "/admin/video/edit",
        "/admin/video/update",
        "/admin/video/delete",
        "/admin/video/search"})
public class VideoController extends HttpServlet {
    private IVideoService videoService = new VideoService();
    private ICategoryService categoryService = new CategoryService();
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = req.getRequestURI();
        if(url.contains("videos")){
            List<Video> list = videoService.findAll();
            req.setAttribute("list", list);
            req.getRequestDispatcher("/views/admin/video-list.jsp").forward(req, resp);
        }
        else if(url.contains("add")){
            List<Category> list = categoryService.findAll();
            req.setAttribute("listCate", list);
            req.getRequestDispatcher("/views/admin/video-add.jsp").forward(req, resp);
        }
        else if(url.contains("edit")){
            String id = req.getParameter("id").toString();
            Video video = videoService.findById(id);
            req.setAttribute("video", video);
            List<Category> list = categoryService.findAll();
            req.setAttribute("listCate", list);
            req.getRequestDispatcher("/views/admin/video-edit.jsp").forward(req, resp);
        }
        else if(url.contains("delete")){
            String id = req.getParameter("id").toString();
            try{
                videoService.delete(id);
            }catch (Exception e){
                e.printStackTrace();
            }
            resp.sendRedirect(req.getContextPath() + "/admin/videos");
        }
    }

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
//        resp.sendRedirect(req.getContextPath() + "/admin/videos");
        req.setCharacterEncoding("UTF-8");
        resp.setCharacterEncoding("UTF-8");
        String url = req.getRequestURI();
        if (url.contains("insert")){
            Video video = new Video();
            int active = Integer.parseInt(req.getParameter("active"));
            String title = req.getParameter("videoTitle");
            String description = req.getParameter("description");
            int views = Integer.parseInt(req.getParameter("viewCount"));
            int categoryId = Integer.parseInt(req.getParameter("category"));
            String videoID = req.getParameter("videoID");
            video.setTitle(title);
            video.setDescription(description);
            video.setCategory(categoryService.findById(categoryId));
            video.setActive(active);
            video.setViews(views);
            video.setVideoId(videoID);

            String fname="";
            String uploadPath= Constant.UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            try {
                Part part = req.getPart("image");
                if(part.getSize()>0) {
                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();

                    //đổi tên file
                    int index = filename.lastIndexOf(".");
                    String ext = filename.substring(index+1);
                    fname = System.currentTimeMillis() + "." + ext;

                    //up load file
                    part.write(uploadPath + "/" + fname);

                    //ghi tên file vào data
                    video.setPoster(fname);
                }else {
                    video.setPoster("avata.png");
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            videoService.insert(video);
            resp.sendRedirect(req.getContextPath() + "/admin/videos");
        }
        else if(url.contains("update")){
            Video video = new Video();
            int active = Integer.parseInt(req.getParameter("active"));
            String title = req.getParameter("videoTitle");
            String description = req.getParameter("description");
            int views = Integer.parseInt(req.getParameter("viewCount"));
            int categoryId = Integer.parseInt(req.getParameter("category"));
            String videoID = req.getParameter("videoID");
            video.setTitle(title);
            video.setDescription(description);
            video.setCategory(categoryService.findById(categoryId));
            video.setActive(active);
            video.setViews(views);
            video.setVideoId(videoID);

            //lưu hình cũ
            Video videold = videoService.findById(videoID);
            String fileold = videold.getPoster();

            //xử lý images
            String fname="";
            String uploadPath= Constant.UPLOAD_DIRECTORY;
            File uploadDir = new File(uploadPath);
            if(!uploadDir.exists()) {
                uploadDir.mkdir();
            }
            try {
                Part part = req.getPart("image");
                if(part.getSize()>0) {
                    String filename = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    //đổi tên file
                    int index = filename.lastIndexOf(".");
                    String ext = filename.substring(index+1);
                    fname = System.currentTimeMillis() + "." + ext;

                    //up load file
                    part.write(uploadPath + "/" + fname);

                    //ghi tên file vào data
                    video.setPoster(fname);
                }else {
                    video.setPoster(fileold);
                }
            } catch (Exception e) {
                e.printStackTrace();
            }
            videoService.update(video);
            resp.sendRedirect(req.getContextPath() + "/admin/videos");
        }
    }
}
