package bookshop.suyu;

import java.sql.*;

public class Connection_DataBase {
    /*
   -> 连接数据库的准备工作
   */
    //驱动声明
    private static final String JDBC_DRIVER = "com.mysql.jdbc.Driver";
    //驱动地址
    private static final String DB_URL = "jdbc:mysql://localhost:3306/bookshop?useUnicode=true&characterEncoding=utf8";
    //用户名
    private static final String USER = "suyu";
    //密码
    private static final String PASSWORD = "Aa12310718sawako.";
    //连接对象connection
    private static final Connection connection = null;
    //结果集
    private static ResultSet resultSet = null;
    //stmt
    private static PreparedStatement preparedStatement = null;

    //连接数据库的方法
    public Connection open() {
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

    public void update(String sql) {
        //获取连接
        Connection connection = open();//open的返回值是一个Connection类
        try {
            //预编译框架
            preparedStatement = connection.prepareStatement(sql);
            //执行更新
            preparedStatement.executeUpdate();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public ResultSet query(String sql) {
        //获取连接
        Connection connection = open();//open的返回值是一个Connection类
        try {
            //预编译框架
            preparedStatement = connection.prepareStatement(sql);
            resultSet = preparedStatement.executeQuery();
        } catch (Exception e) {
            e.printStackTrace();
        }
        return resultSet;
    }

    //关闭连接的方法
    public void close() {
        try { // 捕捉异常
            if (resultSet != null) {
                resultSet.close();// 关闭结果集对象
            }
            if (preparedStatement != null) {
                preparedStatement.close(); // 关闭Statement对象
            }
            if (connection != null) {
                connection.close(); // 关闭数据库连接对象
            }
        } catch (Exception e) {// 处理异常
            e.printStackTrace(System.err);// 输出异常信息
        }
    }
}
