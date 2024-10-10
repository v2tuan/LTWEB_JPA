package vn.iotstar.dao.impl;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;
import jakarta.persistence.Query;
import jakarta.persistence.TypedQuery;
import vn.iotstar.configs.JPAConfig;
import vn.iotstar.dao.IVideoDao;
import vn.iotstar.entity.Video;

import java.util.List;

public class VideoDao implements IVideoDao {

    @Override
    public void insert(Video video) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try{
            trans.begin();
            // gọi phuowng th insert, update, delete
            enma.persist(video);
            trans.commit();
        }
        catch(Exception e){
            e.printStackTrace();
            trans.rollback();
            throw e;
        }
        finally{
            enma.close();
        }
    }

    @Override
    public void update(Video video) {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try{
            trans.begin();
            // gọi phuowng th insert, update, delete
            enma.merge(video);
            trans.commit();
        }
        catch(Exception e){
            e.printStackTrace();
            trans.rollback();
            throw e;
        }
        finally{
            enma.close();
        }
    }

    @Override
    public void delete(String videoID) throws Exception {
        EntityManager enma = JPAConfig.getEntityManager();
        EntityTransaction trans = enma.getTransaction();
        try{
            trans.begin();
            // gọi phuowng th insert, update, delete
            Video video = enma.find(Video.class, videoID);
            if(video != null){
                enma.remove(video);

            }
            else {
                throw new Exception("Video not found");
            }
            trans.commit();
        }
        catch(Exception e){
            e.printStackTrace();
            trans.rollback();
            throw e;
        }
        finally{
            enma.close();
        }
    }

    @Override
    public Video findById(String id) {
        EntityManager enma = JPAConfig.getEntityManager();
        Video video = enma.find(Video.class, id);
        return video;
    }

    @Override
    public List<Video> findAll() {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
        return query.getResultList();
    }

    @Override
    public List<Video> findAll(int page, int pageSize) {
        EntityManager enma = JPAConfig.getEntityManager();
        TypedQuery<Video> query = enma.createNamedQuery("Video.findAll", Video.class);
        query.setFirstResult(page * pageSize);
        query.setMaxResults(pageSize);
        return query.getResultList();
    }

    @Override
    public int count() {
        EntityManager enma = JPAConfig.getEntityManager();
        String jpql = "SELECT COUNT(*) FROM Video";
        Query query = enma.createQuery(jpql);
        return ((Long) query.getSingleResult()).intValue();
    }
}
