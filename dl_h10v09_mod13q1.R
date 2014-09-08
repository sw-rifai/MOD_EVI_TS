library(MODIS)
MODISoptions(localArcPath="/home/sami/MODIS_ARC", 
             outDirPath= "/home/sami/MODIS_ARC/PROCESSED", 
             MRT="/home/sami/MRT/bin")
#getHdf(product="M.D11A1",begin="2011.10.18",end="2011.11.01",tileH=18,tileV=4)

#2000
getHdf(product="MOD13Q1",begin="2000150",end="2000180",tileH=10,tileV=9)
#2001-2002
getHdf(product="MOD13Q1",begin="2001001",end="2002365",tileH=10,tileV=9)
#2003-2004
getHdf(product="MOD13Q1",begin="2003001",end="2004365",tileH=10,tileV=9)

getHdf(product="MOD13Q1",begin="2005001",end="2014150",tileH=10,tileV=9)
