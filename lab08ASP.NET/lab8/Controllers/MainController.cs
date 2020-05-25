using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using PagedList;

using lab8.Models;
using lab8.DataAbstractionLayer;

namespace lab8.Controllers
{
    public class MainController : Controller
    {
        // GET: Main
        public ActionResult Index()
        {
            return View("LoginView");
        }

        public string Test()
        {
            return "It's working";
        }

        public string GetStudentsFromGroup()
        {
            int group_id = int.Parse(Request.Params["group_id"]);
            int n1 = int.Parse(Request.Params["n1"]);
            int n2 = int.Parse(Request.Params["n2"]);
            DAL dal = new DAL();
            List<Student> slist = dal.GetStudentsFromGroup(group_id, n1, n2);
            ViewData["studentList"] = slist;

            string result = "<table id='myTable' style='text-align: center'><thead><th>ID</th><th>Firstname</th><th>Lastname</th><th>Group</th></thead>";

            foreach (Student stud in slist)
            {
                result += "<tr><td>" + stud.Id + "</td><td>" + stud.Firstname + "</td><td>" + stud.Lastname + "</td><td>" + stud.Groupnr + "</td></tr>";
            }

            result += "</table>";
            return result;
        }

        public String GetGradesForStudent()
        {
            int sid = int.Parse(Request.Params["sid"]);
            DAL dal = new DAL();
            List<Grade> gradelist = dal.GetGradesForStudent(sid);
            ViewData["gradeList"] = gradelist;

            string result = "<table><thead><th>Id</th><th>Course</th><th>Grade</th></thead>";

            foreach (Grade grade in gradelist)
            {
                result += "<tr><td>" + grade.Id + "</td><td>" + grade.Course + "</td><td>" + grade.Mark + "</td><td></tr>";
            }

            result += "</table>";
            return result;
        }

        public ActionResult FilterStudents()
        {
            return View("FilterStudents");
        }

        public ActionResult SeeGrades()
        {
            return View("GradesView");
        }
        
        public string Login()
        {
            string username = Request.Params["username"];
            string pass = Request.Params["password"];
            string result = "";
            DAL dal = new DAL();
            User user = dal.GetUserInfo(username);
            string actualpass = user.Password;
            if (actualpass == "" || actualpass != pass)
            {
                RedirectToAction("Index");
            }

            else
            {
                if (user.Type == 0)
                {
                    result = "SeeGrades";
                    Session["sid"] = user.Sid;
                    Session["username"] = user.Username;
                    RedirectToAction("SeeGrades");
                }
                else
                {
                    Session["sid"] = user.Sid;
                    Session["username"] = user.Username;
                    result = "FilterStudents";
                    RedirectToAction("FilterStudents");
                }
                
            }

            Console.Out.WriteLine(result);
            
            return result;
        }
        
        public string AddGrade()
        {
            string course = Request.Params["course"];
            int grade = int.Parse(Request.Params["grade"]);
            int sid = int.Parse(Request.Params["sid"]);
            string result = "";
            DAL dal = new DAL();
            bool res = dal.AddGrade(course, grade, sid);

            if (res)
                result = "<p>Grade added!</p>";
            else
            {
                result = "<p>Something went wrong!</p>";
            }
            
            return result;
        }
        
        public string UpdateGrade()
        {
            string course = Request.Params["course"];
            int grade = int.Parse(Request.Params["grade"]);
            int sid = int.Parse(Request.Params["sid"]);
            string result = "";
            DAL dal = new DAL();
            bool res = dal.UpdateGrade(course, grade, sid);

            if (res)
                result = "<p>Grade updated!</p>";
            else
            {
                result = "<p>Something went wrong!</p>";
            }
            
            return result;
        }
    }
}