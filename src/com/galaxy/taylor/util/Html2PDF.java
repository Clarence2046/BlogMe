package com.galaxy.taylor.util;

import java.io.BufferedWriter;
import java.io.ByteArrayOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStreamWriter;
import java.nio.charset.Charset;
import java.util.Date;
import java.util.List;

import javax.xml.parsers.DocumentBuilderFactory;
import javax.xml.parsers.ParserConfigurationException;
import javax.xml.transform.OutputKeys;
import javax.xml.transform.Transformer;
import javax.xml.transform.TransformerException;
import javax.xml.transform.TransformerFactory;
import javax.xml.transform.dom.DOMSource;
import javax.xml.transform.stream.StreamResult;

import org.apache.poi.hwpf.HWPFDocument;
import org.apache.poi.hwpf.converter.PicturesManager;
import org.apache.poi.hwpf.converter.WordToHtmlConverter;
import org.apache.poi.hwpf.usermodel.Picture;
import org.apache.poi.hwpf.usermodel.PictureType;

import com.itextpdf.text.Document;
import com.itextpdf.text.DocumentException;
import com.itextpdf.text.pdf.PdfWriter;
import com.itextpdf.tool.xml.XMLWorkerHelper;

/**
 * 如果html内容是纯英文版本的,可以不用存为html文件,直接解析html字符串流即可
 * html中包含中文,直接解析字符串流会不显示中文,没找到解决显示中文办法,所以采用 下面的折中方式.
 * 
 * 将html字符串存入html文件,然后使用 itextpdf 以及XMLWorker 的
 * XMLWorkerHelper.getInstance().parseXHtml(writer, document,inputStream,
 * Charset.forName("UTF-8")); 将html转换为pdf
 * 
 * html字符串需要严格的格式 如果通过KindEditor 进行编辑的文档,最好不要通过拷贝word中编辑的内容,格式可能会出现问题(基本上都会出现)
 * 直接在KindEditor 中编辑内容,排版最好
 * 
 * 所需jar包: itextpdf-5.5.8.jar xmlworker-5.5.8.jar iTextAsian.jar
 * //字体包,最好加上,可以解决中文乱码
 * 
 * @author lihl
 * 
 */
public class Html2PDF {

	/**
	 * body部分的html 字符串转pdf
	 * 
	 * @param htmlStr
	 *            html页面body中的html字符串部分
	 * @param outFile
	 *            转换成pdf后的pdf存放位置
	 * @param basepath
	 *            存放pdf文件的基本文件夹 basepath/${folder}/${folder}.html
	 *            basepath/${folder}/outFile
	 */
	public static void convertHtmlStr2PDF(String htmlStr, String outFile,
			String basepath) {
		Document document = new Document();

		StringBuffer htmls = new StringBuffer(
				"<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		htmls.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
		htmls.append("<html xmlns=\"http://www.w3.org/1999/xhtml\"> ");
		htmls.append("<head> ");
		htmls.append("<title>test.html</title> ");
		htmls.append(" <meta name=\"keywords\" content=\"keyword1,keyword2,keyword3\"/> ");
		htmls.append(" <meta name=\"description\" content=\"this is my page\"/>");
		htmls.append(" <meta name=\"content-type\" content=\"text/html; charset=UTF-8\"/> ");
		htmls.append(" </head><body >");
		htmls.append(htmlStr);
		htmls.append(" </body></html>");

		// 根据当前时间创建文件夹,存放当前的文件
		String folder = new Date().getTime() + "";
		String baseDir = basepath + File.separator + folder + File.separator;
		File ff = new File(baseDir);
		if (!ff.exists()) {
			ff.mkdirs();
		}
		// 临时文件位置
		String savePath = baseDir + folder + ".html";
		// PDF输出文件位置
		outFile = baseDir + outFile;
		// 返回临时文件位置
		String tempHtmlPath = getTempHtml(htmls.toString(), savePath);
		try {
			PdfWriter writer = PdfWriter.getInstance(document,
					new FileOutputStream(outFile));

			document.open();

			FileInputStream inputStream = new FileInputStream(tempHtmlPath);

			// 解析html的方法
			XMLWorkerHelper.getInstance().parseXHtml(writer, document,
					inputStream, Charset.forName("UTF-8"));

			// 记住关闭document
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			// 删除临时文件
			File f = new File(tempHtmlPath);

			if (f.exists()) {
				f.delete();
			}
		}
	}

	/**
	 * html 文件转pdf
	 * 
	 * @param htmlPath
	 *            html文件路径
	 * @param outFile
	 *            输出pdf文件名称 ,后缀.pdf
	 * @param basepath
	 *            存放pdf文件的基本路径
	 * @return 返回生成的pdf文件路径 basepath/${folder}/outFile
	 */
	public static String convertHtml2PDF(String htmlPath, String outFile,
			String basepath) {
		Document document = new Document();

		// 根据当前时间创建文件夹,存放当前的文件
		String folder = new Date().getTime() + "";
		String baseDir = basepath + File.separator + folder + File.separator;
		File ff = new File(baseDir);
		if (!ff.exists()) {
			ff.mkdirs();
		}

		// PDF输出文件位置
		outFile = baseDir + outFile;
		try {
			PdfWriter writer = PdfWriter.getInstance(document,
					new FileOutputStream(outFile));

			document.open();

			FileInputStream inputStream = new FileInputStream(htmlPath);

			// 解析html的方法
			XMLWorkerHelper.getInstance().parseXHtml(writer, document,
					inputStream, Charset.forName("UTF-8"));

			// 记住关闭document
			document.close();
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (DocumentException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return outFile;
	}

	/**
	 * 将html字符串 存入html文件
	 * 
	 * @param htmlStr
	 * @param savepath
	 * @return
	 */
	private static String getTempHtml(String htmlStr, String savepath) {
		File f = new File(savepath);
		try {
			f.createNewFile();
		} catch (IOException e1) {
			e1.printStackTrace();
		}
		FileOutputStream fileOutputStream = null;
		try {
			fileOutputStream = new FileOutputStream(f);
			fileOutputStream.write(htmlStr.getBytes("UTF-8"));
			fileOutputStream.flush();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (fileOutputStream != null) {
					fileOutputStream.close();
				}
			} catch (IOException e) {
			}
		}
		return savepath;
	}

	public static void main(String[] args) throws FileNotFoundException,
			IOException, ParserConfigurationException, TransformerException {
		main1();
		convertHtml2PDF("f:/tttt.html", "1.pdf", "f:/");

	}

	public static void main1() throws FileNotFoundException, IOException,
			ParserConfigurationException, TransformerException {
		HWPFDocument document = new HWPFDocument(new FileInputStream(
				"F:\\test.doc"));

		WordToHtmlConverter converter = new WordToHtmlConverter(
				DocumentBuilderFactory.newInstance().newDocumentBuilder()
						.newDocument());

		converter.setPicturesManager(new PicturesManager() {

			@Override
			public String savePicture(byte[] arg0, PictureType arg1,
					String arg2, float arg3, float arg4) {
				return "test/" + arg2;
			}
		});

		converter.processDocument(document);

		List<Picture> pics = document.getPicturesTable().getAllPictures();

		if (pics != null) {
			for (int i = 0; i < pics.size(); i++) {
				Picture picture = pics.get(i);

				picture.writeImageContent(new FileOutputStream("F:/test/"
						+ picture.suggestFullFileName()));
			}
		}

		org.w3c.dom.Document htmlDocument = converter.getDocument();

		ByteArrayOutputStream out = new ByteArrayOutputStream();
		DOMSource domSource = new DOMSource(htmlDocument);
		StreamResult streamResult = new StreamResult(out);

		TransformerFactory tf = TransformerFactory.newInstance();
		Transformer serializer = tf.newTransformer();
		serializer.setOutputProperty(OutputKeys.ENCODING, "GB2312");
		serializer.setOutputProperty(OutputKeys.INDENT, "yes");
		serializer.setOutputProperty(OutputKeys.METHOD, "html");
		serializer.transform(domSource, streamResult);
		out.close();
		String os = new String(out.toByteArray(), "gb2312");

		os = os.replace("<p>", "<p><font face=\"宋体\">");
		os = os.replace("<p class=\"p1\">",
				"<p class=\"p1\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p2\">",
				"<p class=\"p2\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p3\">",
				"<p class=\"p3\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p4\">",
				"<p class=\"p4\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p5\">",
				"<p class=\"p5\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p6\">",
				"<p class=\"p6\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p7\">",
				"<p class=\"p7\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p8\">",
				"<p class=\"p8\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p9\">",
				"<p class=\"p9\"><font face=\"宋体\">");
		os = os.replace("<p class=\"p10\">",
				"<p class=\"p10\"><font face=\"宋体\">");
		os = os.replace("</p>", "</font></p>");

		String bname = "刘易斯";
		bname = makeup(bname);
		String sname = "刘易斯";
		sname = makeup(sname);

		String bcode = "102510021102";
		bcode = makeup(bcode);
		String scode = "102510021103";
		scode = makeup(scode);

		String breedname = "商品";

		// System.out.println(os);
		os = os.replace("bname", bname);
		os = os.replace("sname", sname);

		os = os.replace(
				"tradeno",
				"<span style=\"width: 180px;display:inline-block;border-bottom:1px solid  gray;text-align: center;\">150015001500</span>");
		os = os.replace(
				"signdate",
				"<span style=\"width: 180px;display:inline-block;border-bottom:1px solid  gray;text-align: center;\">2016-10-12 11:21:15</span>");

		os = os.replace("bcode", bcode);
		os = os.replace("scode", scode);
		os = os.replace("breedname", breedname);

		int start = os.indexOf("<body");
		int end = os.lastIndexOf("</body>");
		String body = os.substring(start, end);
		// System.out.println(body);

		// body = body.replace(">", "><FONT face=\"宋体\">");
		// body = body.replace("</", "</FONT></");

		int start1 = os.indexOf("<style");
		int end1 = os.lastIndexOf("</style>");
		String style = os.substring(start1, end1);

		style = style.replace("text-align:end", "margin-left: 450px;");

		// System.out.println(style);
		//
		int start11 = os.indexOf("<title");
		int end11 = os.lastIndexOf("</title>");
		String title = os.substring(start11, end11);
		// System.out.println(title);

		StringBuffer htmls = new StringBuffer(
				"<?xml version=\"1.0\" encoding=\"UTF-8\"?>");
		htmls.append("<!DOCTYPE html PUBLIC \"-//W3C//DTD HTML 4.01 Transitional//EN\" \"http://www.w3.org/TR/html4/loose.dtd\">");
		htmls.append("<html xmlns=\"http://www.w3.org/1999/xhtml\"> ");
		htmls.append("<head> ");
		htmls.append(title + "</title> ");
		htmls.append(" <meta name=\"keywords\" content=\"keyword1,keyword2,keyword3\"/> ");
		htmls.append(" <meta name=\"description\" content=\"this is my page\"/>");
		htmls.append(" <meta http-equiv=\"content-type\" content=\"text/html; charset=UTF-8\"/> ");
		htmls.append(style);
		htmls.append(" </style> ");
		htmls.append(" </head>");
		htmls.append(body);
		htmls.append(" </body></html>");

		writeFile(htmls.toString(), "f:/TTTT.HTML");

		// convertHtml2PDF("f:/TTTT.HTML", "tttt.pdf", "f:/");

	}

	public static String makeup(String toDecorated) {
		Boolean hasC = new Boolean(false);
		hasC = hasChinese(toDecorated);
		double length = getLength(toDecorated );
		System.out.println(toDecorated + "=" +length);
		int len = Double.valueOf(length).intValue();
		
		int before = 0;
		int after = 0;
		if(hasC){
			len =len+2;
			before = (16 - len) / 2;
			after = 16 - len - before;
		}else{
			toDecorated = toDecorated+" ";
			before = (16 - len) / 2;
			after = 16 - len - before;
		}
		
		for (int i = 0; i < before; i++) {
			toDecorated = "&nbsp;" + toDecorated;
		}
		for (int i = 0; i < after; i++) {
			toDecorated = toDecorated + "&nbsp;";
		}
		
		System.out.println("Decorated: " + toDecorated);
		return toDecorated;
	}

	/**
	 * 得到一个字符串的长度,显示的长度,一个汉字或日韩文长度为1,英文字符长度为0.5
	 * 
	 * @param String
	 *            s 需要得到长度的字符串
	 * @return int 得到的字符串长度
	 */
	public static double getLength(String s) {
		double valueLength = 0;
		
		String chinese = "[\u4e00-\u9fa5]";
		// 获取字段值的长度，如果含中文字符，则每个中文字符长度为2，否则为1
		for (int i = 0; i < s.length(); i++) {
			// 获取一个字符
			String temp = s.substring(i, i + 1);
			// 判断是否为中文字符
			if (temp.matches(chinese)) {
				// 中文字符长度为1
				valueLength += 2;
			} else {
				// 其他字符长度为0.5
				valueLength += 1;
			}
		}
		// 进位取整
		return Math.ceil(valueLength);
	}
	public static boolean hasChinese(String s) {
		String chinese = "[\u4e00-\u9fa5]";
		for (int i = 0; i < s.length(); i++) {
			// 获取一个字符
			String temp = s.substring(i, i + 1);
			// 判断是否为中文字符
			if (temp.matches(chinese)) {
				return true;
			} 
		}
		return false;
	}

	public static void writeFile(String content, String path) {
		FileOutputStream fos = null;
		BufferedWriter bw = null;
		try {
			File file = new File(path);
			fos = new FileOutputStream(file);
			bw = new BufferedWriter(new OutputStreamWriter(fos, "UTF-8"));
			bw.write(content);
		} catch (FileNotFoundException fnfe) {
			fnfe.printStackTrace();
		} catch (IOException ioe) {
			ioe.printStackTrace();
		} finally {
			try {
				if (bw != null)
					bw.close();
				if (fos != null)
					fos.close();
			} catch (IOException ie) {
			}
		}
	}

}
