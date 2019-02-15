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
    public class InterpretesController : Controller
    {
        private DiscografiasDBEntities db = new DiscografiasDBEntities();

        // GET: Interpretes
        public ActionResult Index()
        {
            return View(db.Interprete.ToList());
        }

        // GET: Interpretes/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Interprete interprete = db.Interprete.Find(id);
            if (interprete == null)
            {
                return HttpNotFound();
            }
            return View(interprete);
        }

        // GET: Interpretes/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: Interpretes/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Interprete,Nombre,Descripcion")] Interprete interprete)
        {
            if (ModelState.IsValid)
            {
                db.Interprete.Add(interprete);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            return View(interprete);
        }

        // GET: Interpretes/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Interprete interprete = db.Interprete.Find(id);
            if (interprete == null)
            {
                return HttpNotFound();
            }
            return View(interprete);
        }

        // POST: Interpretes/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Interprete,Nombre,Descripcion")] Interprete interprete)
        {
            if (ModelState.IsValid)
            {
                db.Entry(interprete).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            return View(interprete);
        }

        // GET: Interpretes/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Interprete interprete = db.Interprete.Find(id);
            if (interprete == null)
            {
                return HttpNotFound();
            }
            return View(interprete);
        }

        // POST: Interpretes/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Interprete interprete = db.Interprete.Find(id);
            db.Interprete.Remove(interprete);
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
