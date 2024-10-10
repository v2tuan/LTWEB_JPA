package vn.iotstar.dao;

import vn.iotstar.entity.Video;

import java.util.List;

public interface IVideoDao {
    void insert(Video video);

    void update(Video video);

    void delete(String videoID) throws Exception;

    Video findById(String id);

    List<Video> findAll();

    List<Video> findAll(int page, int pageSize);

    int count();
}
