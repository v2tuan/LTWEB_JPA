package vn.iotstar.services;

import vn.iotstar.entity.Category;

import java.util.List;

public interface ICategoryService {
    void insert(Category category);

    void update(Category category);

    void delete(int cateid) throws Exception;

    Category findById(int id);

    List<Category> findAll();

    List<Category> findByCategoryName(String catname);

    List<Category> findAll(int page, int pageSize);

    int count();
}
