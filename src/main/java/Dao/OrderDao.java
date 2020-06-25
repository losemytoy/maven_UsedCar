package Dao;

import entity.Order;
import org.apache.struts2.ServletActionContext;

import javax.servlet.http.HttpSession;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

public class OrderDao extends SQLBean{
    //添加订单
    public int addOrder(Order order){
        Connection connection = getConnection();
        PreparedStatement statement = null;
        ResultSet rs = null;
        int row = 0;
        Date date = new Date();
        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");

        try{
            statement = connection.prepareStatement("insert into OrderTab(sellerNo,buyerNO,carNo,price,orderDate)values (?,?,?,?,?)");
            statement.setString(1,order.getSellerNo());
            statement.setString(2,order.getBuyerNo());
            statement.setString(3,order.getCarNo());
            statement.setString(4,order.getPrice());
            statement.setString(5, df.format(date));
            row = statement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }finally {
            closeConnection(connection,statement,rs);
        }
        return row;
    }


    public Order getorder(Order order){
        Connection conn = getConnection();
        PreparedStatement stat = null;
        ResultSet rs = null;
        Order ad = null;

        try {
            String sql = "select orderNo,sellerNo,buyerNo,carNo,price,orderDate from OrderTab where orderNo=?";
            stat = conn.prepareStatement(sql);
            stat.setString(1,order.getOrderNo());
            rs = stat.executeQuery();
            while(rs.next()){
                ad = new Order();
                ad.setOrderNo(rs.getString("orderNo"));
                ad.setSellerNo(rs.getString("sellerNo"));
                ad.setBuyerNo(rs.getString("buyerNo"));
                ad.setCarNo(rs.getString("carNo"));
                ad.setPrice(rs.getString("price"));
                ad.setOrderDate(rs.getString("orderDate"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn,stat,null);
        }
        return ad;
    }
    public List<Order> getALLorder() {
        Connection conn = getConnection();
        PreparedStatement stat = null;
        ResultSet rs=null;
        List<Order> orderList = new ArrayList<>();
        Order ad = null;

        try {
            String sql = "select orderNo,sellerNo,buyerNo,carNo,price,orderDate from OrderTab";
            stat = conn.prepareStatement(sql);
            rs = stat.executeQuery();
            while (rs.next()) {
                ad = new Order();
                ad.setOrderNo(rs.getString("orderNo"));
                ad.setSellerNo(rs.getString("sellerNo"));
                ad.setBuyerNo(rs.getString("buyerNo"));
                ad.setCarNo(rs.getString("carNo"));
                ad.setPrice(rs.getString("price"));
                ad.setOrderDate(rs.getString("orderDate"));
                orderList.add(ad);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        } finally {
            closeConnection(conn, stat, null);
        }
        return orderList;
    }
    public List<Order> getorderbybuy() {
        Connection conn = getConnection();
        PreparedStatement stat = null;
        ResultSet rs=null;
        List<Order> orderList = new ArrayList<>();
        HttpSession session = ServletActionContext.getRequest().getSession();
        String sessionbuyNo = (String) session.getAttribute("userId");

        String sql = "select orderNo,sellerNO,buyerNO,carNo,price,orderDate from OrderTab where buyerNO=? OR sellerNO=?";

        try {
            stat = conn.prepareStatement(sql);
            stat.setString(1,sessionbuyNo);
            stat.setString(2,sessionbuyNo);
            rs = stat.executeQuery();
            while (rs.next()){
                Order orderOut = new Order();
                orderOut.setOrderNo(rs.getString("orderNo"));
                orderOut.setSellerNo(rs.getString("sellerNo"));
                orderOut.setBuyerNo(rs.getString("buyerNo"));
                orderOut.setCarNo(rs.getString("carNo"));
                orderOut.setPrice(rs.getString("price"));
                orderOut.setOrderDate(rs.getString("orderDate"));
                orderList.add(orderOut);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,stat,rs);
        }
        return orderList;
    }
    public int insertOrder(Order order){
        Connection coun = getConnection();
        PreparedStatement stat = null;
        Order ad = null;
        int row = 0;

        try {
            String sql = "INSERT INTO OrderTab(orderNo,sellerNo,buyerNo,carNo,price,orderDate) VALUES(?,?,?,?,?,?)";
            stat = coun.prepareStatement(sql);
            stat.setString(1, order.getOrderNo());
            stat.setString(2, order.getSellerNo());
            stat.setString(3, order.getBuyerNo());
            stat.setString(4, order.getCarNo());
            stat.setString(5, order.getPrice());
            stat.setString(6, order.getOrderDate());
            row = stat.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(coun,stat,null);
        }
        return row;
    }
    public void deleteOrder(String orderNo) {
        Connection connection = getConnection();
        PreparedStatement stat = null;
        try{
            stat = connection.prepareStatement("DELETE FROM OrderTab WHERE orderNo=?");
            stat.setString(1,orderNo);
            stat.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }finally {
            closeConnection(connection,stat,null);
        }
    }
    public void updataOrder(Order order){
        Connection coun = getConnection();
        PreparedStatement ps = null;

        try {
            ps = coun.prepareStatement("UPDATE OrderTab SET sellerNo=?,buyerNo=?,carNo=?,price=?,orderDate=? WHERE orderNo=?");
            ps.setString(1, order.getSellerNo());
            ps.setString(2, order.getBuyerNo());
            ps.setString(3, order.getCarNo());
            ps.setString(4, order.getPrice());
            ps.setString(5, order.getOrderDate());
            ps.setString(6, order.getOrderNo());
            ps.executeUpdate();
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(coun,ps,null);
        }
    }
    public List<Order> getAllOrderByName(Order order){
        Connection conn = getConnection();
        PreparedStatement stat = null;
        ResultSet rs=null;
        List<Order> orderList = new ArrayList<>();

        String sql = "select orderNo,sellerNo,buyerNo,carNo,price,orderDate from OrderTab where orderNo=?";

        try {
            stat = conn.prepareStatement(sql);
            stat.setString(1,order.getOrderNo());
            rs = stat.executeQuery();
            while (rs.next()){
                Order orderOut = new Order();
                orderOut.setOrderNo(rs.getString("orderNo"));
                orderOut.setSellerNo(rs.getString("sellerNo"));
                orderOut.setBuyerNo(rs.getString("buyerNo"));
                orderOut.setCarNo(rs.getString("carNo"));
                orderOut.setPrice(rs.getString("price"));
                orderOut.setOrderDate(rs.getString("orderDate"));
                orderList.add(orderOut);
            }
        }catch (SQLException e){
            e.printStackTrace();
        }finally {
            closeConnection(conn,stat,rs);
        }
        return orderList;
    }
}
