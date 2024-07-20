/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dal;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import model.Category;

/**
 *
 * @author acer
 */
public class CategoryDAO extends DBContext{
    public List<Category> getAll() {
        List<Category> list = new ArrayList();
        String sql = "select * from Category";
        try {
            PreparedStatement st = connection.prepareStatement(sql);
            ResultSet rs = st.executeQuery();
            while(rs.next()) {
                Category cat = new Category(rs.getInt("cat_id"), rs.getString("cat_name"));
                list.add(cat);
            }
            return list;
        } catch (Exception e) {
            System.out.println("problem with getAll, location CategoryDAO");
            System.out.println(e);
        }
        return null;
    }
   
}
