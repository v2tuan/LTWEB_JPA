package vn.iotstar.services.impl;

import vn.iotstar.services.ICategoryService;
import vn.iotstar.dao.ICategoryDao;
import vn.iotstar.dao.impl.CategoryDao;
import vn.iotstar.entity.Category;

import java.util.List;

public class CategoryService implements ICategoryService {
    ICategoryDao cateDao = new CategoryDao();
    @Override
    public void insert(Category category) {
        cateDao.insert(category);
    }

    @Override
    public void update(Category category) {
        cateDao.update(category);
    }

    @Override
    public void delete(int cateid) throws Exception {
        cateDao.delete(cateid);
    }

    @Override
    public Category findById(int id) {
        return cateDao.findById(id);
    }

    @Override
    public List<Category> findAll() {
        return cateDao.findAll();
    }

    @Override
    public List<Category> findByCategoryName(String catname) {
        return cateDao.findByCategoryName(catname);
    }

    @Override
    public List<Category> findAll(int page, int pageSize) {
        return cateDao.findAll(page, pageSize);
    }

    @Override
    public int count() {
        return cateDao.count();
    }
}
