package bookshop.suyu.test;

import java.sql.*;
import java.util.Scanner;

public class test_database {
    /*
    -> 连接数据库的准备工作
    */
    //驱动声明
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    //驱动地址
    private static final String DB_URL = "jdbc:mysql://localhost:3306/test?useUnicode=true&characterEncoding=utf8";
    //用户名
    private static final String USER = "suyu";
    //密码
    private static final String PASSWORD = "Aa12310718sawako.";
    //连接对象connection
    private static final Connection connection = null;

    //连接数据库的方法
    public static Connection open() {
        try {
            //加载驱动
            Class.forName(JDBC_DRIVER);
            //若成功加载驱动则返回一个Connection类型的对象
            return DriverManager.getConnection(DB_URL, USER, PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            System.out.println("数据库连接失败");
            //抛出堆栈轨迹
            e.printStackTrace();
        }
        //若数据库连接失败则返回空值
        return null;
    }

    //关闭连接的方法
    public static void close() {
        try {
            //如果connection对象成功连接到数据库,那么不为空
            if (connection != null) {
                //关闭连接
                connection.close();
            }
        } catch (SQLException s) {
            //抛出堆栈轨迹
            s.printStackTrace();
        }
    }

    //增
    private static void insert() {
        //输入类Scanner
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入要插入的数据:id = ");
        String id = sc.next();
        System.out.println("请输入要插入的数据:name = ");
        String name = sc.next();
        System.out.println("请输入要插入的数据:tip = ");
        String tip = sc.next();
        //创建sql语句
        String sql = "insert into test.test1(id, name, tip) values(?, ?, ?)";
        //打开连接
        Connection connection = open();//open的返回值是一个Connection类型的对象
        try {
            //创建预编译框架,防止sql注入攻击
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            //sql语句中的对应问号,插入对应数据
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, tip);
            //更新操作,类似于在数据库中提交更改,这步很重要!!!用于更新数据库中的数据
            preparedStatement.executeUpdate();
            System.out.println("数据插入成功");
        } catch (SQLException s) {
            s.printStackTrace();
            System.out.println("数据插入失败");
        } finally {
            //调用关闭连接的方法
            close();
        }
    }

    //删
    private static void delete() {
        //输入类Scanner
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入要删除的某行数据的任意一个索引值(id, name, tip)");
        String string_index = sc.next();
        //创建sql语句
        String sql = "delete from test.test1 where(id = ? or name = ? or tip = ?)";
        //打开连接
        Connection connection = open();//open的返回值是一个Connection类型的对象
        try {
            //创建预编译框架,防止sql注入攻击
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            //sql语句中的对应问号,插入对应数据
            preparedStatement.setString(1, string_index);
            preparedStatement.setString(2, string_index);
            preparedStatement.setString(3, string_index);
            //更新操作,类似于在数据库中提交更改,这步很重要!!!用于更新数据库中的数据
            preparedStatement.executeUpdate();
            System.out.println("数据删除成功");
        } catch (SQLException s) {
            s.printStackTrace();
            System.out.println("数据删除失败");
        } finally {
            //调用关闭连接的方法
            close();
        }
    }

    //改
    private static void update() {
        //输入类Scanner
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入要更改的某行数据的任意一个索引值(id, name, tip)");
        String string_index = sc.next();
        System.out.println("请依次输入要更改的值(id, name, tip)");
        String id = sc.next();
        String name = sc.next();
        String tip = sc.next();
        //创建sql语句
        String sql = "update test.test1 set id = ?, name = ?, tip = ? where(id = ? or name = ? or tip = ?)";
        //打开连接
        Connection connection = open();//open的返回值是一个Connection类型的对象
        try {
            //创建预编译框架,防止sql注入攻击
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            //sql语句中的对应问号,插入对应数据
            preparedStatement.setString(1, id);
            preparedStatement.setString(2, name);
            preparedStatement.setString(3, tip);
            preparedStatement.setString(4, string_index);
            preparedStatement.setString(5, string_index);
            preparedStatement.setString(6, string_index);
            //更新操作,类似于在数据库中提交更改,这步很重要!!!用于更新数据库中的数据
            preparedStatement.executeUpdate();
            System.out.println("数据更新成功");
        } catch (SQLException s) {
            s.printStackTrace();
            System.out.println("数据更新失败");
        } finally {
            //调用关闭连接的方法
            close();
        }

    }

    //查
    private static void select() {
        //输入类Scanner
        Scanner sc = new Scanner(System.in);
        System.out.println("请输入要查询的某行数据的任意一个索引值(id, name, tip)");
        String string_index = sc.next();
        //创建sql语句
        String sql = "select * from test.test1 where(id = ? or name = ? or tip = ?)";
        //打开连接
        Connection connection = open();//open的返回值是一个Connection类型的对象
        try {
            //创建预编译框架,防止sql注入攻击
            PreparedStatement preparedStatement = connection.prepareStatement(sql);
            //sql语句中的对应问号,插入对应数据
            preparedStatement.setString(1, string_index);
            preparedStatement.setString(2, string_index);
            preparedStatement.setString(3, string_index);
            ResultSet rs = preparedStatement.executeQuery();
            if (rs.next()) {
                System.out.println("id = " + rs.getString(1) + ", name = " + rs.getString(2) + ", tip = " + rs.getString(3));
            }
        } catch (SQLException s) {
            s.printStackTrace();
            System.out.println("数据查询失败");
        } finally {
            //调用关闭连接的方法
            close();
        }

    }

//    测试
//    public static void main(String[] args) {
//        insert();
//        delete();
//        update();
//        select();
//    }
}