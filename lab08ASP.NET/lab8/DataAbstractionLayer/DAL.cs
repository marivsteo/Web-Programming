using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

using lab8.Models;
using MySql.Data.MySqlClient;

namespace lab8.DataAbstractionLayer
{
    public class DAL
    {
        public List<Student> GetStudentsFromGroup(int groupId, int n1, int n2)
        {
            MySql.Data.MySqlClient.MySqlConnection conn;
            string myConnectionString;

            myConnectionString = "server=localhost;uid=root;pwd=;database=wplab7;";
            List<Student> studentlist = new List<Student>();

            try
            {
                conn = new MySql.Data.MySqlClient.MySqlConnection();
                conn.ConnectionString = myConnectionString;
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from students where groupnr=" + groupId + " and sid < " + n2 + " and sid >= " + n1;
                MySqlDataReader myreader = cmd.ExecuteReader();

                while (myreader.Read())
                {
                    Student stud = new Student();
                    stud.Id = myreader.GetInt32("sid");
                    stud.Firstname = myreader.GetString("firstname");
                    stud.Lastname = myreader.GetString("lastname");
                    stud.Groupnr = myreader.GetInt32("groupnr");
                    studentlist.Add(stud);
                }
                myreader.Close();
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Console.Write(ex.Message);
            }
            return studentlist;
        }
        
        public List<Grade> GetGradesForStudent(int sid)
        {
            MySql.Data.MySqlClient.MySqlConnection conn;
            string myConnectionString;

            myConnectionString = "server=localhost;uid=root;pwd=;database=wplab7;";
            List<Grade> gradelist = new List<Grade>();

            try
            {
                conn = new MySql.Data.MySqlClient.MySqlConnection();
                conn.ConnectionString = myConnectionString;
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from grades where sid=" + sid;
                MySqlDataReader myreader = cmd.ExecuteReader();

                while (myreader.Read())
                {
                    Grade g = new Grade();
                    g.Id = myreader.GetInt32("gid");
                    g.Course = myreader.GetString("course");
                    g.Mark = myreader.GetInt32("grade");
                    g.Sid = myreader.GetInt32("sid");
                    gradelist.Add(g);
                }
                myreader.Close();
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Console.Write(ex.Message);
            }
            return gradelist;
        }

        public User GetUserInfo(string username)
        {
            MySql.Data.MySqlClient.MySqlConnection conn;

            var myConnectionString = "server=localhost;uid=root;pwd=;database=wplab7;";
            User user = new User();

            try
            {
                conn = new MySql.Data.MySqlClient.MySqlConnection {ConnectionString = myConnectionString};
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "select * from users where username=" + "'" + username + "'";
                
                MySqlDataReader myreader = cmd.ExecuteReader();

                while (myreader.Read())
                {
                    user.Password = myreader.GetString("password");
                    user.Type = myreader.GetInt16("type");
                    user.Sid = myreader.GetInt32("sid");
                    user.Username = username;
                }
                myreader.Close();
            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Console.Write(ex.Message);
            }

            return user;
        }
        
        public bool AddGrade(string course, int grade, int sid)
        {
            MySql.Data.MySqlClient.MySqlConnection conn;

            var myConnectionString = "server=localhost;uid=root;pwd=;database=wplab7;";

            try
            {
                conn = new MySql.Data.MySqlClient.MySqlConnection {ConnectionString = myConnectionString};
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "insert into grades(course, grade, sid) values(" + "'" + course + "', " + grade + ", " + sid + ");";

                int result = cmd.ExecuteNonQuery();

                if (result >= 1)
                    return true;
                else
                {
                    return false;
                }

            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Console.Write(ex.Message);
                return false;
            }
        }
        
        public bool UpdateGrade(string course, int grade, int sid)
        {
            MySql.Data.MySqlClient.MySqlConnection conn;

            var myConnectionString = "server=localhost;uid=root;pwd=;database=wplab7;";

            try
            {
                conn = new MySql.Data.MySqlClient.MySqlConnection {ConnectionString = myConnectionString};
                conn.Open();

                MySqlCommand cmd = new MySqlCommand();
                cmd.Connection = conn;
                cmd.CommandText = "update grades set grade=" + grade + " where course='" + course + "' and sid=" + sid + ";";

                int result = cmd.ExecuteNonQuery();

                if (result >= 1)
                    return true;
                else
                {
                    return false;
                }

            }
            catch (MySql.Data.MySqlClient.MySqlException ex)
            {
                Console.Write(ex.Message);
                return false;
            }
        }
    }
}