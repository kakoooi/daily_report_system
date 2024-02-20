package services;

import java.time.LocalDateTime;
import java.util.List;

import actions.views.FavoriteConverter;
import actions.views.FavoriteView;
import actions.views.ReportConverter;
import actions.views.ReportView;
import models.Report;

/**
 * 日報テーブルにおける「いいね」の操作に関わる処理を行うクラス
 *
 */
public class FavoriteService extends ServiceBase{

    /**
     * idを条件に取得したデータをReportViewのインスタンスで返却する
     * @param id
     * @return 取得データのインスタンス
     */
    public ReportView findOne(int id) {
        return ReportConverter.toView(findOneInternal(id));
    }

    /**
     * 画面で「いいね」を押したらデータを1件作成し、「いいね」テーブルに登録する
     * @param fv 「いいね」の登録内容
     */
    public List<String> create(FavoriteView fv){
        LocalDateTime ldt = LocalDateTime.now();
        fv.setCreatedAt(ldt);
        fv.setUpdatedAt(ldt);
        createInternal(fv);
        return null;
    }

    /**
     * idを条件にデータを1件取得し、Reportのインスタンスで返却する
     * @param id
     * @return 取得データのインスタンス
     */
    private Report findOneInternal(int id) {
        return em.find(Report.class, id);
    }

     /**
     * 「いいね」データを1件登録する
     * @param fv
     */
    private void createInternal(FavoriteView fv) {

        em.getTransaction().begin();
        em.persist(FavoriteConverter.toModel(fv));
        em.getTransaction().commit();


    }

    /**
     * idを条件にいいねデータを削除する
     * @param id
     */
    public void destroy(Integer id) {

        //idを条件に登録済みの従業員情報を取得する
        FavoriteView savedFav = findOne(id);

        em.getTransaction().begin();
        em.remove(savedFav);
        em.getTransaction().commit();
        em.close();
    }

}
