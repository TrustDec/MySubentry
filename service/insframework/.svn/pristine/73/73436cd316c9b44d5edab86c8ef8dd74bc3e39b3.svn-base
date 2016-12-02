package com.insframework.common.utils.map;
import java.awt.geom.GeneralPath;
import java.awt.geom.Point2D;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class ContainUtil {

	public static void main(String[] args) {
		// 测试圆形
		System.out.println(CircleUtils.contains(108.875443, 34.165492,
				108.875481, 34.166397, 223.12620530064694));

		// 测试多边形
		List<Map<String, Double>> points = new ArrayList<Map<String, Double>>();
		Map<String, Double> map1 = new LinkedHashMap<String, Double>();
		Map<String, Double> map2 = new LinkedHashMap<String, Double>();
		Map<String, Double> map3 = new LinkedHashMap<String, Double>();
		Map<String, Double> map4 = new LinkedHashMap<String, Double>();
		Map<String, Double> map5 = new LinkedHashMap<String, Double>();
		Map<String, Double> map6 = new LinkedHashMap<String, Double>();
		Map<String, Double> map7 = new LinkedHashMap<String, Double>();
		map1.put("x", 34.168172);
		map1.put("y", 108.87281);
		map2.put("x", 34.168143);
		map2.put("y", 108.871235);
		map3.put("x", 34.168866);
		map3.put("y", 108.871337);
		map4.put("x", 34.16923);
		map4.put("y", 108.872426);
		map5.put("x", 34.16899);
		map5.put("y", 108.873376);
		map6.put("x", 34.168822);
		map6.put("y", 108.874566);
		map7.put("x", 34.168369);
		map7.put("y", 108.874448);
		points.add(map1);
		points.add(map2);
		points.add(map3);
		points.add(map4);
		points.add(map5);
		points.add(map6);
		points.add(map7);
		System.out.println(PolygonUtils.contains(34.16850540221751,
				108.87250191653683, points));

	}

	/**
	 * 判断圆形区域工具类
	 * 
	 * @author Administrator
	 * 
	 */

	static class CircleUtils {

		private static final double EARTH_RADIUS = 6378137;

		private static double rad(double d) {
			return d * Math.PI / 180.0;
		}

		/**
		 * 圆形
		 * 
		 * @param lng1
		 *            被包含点经度
		 * @param lat1
		 *            被包含点纬度
		 * @param lng2
		 *            圆心点经度
		 * @param lat2
		 *            圆心点纬度
		 * @param radius
		 *            圆半径 单位：米
		 * @return
		 */
		public static boolean contains(double lng1, double lat1, double lng2,
				double lat2, double radius) {
			double radLat1 = rad(lat1);
			double radLat2 = rad(lat2);
			double a = radLat1 - radLat2;
			double b = rad(lng1) - rad(lng2);
			double s = 2 * Math.asin(Math.sqrt(Math.pow(Math.sin(a / 2), 2)
					+ Math.cos(radLat1) * Math.cos(radLat2)
					* Math.pow(Math.sin(b / 2), 2)));
			s = s * EARTH_RADIUS;
			s = Math.round(s * 10000) / 10000;
			System.out.println(s);
			if (radius > s) {
				return true;
			}
			return false;
		}

	}

	/**
	 * 多边形区域判断工具类
	 * 
	 * @author Administrator
	 * 
	 */
	static class PolygonUtils {

		/**
		 * 检查一个坐标是否在多边形内
		 * 
		 * @param x
		 *            纬度 31.000...
		 * @param y
		 *            经度 121.000...
		 * @param polygonPoints
		 *            多边形边界的经纬度数组
		 * @return
		 */
		public static boolean contains(double x, double y,
				List<Map<String, Double>> polygonPoints) {
			Point2D.Double geoPoint = buildPoint(x, y);
			List<Point2D.Double> geoPolygon = buildPolygon(polygonPoints);
			return PolygonUtils.isPointInPolygon(geoPoint, geoPolygon);
		}

		/**
		 * 检查一个坐标是否在多边形内
		 * 
		 * @param point
		 *            检查的点坐标
		 * @param polygon
		 *            参照的多边形
		 * @return
		 */
		public static boolean isPointInPolygon(Point2D.Double point,
				List<Point2D.Double> polygon) {
			GeneralPath p = new GeneralPath();

			Point2D.Double first = polygon.get(0);
			p.moveTo(first.x, first.y);
			polygon.remove(0);

			for (Point2D.Double d : polygon) {
				p.lineTo(d.x, d.y);
			}

			p.lineTo(first.x, first.y);

			p.closePath();

			return p.contains(point);
		}

		/**
		 * 构建一个坐标点
		 * 
		 * @param x
		 *            纬度 31.000...
		 * @param y
		 *            经度 121.000...
		 * @return
		 */
		public static Point2D.Double buildPoint(double x, double y) {
			return new Point2D.Double(x, y);
		}

		/**
		 * 构建一个多边形
		 * 
		 * @param polygonPoints
		 * @return
		 */
		public static List<Point2D.Double> buildPolygon(
				List<Map<String, Double>> polygonPoints) {

			List<Point2D.Double> geoPolygon = new ArrayList<Point2D.Double>();

			for (Map<String, Double> map : polygonPoints) {
				geoPolygon.add(PolygonUtils.buildPoint(map.get("x"),
						map.get("y")));
			}

			return geoPolygon;
		}

	}

}
