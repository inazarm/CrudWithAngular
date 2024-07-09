using CrudeWithAngular.Models;
using System;
using System.Collections.Generic;
using System.Data.Common;
using System.Linq;
using System.Web;
using System.Web.Mvc;

namespace CrudeWithAngular.Controllers
{
    public class StudentController : Controller
    {
        TestingDBEntities db;
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
        public string UpdateStudentRecord(Student student)
        {
            using (TestingDBEntities db=new TestingDBEntities())
            {
                var record=db.Students.Where(x=>x.Id==student.Id).FirstOrDefault();
                if (record != null) {
                   record.Name = student.Name;
                    record.Age = student.Age;
                    record.Department  = student.Department;
                    db.SaveChanges();
                    return "Student record updated successfully";
                }
                return "Record not found!";
            }
            
        }
        public string DeleteStudentRecord(Student student)
        {
            using (db=new TestingDBEntities())
            {
                var record=db.Students.Where(s=>s.Id==student.Id).FirstOrDefault();
                if (record!=null)
                {
                    db.Students.Remove(record);
                    db.SaveChanges();
                    return "record deleted successfully!";
                }
                return "record not found!";
            }
            
        }
    }
}