using System;
using System.Collections.Generic;
using System.Data.Entity;
using System.Linq;
using System.Threading.Tasks;
using System.Web;
using System.Web.Mvc;

namespace MYSD.Controllers
{
    public class EventsController : Controller
    {
        private MYSDModelContainer db = new MYSDModelContainer();

        // GET: Events
        public async Task<ActionResult> Index()
        {
            return View(await db.Events.ToListAsync());
        }

        public ActionResult Create()
        {
            return View();
        }

        // POST: VenueVendors/Create
        // To protect from overposting attacks, please enable the specific properties you want to bind to, for 
        // more details see https://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<ActionResult> Create([Bind(Include = "Id,Name")] Events events)
        {
            if (ModelState.IsValid)
            {
                db.Events.Add(events);
                await db.SaveChangesAsync();
                return RedirectToAction("Index");
            }

            return View(events);
        }
    }
}