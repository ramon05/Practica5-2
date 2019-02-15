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
    public class ParticipacionsController : Controller
    {
        private DiscografiasDBEntities db = new DiscografiasDBEntities();

        // GET: Participacions
        public ActionResult Index()
        {
            var participacion = db.Participacions.Include(p => p.Grabacion).Include(p => p.Interprete);
            return View(participacion.ToList());
        }

        // GET: Participacions/Details/5
        public ActionResult Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Participacion participacion = db.Participacions.Find(id);
            if (participacion == null)
            {
                return HttpNotFound();
            }
            return View(participacion);
        }

        // GET: Participacions/Create
        public ActionResult Create()
        {
            ViewBag.Grabacion_Id = new SelectList(db.Grabacion, "Id_Grabacion", "Titulo");
            ViewBag.Interprete_Id = new SelectList(db.Interprete, "Id_Interprete", "Nombre");
            return View();
        }

        // POST: Participacions/Create
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Create([Bind(Include = "Grabacion_Id,Interprete_Id,Fecha,ParticipanteId")] Participacion participacion)
        {
            if (ModelState.IsValid)
            {
                db.Participacions.Add(participacion);
                db.SaveChanges();
                return RedirectToAction("Index");
            }

            ViewBag.Grabacion_Id = new SelectList(db.Grabacion, "Id_Grabacion", "Titulo", participacion.Grabacion_Id);
            ViewBag.Interprete_Id = new SelectList(db.Interprete, "Id_Interprete", "Nombre", participacion.Interprete_Id);
            return View(participacion);
        }

        // GET: Participacions/Edit/5
        public ActionResult Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Participacion participacion = db.Participacions.Find(id);
            if (participacion == null)
            {
                return HttpNotFound();
            }
            ViewBag.Grabacion_Id = new SelectList(db.Grabacion, "Id_Grabacion", "Titulo", participacion.Grabacion_Id);
            ViewBag.Interprete_Id = new SelectList(db.Interprete, "Id_Interprete", "Nombre", participacion.Interprete_Id);
            return View(participacion);
        }

        // POST: Participacions/Edit/5
        // Para protegerse de ataques de publicación excesiva, habilite las propiedades específicas a las que desea enlazarse. Para obtener 
        // más información vea https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public ActionResult Edit([Bind(Include = "Grabacion_Id,Interprete_Id,Fecha,ParticipanteId")] Participacion participacion)
        {
            if (ModelState.IsValid)
            {
                db.Entry(participacion).State = EntityState.Modified;
                db.SaveChanges();
                return RedirectToAction("Index");
            }
            ViewBag.Grabacion_Id = new SelectList(db.Grabacion, "Id_Grabacion", "Titulo", participacion.Grabacion_Id);
            ViewBag.Interprete_Id = new SelectList(db.Interprete, "Id_Interprete", "Nombre", participacion.Interprete_Id);
            return View(participacion);
        }

        // GET: Participacions/Delete/5
        public ActionResult Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            Participacion participacion = db.Participacions.Find(id);
            if (participacion == null)
            {
                return HttpNotFound();
            }
            return View(participacion);
        }

        // POST: Participacions/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public ActionResult DeleteConfirmed(int id)
        {
            Participacion participacion = db.Participacions.Find(id);
            db.Participacions.Remove(participacion);
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
