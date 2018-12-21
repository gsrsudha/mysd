using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Net;
using System.Web;
using System.Web.Mvc;
using MYSD;

namespace MYSD.Controllers
{
    public class VenueVendorsController : Controller
    {
        private MYSDModelContainer db = new MYSDModelContainer();

        // GET: VenueVendors
        public async Task<ActionResult> Index()
        {
            return View(await db.VenueVendors.ToListAsync());
        }

        // GET: VenueVendors/Details/5
        public async Task<ActionResult> Details(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VenueVendor venueVendor = await db.VenueVendors.FindAsync(id);
            if (venueVendor == null)
            {
                return HttpNotFound();
            }
            return View(venueVendor);
        }

        // GET: VenueVendors/Create
        public ActionResult Create()
        {
            return View();
        }

        // POST: VenueVendors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name")] VenueVendor venueVendor)
        {
            if (ModelState.IsValid)
            {
                db.VenueVendors.Add(venueVendor);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(venueVendor);
        }

        // GET: VenueVendors/Edit/5
        public async Task<ActionResult> Edit(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VenueVendor venueVendor = await db.VenueVendors.FindAsync(id);
            if (venueVendor == null)
            {
                return HttpNotFound();
            }
            return View(venueVendor);
        }

        // POST: VenueVendors/Edit/5
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Edit([Bind(Include = "Id,Name")] VenueVendor venueVendor)
        {
            if (ModelState.IsValid)
            {
                db.Entry(venueVendor).State = EntityState.Modified;
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }
            return View(venueVendor);
        }

        // GET: VenueVendors/Delete/5
        public async Task<ActionResult> Delete(int? id)
        {
            if (id == null)
            {
                return new HttpStatusCodeResult(HttpStatusCode.BadRequest);
            }
            VenueVendor venueVendor = await db.VenueVendors.FindAsync(id);
            if (venueVendor == null)
            {
                return HttpNotFound();
            }
            return View(venueVendor);
        }

        // POST: VenueVendors/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> DeleteConfirmed(int id)
        {
            VenueVendor venueVendor = await db.VenueVendors.FindAsync(id);
            db.VenueVendors.Remove(venueVendor);
            await db.SaveChangesAsync();
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
