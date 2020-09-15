using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QueeMVC.Models;

namespace QueeMVC.Controllers
{
    public class SanPhamController : Controller
    {

        QueeSQLDataContext data = new QueeSQLDataContext();

        private List<SanPham> spham(int count)
        {
            return data.SanPhams.Take(count).ToList();
        }

        public ActionResult Index()
        {
            var SanPhamMoi = spham(16);
            return View(SanPhamMoi);
        }

        public ActionResult SPTheoDM(string loai)
        {
            var sptheoDM = data.SanPhams.Where(a => a.MaLoaiSP == loai);
            return View(sptheoDM);
        }

        public ActionResult Details(int masp)
        {
            var chitiet = data.SanPhams.Where(m => m.MaSP == masp).First();
            return View(chitiet);
        }
    }
}
