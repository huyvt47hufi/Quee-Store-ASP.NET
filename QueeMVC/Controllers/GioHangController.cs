using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using QueeMVC.Models;

namespace QueeMVC.Controllers
{
    public class GioHangController : Controller
    {

        QueeSQLDataContext data = new QueeSQLDataContext();
        
        public List<Giohang> Laygiohang()
        {
            List<Giohang> lstGioHang = Session["GioHang"] as List<Giohang>;
            if (lstGioHang == null)
            {
                lstGioHang = new List<Giohang>();
                Session["GioHang"] = lstGioHang;
            }
            return lstGioHang;
        }

        // Them vao gio hang
        public ActionResult ThemGioHang(int sMaSP,string strURL)
        {
            // Lay ra Session gio hang
            List<Giohang> lstGioHang = Laygiohang();
            // Kiem tra sach nay ton tai trong Session["Giohang"] chua?
            Giohang sanpham = lstGioHang.Find(n => n.sMaSP == sMaSP);
            if (sanpham == null)
            {
                sanpham = new Giohang(sMaSP);
                lstGioHang.Add(sanpham);
                return Redirect(strURL);
            }
            else
            {
                sanpham.iSoLuong++;
                return Redirect(strURL);
            }
        }

        // Tong so luong
        private int TongSoLuong()
        {
            int iTongSoLuong = 0;
            List<Giohang> lstGiohang = Session["GioHang"] as List<Giohang>;
            if (lstGiohang!= null)
            {
                iTongSoLuong = lstGiohang.Sum(n => n.iSoLuong);
            }
            return iTongSoLuong;
        }

        //Tinh Tong tien
        private double TongTien()
        {
            double iTongTien = 0;
            List<Giohang> lstGiohang = Session["GioHang"] as List<Giohang>;
            if (lstGiohang != null)
            {
                iTongTien = lstGiohang.Sum(n => n.dThanhTien);
            }
            return iTongTien;
        }
        
        //Xay dung trang gio hang
        public ActionResult GioHang()
        {
            List<Giohang> lstGioHang = Laygiohang();
            if (lstGioHang.Count == 0)
            {
                return RedirectToAction("Index","SanPham");
            }
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.TongTien = TongTien();
            return View(lstGioHang);
        }
        
        public ActionResult GioHangPartial()
        {
            ViewBag.Tongsoluong = TongSoLuong();
            ViewBag.Tongtien = TongTien();
            return PartialView();
        }
        
    }
}
