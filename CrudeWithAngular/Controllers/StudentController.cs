using CrudeWithAngular.Models;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CrudeWithAngular.Controllers
{
    public class StudentController : Controller
    {
        // GET: Student
        public ActionResult Index()
        {
            return View();
        }

        public string InsertStudentRecord(Student std) 
        {
            using (TestingDBEntities db=new TestingDBEntities())
            {
                db.Students.Add(std);
                db.SaveChanges();
                return "Student Added Successfully!";
            }
        }
        public JsonResult GetAllStudent(Student Std) 
        {
            TestingDBEntities db = new TestingDBEntities();
            var AllRecords = db.Students.ToList();
            return Json(AllRecords,JsonRequestBehavior.AllowGet);
        }
        public string UpdateStudentRecord()
        {
            return "";
        }
        public string DeleteStudentRecord()
        {
            return "";
        }
    }
}