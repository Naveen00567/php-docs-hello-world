using Microsoft.VisualBasic;
using System.Data;
using System;
using System.IO;
using System.Collections;
using System.Diagnostics;
using System.Drawing;
using System.Runtime.InteropServices;

public class Module1
{
    public static string HiddenText;
    public static short HiddenTextCharCount;
    public static string strPath1, strPath2, strPath3, strTextData;

    public static Bitmap RetriveLogoImage;
    public static Bitmap RetriveFPImage;
    public static string text;

    public static int vt1;
    public static int vt2;
    public static int vt3;

    public struct BinaryData
    {
        public byte[] BineryText;

        //UPGRADE_TODO: "Initialize" must be called to initialize instances of this structure. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1026"'
        public void Initialize()
        {
            BineryText = new byte[801];
        }
    }
    public static short ImageWidth;
    public static short ImageHeight;
    public static short TextWidth;


    public static int LogoImageHeight;
    public static int LogoImageWidth;



    public struct RECT
    {
        //UPGRADE_NOTE: Left was upgraded to Left_Renamed. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1061"'
        public int Left_Renamed;
        public int Top;
        //UPGRADE_NOTE: Right was upgraded to Right_Renamed. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1061"'
        public int Right_Renamed;
        public int Bottom;
    }

    public struct BITMAPINFOHEADER //40 bytes
    {
        public int biSize;
        public int biWidth;
        public int biHeight;
        public short biPlanes;
        public short biBitCount;
        public int biCompression;
        public int biSizeImage;
        public int biXPelsPerMeter;
        public int biYPelsPerMeter;
        public int biClrUsed;
        public int biClrImportant;
    }




    //Dim RGBQUAD As RGBQUAD
    public struct RGBQUAD
    {
        public byte rgbBlue;
        public byte rgbGreen;
        public byte rgbRed;
        public byte rgbReserved;
    }


    public struct BITMAPINFO
    {
        public BITMAPINFOHEADER bmiHeader;
        public RGBQUAD[] bmiColors;

        //UPGRADE_TODO: "Initialize" must be called to initialize instances of this structure. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1026"'
        public void Initialize()
        {
            bmiColors = new Module1.RGBQUAD[256];
        }
    }

    public struct BITMAPFILEHEADER
    {
        public short bfType;
        public int bfSize;
        public short bfReserved1;
        public short bfReserved2;
        public int bfOffBits;
    }



    public struct COLORAMP
    {
        public int lo;
        public int hi;
        public int lored;
        public int logrn;
        public int loblu;
        public int hired;
        public int higrn;
        public int hiblu;
    }


    public struct POINTAPI
    {
        public int X;
        public int Y;
    }
    public static short[,] testimagearray = new short[257, 257];

    public static int[] RetriveData = new int[1001];
    public static long Retrive_Data_Counter;




    public static short[] BinaryLogoImageData = new short[(250 * 250) * 8 * 3 + 1];
    public static short[] BinaryFPImageData = new short[(250 * 250) * 8 * 3 + 1];

    public static short[] tempimgdata = new short[(250 * 250) * 8 * 3 + 1];


    public static double TotalBitToRetrive;

    static int[] BineryTextData = new int[1001];
    //Dim BinaryLogoImageData(1000) As Integer
    public static int[] BinaryInfoData = new int[25];

    static short[] TotalDataToEmbed = new short[101];

    public static BITMAPFILEHEADER BmBitmapFileHeader;
    public static BITMAPINFO BmBitmapInfo;


    public static BITMAPFILEHEADER LogoBitmapFileHeader;
    public static BITMAPINFO LogoBitmapInfo;

    public static byte[] BitmapPixelData;
    public static BITMAPFILEHEADER SaveAsBmBitmapFileHeader;
    public static BITMAPINFO SaveAsBmBitmapInfo;
    public static byte[] SaveAsBitmapPixelData;

    public static string StrCurFileName;
    public static short pictureloaded;
    public static Bitmap OriginalImage;
    public static Bitmap LogoImage;
    public static Bitmap FingerPrintImage;
    public static Bitmap RangeBmp;
    public static Bitmap ResultBmp;

    public const short DIB_RGB_COLORS = 0; //  color table in RGBs
    public static int lTotSize;


    //UPGRADE_WARNING: Structure BITMAPINFO may require marshalling attributes to be passed as an argument in this Declare statement. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1050"'
    //UPGRADE_ISSUE: Declaring a parameter 'As Any' is not supported. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1016"'
    [DllImport("gdi32", ExactSpelling = true, CharSet = CharSet.Ansi, SetLastError = true)]
    public static extern long GetPixel(long hdc, long x, long y);
    public static void ReadBitmapFile(string StrFileName, BITMAPFILEHEADER BmFileHeader, BITMAPINFO BmInfo, byte[] BtArPixelData)
    {
        if (StrFileName.Length <= 0)
        {
            //MessageBox.Show("please select a file");
            return;
        }


        //'Open the bmp file in Binary format
        //FileOpen(1, StrFileName, OpenMode.Binary)
        //'Get the header structures
        //'UPGRADE_WARNING: Get was upgraded to FileGet and has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
        //FileGet(1, BmFileHeader, 1)
        //'UPGRADE_WARNING: Get was upgraded to FileGet and has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
        //FileGet(1, BmInfo.bmiHeader)
        //If BmInfo.bmiHeader.biBitCount = 8 Then
        //	'UPGRADE_WARNING: Get was upgraded to FileGet and has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
        //	FileGet(1, BmInfo.bmiColors)
        //End If
        //If BmInfo.bmiHeader.biCompression = 1 Then
        //	ReDim BtArPixelData(BmInfo.bmiHeader.biSizeImage)
        //Else
        //	ReDim BtArPixelData(BmFileHeader.bfSize - BmFileHeader.bfOffBits)
        //End If
        //'UPGRADE_WARNING: Get was upgraded to FileGet and has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
        //FileGet(1, BtArPixelData)
        //FileClose(1)


    }




    public static void saveBitmapFile(string filename, BITMAPFILEHEADER BmFileHeader, BITMAPINFO BmInfo, byte[] pixeldata)
    {
        if (filename.Length <= 0)
        {
            //MessageBox.Show("select a file");
            return;
        }

        //			 FileSystem.FileOpen(1, filename, OpenMode.Binary,OpenAccess.Default,OpenShare.Default,1000000  );
        //			//UPGRADE_WARNING: Put was upgraded to FilePut and has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
        //			FileSystem.FilePut(1, BmFileHeader, 1);
        //			//UPGRADE_WARNING: Put was upgraded to FilePut and has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
        //			FileSystem.FilePut(1, BmInfo, -1);
        //			//write the pixel data
        //			//UPGRADE_WARNING: Put was upgraded to FilePut and has a new behavior. Click for more: 'ms-help://MS.VSCC.2003/commoner/redir/redirect.htm?keyword="vbup1041"'
        //			FileSystem.FilePut(1, pixeldata, -1); 
        //			FileSystem.FileClose(1);
    }


    public static void createramp(COLORAMP ramp)
    {
        int j;
        int lowr;
        int lowg;
        int lowb;
        int highr;
        int highg;
        int highb;
        double deltared;
        double deltagrn;
        double deltablu;
        double deltapal;
        double mr;
        double mg;
        double mb;
        double br;
        double bg;
        double bb;
        double temp;


        lowr = ramp.lored;
        lowg = ramp.logrn;
        lowb = ramp.loblu;
        highr = ramp.hired;
        highg = ramp.higrn;
        highb = ramp.hiblu;

        deltapal = ramp.hi - ramp.lo;

        if (deltapal == 0)
        {
            goto xit;
        }

        deltared = highr - lowr;
        deltagrn = highg - lowg;
        deltablu = highb - lowb;


        mr = deltared / deltapal;
        mg = deltagrn / deltapal;
        mb = deltablu / deltapal;

        br = lowr - (ramp.lo * mr);
        bg = lowg - (ramp.lo * mg);
        bb = lowb - (ramp.lo * mb);


        for (j = ramp.lo; j <= ramp.hi; j++)
        {
            temp = j * mr + br;
            SaveAsBmBitmapInfo.bmiColors[j].rgbRed = Convert.ToByte(temp + 0.5); // Add 0.5 for precision rounding

            temp = j * mg + bg;
            SaveAsBmBitmapInfo.bmiColors[j].rgbGreen = Convert.ToByte(temp + 0.5);

            temp = j * mb + bb;
            SaveAsBmBitmapInfo.bmiColors[j].rgbBlue = Convert.ToByte(temp + 0.5);
        }

    xit:
        1.GetHashCode(); //nop
    }
}
