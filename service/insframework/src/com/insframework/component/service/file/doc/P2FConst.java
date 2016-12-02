package com.insframework.component.service.file.doc;

public class P2FConst
{
	// APPLICATIONTYPE enumeration constants
	public static final int MSEXCEL = 0x00000001;
	public static final int MSWORD = 0x00000002;
	public static final int MSPOWERPOINT = 0x00000004;
	public static final int ACROBAT = 0x00000008;

	// IMAGEFORMAT enumeration constants
	public static final int JPEG = 1;
	public static final int PNG = 2;

	// IMGBEHAVIOR enumeration constants
	public static final int STRETCH = 1;
	public static final int TILE = 2;

	// INTERFACE_OPTION enumeration constants
	public static final int INTLOGO = 0x00000001;
	public static final int INTDRAG = 0x00000002;
	public static final int INTSELTEXT = 0x00000004;
	public static final int INTZOOMSLIDER = 0x00000008;
	public static final int INTZOOMBOX = 0x00000010;
	public static final int INTFITWIDTH = 0x00000020;
	public static final int INTFITPAGE = 0x00000040;
	public static final int INTPREVPAGE = 0x00000080;
	public static final int INTGOTOPAGE = 0x00000100;
	public static final int INTNEXTPAGE = 0x00000200;
	public static final int INTSEARCHBOX = 0x00000400;
	public static final int INTSEARCHBUT = 0x00000800;
	public static final int INTROTATE = 0x00001000;
	public static final int INTPRINT = 0x00002000;
	public static final int INTNEWWIND = 0x00004000;
	public static final int INTHELP = 0x00008000;
	public static final int INTBACKBUTTON = 0x00030000;
	public static final int INTBACKBUTTONAUTO = 0x00010000;
	public static final int INTFORWARDBUTTON = 0x000C0000;
	public static final int INTFORWARDBUTTONAUTO = 0x00040000;
	public static final int INTFULLSCREEN = 0x00300000;
	public static final int INTFULLSCREENAUTO = 0x00100000;


	// METADATAPORMAT enumeration constants
	public static final int XML = 1;
	public static final int TEXT = 2;

	// OUTPUTFORMAT enumeration constants
	public static final int SINGLEFILE = 1;
	public static final int SINGLEFILEPERPAGE = 2;
	public static final int EXTVIEWER = 4;

	// PAPER_ORIENTATION enumeration constants
	public static final int ORIENT_PORTRAIT = 1;
	public static final int ORIENT_LANDSCAPE = 2;

	// PROTECTION_OPTION enumeration constants
	public static final int PROTDISPRINT = 0x00000001;
	public static final int PROTDISTEXTCOPY = 0x00000002;
	public static final int PROTENAPI = 0x00000004;

	// ThreeStateFlag enumeration constants
	public static final int TSF_NO = 0;
	public static final int TSF_YES = 1;
	public static final int TSF_AUTO = 2;

	// TOOLBARIMAGE enumeration constants
	public static final int IMGLOGO = 1;
	public static final int IMGDRAG = 2;
	public static final int IMGSELTEXT = 3;
	public static final int IMGZOOMRULER = 4;
	public static final int IMGZOOMFOCUSNADLE = 5;
	public static final int IMGZOOMNADLE = 6;
	public static final int IMGFITWIDTH = 7;
	public static final int IMGFITPAGE = 8;
	public static final int IMGPREVPAGE = 9;
	public static final int IMGNEXTPAGE = 10;
	public static final int IMGSEARCHBUT = 11;
	public static final int IMGROTATE = 12;
	public static final int IMGPRINT = 13;
	public static final int IMGNEWWIND = 14;
	public static final int IMGHELP = 15;
	public static final int IMGMORE = 16;
	public static final int IMGTOOLBARBGR = 17;
	public static final int IMGBACK = 18;
	public static final int IMGFORWARD = 19;
	public static final int IMGFULLSCREEN = 20;
	public static final int IMGEXITFULLSCREEN = 21;

	// TEMPLATETYPE enumeration constants
	public static final int TEMPLATE_CUSTOM = 1;
	public static final int TEMPLATE_ACTIONSCRIPT2 = 2;
	public static final int TEMPLATE_ACTIONSCRIPT3 = 3;

	// WATERMARKANCHOR enumeration constants
	public static final int CENTER = 0;
	public static final int LEFTCENTER = 1;
	public static final int RIGHTCENTER = 2;
	public static final int TOPCENTER = 16;
	public static final int BOTTOMCENTER = 32;
	public static final int LEFTTOP = 17;
	public static final int RIGHTTOP = 18;
	public static final int LEFTBOTTOM = 33;
	public static final int RIGHTBOTTOM = 34;

	// COMPRESSION_METHOD enumeration constants
	public static final int COMPRESSION_METHOD_ZLIB = 0;
	public static final int COMPRESSION_METHOD_LZMA = 1;

	// DOCUMENT_TYPE Enumeration constants
	public static final int FLASH = 1;
	public static final int HTML5 = 2;
	
	// BROWSER_TYPE Enumeration public static final intants
	public static final int INTERNET_EXPLORER =   1;
	public static final int FIREFOX =             2;
	public static final int CHROME =              4;
	public static final int OPERA =               8;
	public static final int SAFARI =              16;
	
	// POWERPOINT_PRINTOUTPUT Enumeration constants
	public static final int POWERPOINT_PRINTOUTPUT_AUTO =			0;
	public static final int POWERPOINT_PRINTOUTPUT_Slides =			1;
	public static final int POWERPOINT_PRINTOUTPUT_TwoSlideHandouts =	2;
	public static final int POWERPOINT_PRINTOUTPUT_ThreeSlideHandouts =	3;
	public static final int POWERPOINT_PRINTOUTPUT_SixSlideHandouts	=	4;
	public static final int POWERPOINT_PRINTOUTPUT_NotesPages = 		5;
	public static final int POWERPOINT_PRINTOUTPUT_Outline =		6;
	public static final int POWERPOINT_PRINTOUTPUT_BuildSlides =		7;
	public static final int POWERPOINT_PRINTOUTPUT_FourSlideHandouts =	8;
	public static final int POWERPOINT_PRINTOUTPUT_NineSlideHandouts =	9;
	public static final int POWERPOINT_PRINTOUTPUT_OneSlideHandouts	=	10;
}