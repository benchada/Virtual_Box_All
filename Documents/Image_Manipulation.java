        for (int i =0; x<img.getWidth(); i++ ){
            for (int j=0; j<img.getHeight(); j++){
                if(!((i-dx)<0 || (i-dx)>img.getWidth()-1 || (j-dy) <0 || (j-dy)

>img.getHeight()-1))
                    img.setSample(i, j, 0,coby.getSample(i-dx,j-dy,0));
                else
                    img.setSample(i,j,0,0);

            }}

        mainimg.setData(img);
        return mainimg;
    }

    public BufferedImage scale(double scale_factor){
        WritableRaster img = mainimg.getRaster();
        BufferedImage newimg = new BufferedImage((int)(img.getWidth()*scale_factor),

(int)(img.getHeight()*sf),BufferedImage.TYPE_BYTE_GRAY);
        WritableRaster nimg = newimg.getRaster();
        for (int i =0; x<newimg.getWidth(); i++ ){
            for (int j=0; y<newimg.getHeight(); j++){
                nimg.setSample(i,j,0,img.getSample((int)(i/scale_factor),(int)

(j/scale_factor),0));

            }}

        newimg.setData(nimg);
        return newimg;
    }


    public BufferedImage rotation(double angle){
        WritableRaster img = mainimg.getRaster();
        WritableRaster cimg = mainimg.copyData(null);
        angle*=Math.PI/180;
        double x2,y2,xo,yo;
        for (int x =0; x<img.getWidth(); x++ ){
            for (int y=0; y<img.getHeight(); y++){
                xo=x-img.getWidth()/2;
                yo=y-img.getHeight()/2;
                x2=xo*Math.cos(angle)-yo*Math.sin(angle);
                y2=yo*Math.cos(angle)+xo*Math.sin(angle);
                x2+=img.getWidth()/2;
                y2+=img.getHeight()/2;
                if(x2>=0 && x2<img.getWidth() && y2>-1 && y2<img.getHeight())
                    img.setSample(x, y, 0, cimg.getSample((int)x2,(int)

y2,0));
                else
                    img.setSample(x, y, 0,0);
            }}

        mainimg.setData(img);
        return mainimg;
    }
   
   

    public BufferedImage negative(){
        WritableRaster img = mainimg.getRaster();
        int z;

        for (int i =0; i<img.getWidth(); i++ ){
            for (int j=0; j<img.getHeight(); j++){

                z = 255 - img.getSample(i , j, 0);
                img.setSample(i, j, 0,z);

           
            }}

        mainimg.setData(img);
        return mainimg;
    }
   


    public BufferedImage log(){
        WritableRaster img = mainimg.getRaster();
        int z;

        for (int x =0; x<img.getWidth(); x++ ){
            for (int y=0; y<img.getHeight(); y++){

                z = (int)(255/Math.log(256.0)* Math.log(1+ img.getSample(x , y ,

0)));
                img.setSample(x, y, 0,z);
            }}

        mainimg.setData(img);
        return mainimg;
    }

    public BufferedImage loginverse(){
        WritableRaster img = mainimg.getRaster();
        int z;

        for (int x =0; x<img.getWidth(); x++ ){
            for (int y=0; y<img.getHeight(); y++){

                z = (int)(255/Math.pow(1.02,256.0)* Math.pow(1.02, img.getSample

(x , y , 0)))-1;
                img.setSample(x, y, 0,z);
            }}

        mainimg.setData(img);
        return mainimg;
    }
   
    public BufferedImage nthpow(double n){
        WritableRaster img = mainimg.getRaster();
        int z;

        for (int x =0; x<img.getWidth(); x++ ){
            for (int y=0; y<img.getHeight(); y++){

                z = (int)(255/Math.pow(255,n)* Math.pow(img.getSample(x , y ,

0),n));
                img.setSample(x, y, 0,z);
            }}

        mainimg.setData(img);
        return mainimg;
    }


   
    public BufferedImage folding(){
        WritableRaster img = mainimg.getRaster();
          //First step: Folding Vertically     
        for (int x =0; x<img.getWidth(); x++ )
        {
            for (int y=0; y<(img.getHeight())/2; y++)
                      {
                         int s = img.getSample(x, y, 0);
                         int r = img.getSample(x, img.getWedth-j, 0);
                         int avg;
             avg = (int)(r+s)/2;
            img.setSample(x, y, 0, avg);
                       }
         }

        //Second Step: Folding Horizantaly
        for (int x =0; x<(img.getWidth())/2; x++ )
        {
            for (int y=0; y<(img.getHeight())/2; y++)
                      {
                         int s = img.getSample(x, y, 0);
                         int r = img.getSample(img.getWedth()-x, y, 0);
                         int average = (int)(r+s)/2;
           
img.setSample(x, y, 0, average);
                       }
         }

        mainimg.setData(img);
        return mainimg;
    }


   


    public BufferedImage histogram(){
        WritableRaster img = mainimg.getRaster();
        int[] accum = new int[256];
        int[] lut= new int[256];
        for(int i=0;i<256;i++)
            accum[i]=0;
        for (int x =0; x<img.getWidth(); x++ ){
            for (int y=0; y<img.getHeight(); y++){
                accum[img.getSample(x,y,0)]++;
            }}
        int adder=0;
        for(int i=0;i<256;i++){
            adder+=accum[i];
            lut[i]=adder*255/(img.getWidth()*img.getHeight());
        }
        for (int x =0; x<img.getWidth(); x++ ){
            for (int y=0; y<img.getHeight(); y++){
                img.setSample(x, y, 0, lut[img.getSample(x,y,0)]);
            }}

        mainimg.setData(img);
        return mainimg;
    }


}
