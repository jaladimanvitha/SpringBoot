package com.hexa.dao;

import java.util.List;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.Transaction;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import com.hexa.entity.Category;
import com.hexa.entity.Product;
import com.hexa.entity.Specifications;

/**
 * 
 * @author GANAPATHI, SUBRAMANYAM
 * @version 1.0.0
 * <p> This class contains all the DB queries that are required for the application</p>
 *
 */

@Repository("mydao")
public class DaoImpl implements IDao {

	private SessionFactory sfac;

	@Autowired
	public void setSfac(SessionFactory sfac) {
		this.sfac = sfac;
	}
	
	/**
	 * @return list return list of categories present
	 * <p> This method is used to get the list of categories present in the DB</p>
	 */
	@Override
	public List<Category> getCategory() {
		Session sess = sfac.openSession();
		Query qry = sess.createQuery("from Category c");
		List<Category> list = qry.list();
		sess.close();
		return list;
	}

	/**
	 * @param cid CategoryID
	 * @return list return list of Products present in that category
	 * <p>This method will return list of products present under the category which we specify</p>
	 */
	@Override
	public List<Product> listProduct(int cid) {
		Session sess = sfac.openSession();
		Query qry = sess.createQuery("from Product p where p.cat=?");
		qry.setInteger(0, cid);
		List<Product> list = qry.list();
		sess.close();
		return list;

	}

	/**
	 * @param pid ProductID
	 * @return list return list of Specifications for that product
	 * <p>This method will return list of Specifications for the product we want</p>
	 */
	@Override
	public List<Specifications> getSpecification(int pid) {
		Session sess = sfac.openSession();
		Query qry = sess.createQuery("from Specifications s left join fetch s.prod p where p.productId = ?");
		qry.setInteger(0, pid);
		List<Specifications> lst = qry.list();
		sess.close();
		return lst;
	}
	
	/**
	 * @param pid ProductID
	 * @return list return Product based on ProductID
	 * <p>This method will return Product based on ProductID</p>
	 */
	@Override
	public Product getProduct(int pid) {
		Session sess = sfac.openSession();
		Query qry = sess.createQuery("from Product p where p.productId = ?");
		qry.setInteger(0, pid);
		Product pro = (Product) qry.uniqueResult();
		sess.close();
		return pro;
	}

	/**
	 * @param pid ProductID
	 * @throws OutofStockException
	 * @return 0 if no operation done
	 * <p>This method will update the stock in database when the user buys the product</p>
	 */
	
	@Override
	public int updateStock(int temp,int pid) throws OutOfStockException{
		Session sess=null;
		Product stu;
		Transaction tx=null;
		try {
		sess = sfac.openSession();
		stu= (Product)sess.get(Product.class, pid); 
		tx = sess.beginTransaction();
		stu.setProductStock(temp);
		tx.commit();
		}catch(HibernateException e) {
			throw new OutOfStockException("Out of Stock");
		}finally {
			sess.close();
		}
		return 0;
	}

	
	/**
	 * @param pro Product
	 * @return 0 if product added successfully
	 * <p>This method will add the product in the database</p>
	 */
	@Override
	public int addProduct(Product pro) {
		Session sess = null;
		Transaction tx = null;
		try {
			sess = sfac.openSession();
			tx = sess.beginTransaction();
			sess.save(pro);
			tx.commit();
			return 1;
			
		} catch(HibernateException e) {
			System.out.println(e);
			tx.rollback();
		} finally {
			sess.close();
		}
			return 0;
		
	}

	/**
	 * @param spec Specifications
	 * @return 0 if no operation done
	 * <p>This method will add the specifications of the given product id</p>
	 */
	@Override
	public int addSpecification(Specifications spec) {
		Session sess = null;
		Transaction tx = null;
		try {
			sess = sfac.openSession();
			tx = sess.beginTransaction();
			sess.save(spec);
			tx.commit();
			return 1;
			
		} catch(HibernateException e) {
			System.out.println(e);
			tx.rollback();
		} finally {
			sess.close();
		}
			return 0;
	}

}
