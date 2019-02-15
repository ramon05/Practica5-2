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
    public class GrabacionController : Controller
    {
        private DiscografiasDBEntities db = new DiscografiasDBEntities();

        // GET: Grabacion
        public ActionResult Index()
        {
            var grabacion = db.Grabacion.Include(g => g.Compañia);
            return View(grabacion.ToList());
        }

        // GET: Grabacion/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Grabacion grabacion = db.Grabacion.Find(id);
            if (grabacion == null)
            {
                return HttpNotFound();
            }
            return View(grabacion);
        }

        // GET: Grabacion/Create
        public ActionResult Create()
        {
            ViewBag.Compañia_id = new SelectList(db.Compañia, "Id_Compañia", "nombre");
            return View();
        }

        // POST: Grabacion/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Id_Grabacion,Titulo,Num_Tema,Descripcion,Compañia_id")] Grabacion grabacion)
        {
            if (ModelState.IsValid)
            {
                db.Grabacion.Add(grabacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Compañia_id = new SelectList(db.Compañia, "Id_Compañia", "nombre", grabacion.Compañia_id);
            return View(grabacion);
        }

        // GET: Grabacion/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Grabacion grabacion = db.Grabacion.Find(id);
            if (grabacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Compañia_id = new SelectList(db.Compañia, "Id_Compañia", "nombre", grabacion.Compañia_id);
            return View(grabacion);
        }

        // POST: Grabacion/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Id_Grabacion,Titulo,Num_Tema,Descripcion,Compañia_id")] Grabacion grabacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(grabacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Compañia_id = new SelectList(db.Compañia, "Id_Compañia", "nombre", grabacion.Compañia_id);
            return View(grabacion);
        }

        // GET: Grabacion/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Grabacion grabacion = db.Grabacion.Find(id);
            if (grabacion == null)
            {
                return HttpNotFound();
            }
            return View(grabacion);
        }

        // POST: Grabacion/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Grabacion grabacion = db.Grabacion.Find(id);
            db.Grabacion.Remove(grabacion);
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
