package com.saichethan.springdemo.dao;

import com.saichethan.springdemo.entity.Customer;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.query.Query;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

//It will always applied to DAO implementations
@Repository
public class CustomerDAOImpl implements CustomerDAO{

    // need to inject the session factory
    @Autowired
    private SessionFactory sessionFactory;

    @Override
//    @Transactional  // it will automatically beginTransaction and commitTransaction
    // commented this, after the service is added.
    public List<Customer> getCustomers() {

        // get the current hibernate session
        Session currentSession = sessionFactory.getCurrentSession();

        // create a query ... sort by last name
        Query<Customer> query = currentSession.createQuery("from Customer order by lastName", Customer.class);

        // execute the query and get the result list
        List<Customer> customers = query.getResultList();

        return customers;
    }

    @Override
    public void saveCustomer(Customer customer) {
        Session session = sessionFactory.getCurrentSession();

        session.saveOrUpdate(customer);
    }

    @Override
    public Customer getCustomer(int id) {
        Session session = sessionFactory.getCurrentSession();

        Customer customer = session.get(Customer.class, id);

        return customer;
    }

    @Override
    public void deleteCustomer(int id) {
        Session session = sessionFactory.getCurrentSession();

//        Customer customer = session.get(Customer.class, id);
//        session.delete(customer);

        Query theQuery = session.createQuery("delete from Customer where id=:customerId");

        theQuery.setParameter("customerId", id);

        theQuery.executeUpdate();

    }


}
