using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Net;
using System.Web;
using System.Web.Mvc;
using DiscografiaModel.Models;

namespace Discografias.Controllers
{
    public class CompañiaController : Controller
    {
        private DiscografiasDBEntities db = new DiscografiasDBEntities();

        // GET: Compañia
        public ActionResult Index()
        {
            return View(db.Compañia.ToList());
        }

        // GET: Compañia/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Compañia compañia = db.Compañia.Find(id);
            if (compañia == null)
            {
                return HttpNotFound();
            }
            return View(compañia);
        }

        // GET: Compañia/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Compañia/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Compañia,nombre,direccion")] Compañia compañia)
        {
            if (ModelState.IsValid)
            {
                db.Compañia.Add(compañia);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(compañia);
        }

        // GET: Compañia/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Compañia compañia = db.Compañia.Find(id);
            if (compañia == null)
            {
                return HttpNotFound();
            }
            return View(compañia);
        }

        // POST: Compañia/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Compañia,nombre,direccion")] Compañia compañia)
        {
            if (ModelState.IsValid)
            {
                db.Entry(compañia).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(compañia);
        }

        // GET: Compañia/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Compañia compañia = db.Compañia.Find(id);
            if (compañia == null)
            {
                return HttpNotFound();
            }
            return View(compañia);
        }

        // POST: Compañia/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Compañia compañia = db.Compañia.Find(id);
            db.Compañia.Remove(compañia);
            db.SaveChanges();
            return RedirectToAction("Index");
        }

        protected override void Dispose(bool disposing)
        {
            if (disposing)
            {
                db.Dispose();
            }
            base.Dispose(disposing);
        }
    }
}
