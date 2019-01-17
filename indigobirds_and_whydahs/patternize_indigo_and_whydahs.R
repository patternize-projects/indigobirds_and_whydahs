# install.packages("devtools")
# library(devtools)
# install_github("StevenVB12/patternize")
# # Morpho has committed a change that affects computeTransform used in
# # the patternize functions patLanRGB and patLanK (not available in CRAN)
# install_github("zarquon42b/Morpho")

library(patternize)
library(Morpho)
library(viridis)
colfunc <- inferno(100)

E_astrild       <- c('DSC_0170','DSC_0198','DSC_0248','DSC_0266','DSC_0767',
                     'DSC_5282','DSC_5668','DSC_5804','DSC_5851','DSC_6303',
                     'DSC_8798','DSC_8865','DSC_8928','DSC_9009','DSC_9321',
                     'DSC_9462','DSC_9500','DSC_9679','DSC_9708','DSC_9747',
                     'DSC_9932','DSC_9959','DSC_9978') # common waxbill


V_macroura      <- c('DSC_0579','DSC_0686','DSC_0834','DSC_0993','DSC_1036',
                     'DSC_1071','DSC_1098','DSC_1160','DSC_1281','DSC_1316',
                     'DSC_1347','DSC_5163','DSC_5180','DSC_5724','DSC_6255',
                     'DSC_6269','DSC_8972') # pin-tailed whydah


L_rhodopareia   <- c('DSC_0726','DSC_0890','DSC_0919','DSC_0950','DSC_6348',
                     'DSC_8015','DSC_9252','DSC_9292','DSC_9886','DSC_9905',
                     'DSC_9186') # Jameson's firefinch

V_purpurascens  <- c('DSC_0802','DSC_1223','DSC_5564','DSC_8263','DSC_9119')
                    # Purple Indigobird

V_obtusa        <- c('DSC_0054') # Broad-tailed Paradise Whydah
P_afra          <- c('DSC_0099','DSC_0128','DSC_0151','DSC_8331','DSC_8445') 
                    # Orange-winged Pytilia


A_subflava      <- c('DSC_0318','DSC_0360','DSC_6418','DSC_6438')
                    # Zebra Waxbill

L_senegala      <- c('DSC_0006','DSC_8529') # Red-billed Firefinch

O_atricollis    <- c('DSC_0621','DSC_0660','DSC_1197','DSC_1246','DSC_5511')
                    # Africa Quailfinch

P_locustella    <- c('DSC_9587','DSC_9638','DSC_9664')
                    # Locust Finch

P_melba         <- c('DSC_0603','DSC_5389','DSC_5449','DSC_5474','DSC_5778',
                     'DSC_5890','DSC_5871')
                    # Melba Finch

S_cucullatus    <- c('DSC_5593','DSC_5631','DSC_5955',
                     'DSC_6240','DSC_6223','DSC_6154','DSC_6116','DSC_6140')
                    # Bronze Mannikin

U_angolensis    <- c('DSC_5999','DSC_6022','DSC_6042','DSC_6096',
                     'DSC_6104','DSC_6368','DSC_6382','DSC_6389','DSC_6084')
                    # Blue Waxbill




# make list with landmarks
prepath <- 'images'
extension <- '_landmarks2.txt'

E_astrildL      <- makeList(E_astrild,      'landmark', prepath, extension)
L_rhodopareiaL  <- makeList(L_rhodopareia,  'landmark', prepath, extension)
V_macrouraL     <- makeList(V_macroura,     'landmark', prepath, extension)
V_purpurascensL <- makeList(V_purpurascens, 'landmark', prepath, extension)

V_obtusaL <- makeList(V_obtusa, 'landmark', prepath, extension)
P_afraL <- makeList(P_afra, 'landmark', prepath, extension)

A_subflavaL <- makeList(A_subflava, 'landmark', prepath, extension)
L_senegalaL <- makeList(L_senegala, 'landmark', prepath, extension)
O_atricollisL <- makeList(O_atricollis, 'landmark', prepath, extension)
P_locustellaL <- makeList(P_locustella, 'landmark', prepath, extension)
P_melbaL <- makeList(P_melba, 'landmark', prepath, extension)
S_cucullatusL <- makeList(S_cucullatus, 'landmark', prepath, extension)
U_angolensisL <- makeList(U_angolensis, 'landmark', prepath, extension)

# make list with images
prepath <- 'images'
extension <- '.JPG'

E_astrildI      <- makeList(E_astrild,      'image', prepath, extension)
L_rhodopareiaI  <- makeList(L_rhodopareia,  'image', prepath, extension)
V_macrouraI     <- makeList(V_macroura,     'image', prepath, extension)
V_purpurascensI <- makeList(V_purpurascens, 'image', prepath, extension)

V_obtusaI <- makeList(V_obtusa, 'image', prepath, extension)
P_afraI <- makeList(P_afra, 'image', prepath, extension)

A_subflavaI <- makeList(A_subflava, 'image', prepath, extension)
L_senegalaI <- makeList(L_senegala, 'image', prepath, extension)
O_atricollisI <- makeList(O_atricollis, 'image', prepath, extension)
P_locustellaI <- makeList(P_locustella, 'image', prepath, extension)
P_melbaI <- makeList(P_melba, 'image', prepath, extension)
S_cucullatusI <- makeList(S_cucullatus, 'image', prepath, extension)
U_angolensisI <- makeList(U_angolensis, 'image', prepath, extension)

###
# Make reference that is mean of all samples
###

# combine landmark and image lists
ALL_ID1    <- c(E_astrild,  V_macroura,  V_purpurascens,  L_rhodopareia)
ALL_lList1 <- c(E_astrildL, V_macrouraL, V_purpurascensL, L_rhodopareiaL)
ALL_iList1 <- c(E_astrildI, V_macrouraI, V_purpurascensI, L_rhodopareiaI)

# make array for Procrustes superimposition to obtain meanshape matrix as transformRef
ALL_lArray1 <- lanArray(ALL_lList1, adjustCoords = TRUE, ALL_iList)

# perform Procrustes superimposition
refShape <- procSym(ALL_lArray1)
###

# combine landmark and image lists
ALL_ID    <- c(E_astrild,  V_macroura,  V_purpurascens,  L_rhodopareia, V_obtusa, P_afra, A_subflava, L_senegala, O_atricollis, P_locustella, P_melba, S_cucullatus, U_angolensis)
ALL_lList <- c(E_astrildL, V_macrouraL, V_purpurascensL, L_rhodopareiaL, V_obtusaL, P_afraL, A_subflavaL, L_senegalaL, O_atricollisL, P_locustellaL, P_melbaL, S_cucullatusL, U_angolensisL)
ALL_iList <- c(E_astrildI, V_macrouraI, V_purpurascensI, L_rhodopareiaI, V_obtusaI, P_afraI, A_subflavaI, L_senegalaI, O_atricollisI, P_locustellaI, P_melbaI, S_cucullatusI, U_angolensisI)



#####################################
# run alignment of color patterns
#####################################

#sampleRGB(E_astrildI[[2]])
# sampleRGB(E_astrildI[[2]])

# Common Waxbill
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_E_astrild <- patLanRGB(E_astrildI, E_astrildL, RGB, transformRef = refShape$mshape, 
                                         colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                         cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_E_astrild, file="output/rasterList_lanRGB_E_astrild_95_35_35.rda")

# Pin-tailed Whydah
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_V_macroura <- patLanRGB(V_macrouraI, V_macrouraL, RGB, transformRef = refShape$mshape, 
                                          colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                          cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_V_macroura, file="output/rasterList_lanRGB_V_macroura_95_35_35.rda")

# Purple Indigobird
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_V_purpurascens <- patLanRGB(V_purpurascensI, V_purpurascensL, RGB, transformRef = refShape$mshape, 
                                              colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                              cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_V_purpurascens, file="output/rasterList_lanRGB_V_purpurascens_95_35_35.rda")

# Jamesonâs Firefinch
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_L_rhodopareia1 <- patLanRGB(L_rhodopareiaI[c(1:10)], L_rhodopareiaL[c(1:10)], RGB, transformRef = refShape$mshape,
                                             colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                             cropOffset = c(20,20,20,20))

RGB <- c(70,30,30) # blackish
rasterList_lanRGB_L_rhodopareia2 <- patLanRGB(L_rhodopareiaI[c(11)], L_rhodopareiaL[c(11)], RGB, transformRef = refShape$mshape,
                                             colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                             cropOffset = c(20,20,20,20))

rasterList_lanRGB_L_rhodopareia <- c(rasterList_lanRGB_L_rhodopareia1,rasterList_lanRGB_L_rhodopareia2)

# save(rasterList_lanRGB_L_rhodopareia, file="output/rasterList_lanRGB_L_rhodopareia_95_35_35.rda")

# Broad-tailed Paradise Whydah
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_V_obtusa <- patLanRGB(V_obtusaI, V_obtusaL, RGB, transformRef = refShape$mshape, 
                                              colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                              cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_V_obtusa, file="output/rasterList_lanRGB_V_obtusa_95_35_35.rda")

# Orange-winged Pytilia
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_P_afra <- patLanRGB(P_afraI, P_afraL, RGB, transformRef = refShape$mshape, 
                                              colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                              cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_P_afra, file="output/rasterList_lanRGB_P_afra_95_35_35.rda")

# Zebra Waxbill
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_A_subflava <- patLanRGB(A_subflavaI, A_subflavaL, RGB, transformRef = refShape$mshape, 
                                      colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                      cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_A_subflava, file="output/rasterList_lanRGB_A_subflava_95_35_35.rda")

# Red-billed Firefinch
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_L_senegala <- patLanRGB(L_senegalaI, L_senegalaL, RGB, transformRef = refShape$mshape, 
                                          colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                          cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_L_senegala, file="output/rasterList_lanRGB_L_senegala_95_35_35.rda")

# Africa Quailfinch
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_O_atricollis <- patLanRGB(O_atricollisI, O_atricollisL, RGB, transformRef = refShape$mshape, 
                                          colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                          cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_O_atricollis, file="output/rasterList_lanRGB_O_atricollis_95_35_35.rda")

# Locust Finch
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_P_locustella <- patLanRGB(P_locustellaI, P_locustellaL, RGB, transformRef = refShape$mshape, 
                                            colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                            cropOffset = c(20,20,20,20))

# save(rasterList_lanRGB_P_locustella, file="output/rasterList_lanRGB_P_locustella_95_35_35.rda")

# Melba finch
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_P_melba1 <- patLanRGB(P_melbaI[c(1:6)], P_melbaL[c(1:6)], RGB, transformRef = refShape$mshape, 
                                            colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                            cropOffset = c(20,20,20,20))

RGB <- c(70,30,30) # blackish
rasterList_lanRGB_P_melba2 <- patLanRGB(P_melbaI[c(7)], P_melbaL[c(7)], RGB, transformRef = refShape$mshape, 
                                       colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                       cropOffset = c(20,20,20,20))

rasterList_lanRGB_P_melba <- c(rasterList_lanRGB_P_melba1,rasterList_lanRGB_P_melba2)

# save(rasterList_lanRGB_P_melba, file="output/rasterList_lanRGB_P_melba_95_35_35.rda")

# Bronze Mannikin
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_S_cucullatus1 <- patLanRGB(S_cucullatusI[c(1:3)], S_cucullatusL[c(1:3)], RGB, transformRef = refShape$mshape, 
                                            colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                            cropOffset = c(20,20,20,20))

RGB <- c(70,30,30) # blackish
rasterList_lanRGB_S_cucullatus2 <- patLanRGB(S_cucullatusI[c(4:8)], S_cucullatusL[c(4:8)], RGB, transformRef = refShape$mshape, 
                                            colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                            cropOffset = c(20,20,20,20))

rasterList_lanRGB_S_cucullatus <- c(rasterList_lanRGB_S_cucullatus1,rasterList_lanRGB_S_cucullatus2)

# save(rasterList_lanRGB_S_cucullatus, file="output/rasterList_lanRGB_S_cucullatus_95_35_35.rda")

# Blue Waxbill
RGB <- c(95,35,35) # blackish
rasterList_lanRGB_U_angolensis1 <- patLanRGB(U_angolensisI[c(1:8)], U_angolensisL[c(1:8)], RGB, transformRef = refShape$mshape, 
                                            colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                            cropOffset = c(20,20,20,20))

RGB <- c(70,30,30) # blackish
rasterList_lanRGB_U_angolensis2 <- patLanRGB(U_angolensisI[c(9)], U_angolensisL[c(9)], RGB, transformRef = refShape$mshape, 
                                             colOffset = 0.25, crop = TRUE, res = 200, adjustCoords = TRUE, plot = 'stack',
                                             cropOffset = c(20,20,20,20))

rasterList_lanRGB_U_angolensis <- c(rasterList_lanRGB_U_angolensis1,rasterList_lanRGB_U_angolensis2)

save(rasterList_lanRGB_U_angolensis, file="output/rasterList_lanRGB_U_angolensis_95_35_35.rda")

#####################################
# Plotting
#####################################

# load previously saved output
load("output/rasterList_lanRGB_E_astrild_95_35_35.rda")
load("output/rasterList_lanRGB_V_macroura_95_35_35.rda")
load("output/rasterList_lanRGB_V_purpurascens_95_35_35.rda")
load("output/rasterList_lanRGB_L_rhodopareia_95_35_35.rda")
load("output/rasterList_lanRGB_V_obtusa_95_35_35.rda")
load("output/rasterList_lanRGB_P_afra_95_35_35.rda")
load("output/rasterList_lanRGB_A_subflava_95_35_35.rda")
load("output/rasterList_lanRGB_L_senegala_95_35_35.rda")
load("output/rasterList_lanRGB_O_atricollis_95_35_35.rda")
load("output/rasterList_lanRGB_P_locustella_95_35_35.rda")
load("output/rasterList_lanRGB_P_melba_95_35_35.rda")
load("output/rasterList_lanRGB_S_cucullatus_95_35_35.rda")
load("output/rasterList_lanRGB_U_angolensis_95_35_35.rda")


# sum rasters
summedRaster_lanRGB_E_astrild <- sumRaster(rasterList_lanRGB_E_astrild, E_astrild, type = 'RGB')
summedRaster_lanRGB_V_macroura <- sumRaster(rasterList_lanRGB_V_macroura, V_macroura, type = 'RGB')
summedRaster_lanRGB_V_purpurascens <- sumRaster(rasterList_lanRGB_V_purpurascens, V_purpurascens, type = 'RGB')
summedRaster_lanRGB_L_rhodopareia <- sumRaster(rasterList_lanRGB_L_rhodopareia, L_rhodopareia, type = 'RGB')
summedRaster_lanRGB_V_obtusa <- rasterList_lanRGB_V_obtusa
summedRaster_lanRGB_P_afra <- sumRaster(rasterList_lanRGB_P_afra, P_afra, type = 'RGB')
summedRaster_lanRGB_A_subflava <- sumRaster(rasterList_lanRGB_A_subflava, A_subflava, type = 'RGB')
summedRaster_lanRGB_L_senegala <- sumRaster(rasterList_lanRGB_L_senegala, L_senegala, type = 'RGB')
summedRaster_lanRGB_O_atricollis <- sumRaster(rasterList_lanRGB_O_atricollis, O_atricollis, type = 'RGB')
summedRaster_lanRGB_P_locustella <- sumRaster(rasterList_lanRGB_P_locustella, P_locustella, type = 'RGB')
summedRaster_lanRGB_P_melba <- sumRaster(rasterList_lanRGB_P_melba, P_melba, type = 'RGB')
summedRaster_lanRGB_S_cucullatus <- sumRaster(rasterList_lanRGB_S_cucullatus, S_cucullatus, type = 'RGB')
summedRaster_lanRGB_U_angolensis <- sumRaster(rasterList_lanRGB_U_angolensis, U_angolensis, type = 'RGB')



# outline
DSC_0170_outline <- read.table('images/DSC_0170_outline.txt', header = FALSE)
DSC_1223_outline <- read.table('images/DSC_1223_outline.txt', header = FALSE)
DSC_8331_outline <- read.table('images/DSC_8331_outline.txt', header = FALSE)
DSC_6418_outline <- read.table('images/DSC_6418_outline.txt', header = FALSE)
DSC_0006_outline <- read.table('images/DSC_0006_outline.txt', header = FALSE)
DSC_0660_outline <- read.table('images/DSC_0660_outline.txt', header = FALSE)
DSC_9638_outline <- read.table('images/DSC_9638_outline.txt', header = FALSE)
DSC_0603_outline <- read.table('images/DSC_0603_outline.txt', header = FALSE)
DSC_6116_outline <- read.table('images/DSC_6116_outline.txt', header = FALSE)
DSC_5999_outline <- read.table('images/DSC_5999_outline.txt', header = FALSE)

# plot raw
plotHeat(summedRaster_lanRGB_E_astrild, E_astrild, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0170_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0170', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_V_macroura, V_macroura, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0170_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0170', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_V_purpurascens, V_purpurascens, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_1223_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_1223', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_L_rhodopareia, L_rhodopareia, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_1223_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_1223', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_V_obtusa, V_obtusa, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_1223_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_1223', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_P_afra, P_afra, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_1223_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_1223', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_A_subflava, A_subflava, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_6418_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_6418', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_L_senegala, L_senegala, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0006_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0006', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_O_atricollis, O_atricollis, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0660_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0660', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_P_locustella, P_locustella, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_9638_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_9638', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_P_melba, P_melba, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0603_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0603', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_S_cucullatus, S_cucullatus, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_6116_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_6116', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)

plotHeat(summedRaster_lanRGB_U_angolensis, U_angolensis, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_5999_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_5999', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)



# add mask
DSC_0170_mask <- read.table('images/DSC_0170_mask.txt', header = FALSE)
summedRaster_lanRGB_E_astrild_m <- maskOutline(summedRaster_lanRGB_E_astrild, IDlist = ALL_ID, DSC_0170_mask, 
                                               refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                               landList = ALL_lList, adjustCoords = TRUE)

DSC_0170_mask <- read.table('images/DSC_0170_maskb.txt', header = FALSE)
summedRaster_lanRGB_V_macroura_m <- maskOutline(summedRaster_lanRGB_V_macroura, IDlist = ALL_ID, DSC_0170_mask, 
                                                refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                landList = ALL_lList, adjustCoords = TRUE)

DSC_0726_mask <- read.table('images/DSC_0726_mask.txt', header = FALSE)
summedRaster_lanRGB_V_purpurascens_m <- maskOutline(summedRaster_lanRGB_V_purpurascens, IDlist = ALL_ID, DSC_0726_mask, 
                                                    refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                    landList = ALL_lList, adjustCoords = TRUE)

DSC_0726_mask <- read.table('images/DSC_0726_mask.txt', header = FALSE)
summedRaster_lanRGB_L_rhodopareia_m <- maskOutline(summedRaster_lanRGB_L_rhodopareia, IDlist = ALL_ID, DSC_0726_mask, 
                                                   refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                   landList = ALL_lList, adjustCoords = TRUE)

DSC_0099_mask <- read.table('images/DSC_0099_mask.txt', header = FALSE)
summedRaster_lanRGB_V_obtusa_m <- maskOutline(summedRaster_lanRGB_V_obtusa$DSC_0054, IDlist = ALL_ID, DSC_0099_mask, 
                                                   refShape = 'mean', cartoonID = 'DSC_0099', imageList = ALL_iList, 
                                                   landList = ALL_lList, adjustCoords = TRUE)

DSC_0726_mask <- read.table('images/DSC_0099_mask.txt', header = FALSE)
summedRaster_lanRGB_P_afra_m <- maskOutline(summedRaster_lanRGB_P_afra, IDlist = ALL_ID, DSC_0099_mask, 
                                                   refShape = 'mean', cartoonID = 'DSC_0099', imageList = ALL_iList, 
                                                   landList = ALL_lList, adjustCoords = TRUE)

DSC_6418_mask <- read.table('images/DSC_6418_mask.txt', header = FALSE)
summedRaster_lanRGB_A_subflava_m <- maskOutline(summedRaster_lanRGB_A_subflava, IDlist = ALL_ID, DSC_6418_mask, 
                                            refShape = 'mean', cartoonID = 'DSC_6418', imageList = ALL_iList, 
                                            landList = ALL_lList, adjustCoords = TRUE)

DSC_0006_mask <- read.table('images/DSC_0006_mask.txt', header = FALSE)
summedRaster_lanRGB_L_senegala_m <- maskOutline(summedRaster_lanRGB_L_senegala, IDlist = ALL_ID, DSC_0006_mask, 
                                                refShape = 'mean', cartoonID = 'DSC_0006', imageList = ALL_iList, 
                                                landList = ALL_lList, adjustCoords = TRUE)

DSC_1246_mask <- read.table('images/DSC_1246_mask.txt', header = FALSE)
summedRaster_lanRGB_O_atricollis_m <- maskOutline(summedRaster_lanRGB_O_atricollis, IDlist = ALL_ID, DSC_1246_mask, 
                                                refShape = 'mean', cartoonID = 'DSC_1246', imageList = ALL_iList, 
                                                landList = ALL_lList, adjustCoords = TRUE)

DSC_9587_mask <- read.table('images/DSC_9587_mask.txt', header = FALSE)
summedRaster_lanRGB_P_locustella_m <- maskOutline(summedRaster_lanRGB_P_locustella, IDlist = ALL_ID, DSC_9587_mask, 
                                                  refShape = 'mean', cartoonID = 'DSC_9587', imageList = ALL_iList, 
                                                  landList = ALL_lList, adjustCoords = TRUE)

DSC_0603_mask <- read.table('images/DSC_0603_mask.txt', header = FALSE)
summedRaster_lanRGB_P_melba_m <- maskOutline(summedRaster_lanRGB_P_melba, IDlist = ALL_ID, DSC_0603_mask, 
                                                  refShape = 'mean', cartoonID = 'DSC_0603', imageList = ALL_iList, 
                                                  landList = ALL_lList, adjustCoords = TRUE)

DSC_6116_mask <- read.table('images/DSC_6116_mask.txt', header = FALSE)
summedRaster_lanRGB_S_cucullatus_m <- maskOutline(summedRaster_lanRGB_S_cucullatus, IDlist = ALL_ID, DSC_6116_mask, 
                                             refShape = 'mean', cartoonID = 'DSC_6116', imageList = ALL_iList, 
                                             landList = ALL_lList, adjustCoords = TRUE)

DSC_5999_mask <- read.table('images/DSC_5999_mask.txt', header = FALSE)
summedRaster_lanRGB_U_angolensis_m <- maskOutline(summedRaster_lanRGB_U_angolensis, IDlist = ALL_ID, DSC_5999_mask, 
                                                  refShape = 'mean', cartoonID = 'DSC_5999', imageList = ALL_iList, 
                                                  landList = ALL_lList, adjustCoords = TRUE)



# plot masked

colfunc <- inferno(100)

pdf("figures/E_astrild.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_E_astrild_m, E_astrild, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0170_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0170', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/V_macroura.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_V_macroura_m, V_macroura, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0170_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0170', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/V_purpurascens.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_V_purpurascens_m, V_purpurascens, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_1223_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_1223', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/L_rhodopareia.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_L_rhodopareia_m, L_rhodopareia, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_1223_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_1223', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/V_obtusa.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_V_obtusa_m, V_obtusa, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_8331_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_8331', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/P_afra.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_P_afra_m, P_afra, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_8331_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_8331', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/A_subflava.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_A_subflava_m, A_subflava, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_6418_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_6418', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/L_senegala.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_L_senegala_m, L_senegala, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0006_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0006', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/O_atricollis.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_O_atricollis_m, O_atricollis, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0660_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0660', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/P_locustella.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_P_locustella_m, P_locustella, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_9638_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_9638', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/P_melba.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_P_melba_m, P_melba, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0603_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0603', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/S_cucullatus.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_S_cucullatus_m, S_cucullatus, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_6116_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_6116', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()

pdf("figures/U_angolensis.pdf",width=7,height=5) 
plotHeat(summedRaster_lanRGB_U_angolensis_m, U_angolensis, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_5999_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_5999', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc)
dev.off()


# Plot differences
colfunc <- c("blue","lightblue","black","pink","red")


E_astrild_V_macroura <- summedRaster_lanRGB_E_astrild_m/length(E_astrild) - summedRaster_lanRGB_V_macroura_m/length(V_macroura)

pdf("figures/E_astrild_V_macroura.pdf",width=7,height=5)
plotHeat(E_astrild_V_macroura, ALL_ID, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_0170_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_0170', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc, zlim = c(-1,1), normalized = TRUE)
dev.off()

V_purpurascens_L_rhodopareia <- summedRaster_lanRGB_V_purpurascens_m/length(V_purpurascens) - summedRaster_lanRGB_L_rhodopareia_m/length(L_rhodopareia)

pdf("figures/V_purpurascens_L_rhodopareia.pdf",width=7,height=5)
plotHeat(V_purpurascens_L_rhodopareia, ALL_ID, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_1223_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_1223', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc, zlim = c(-1,1), normalized = TRUE)
dev.off()

V_obtusa_P_afra <- summedRaster_lanRGB_V_obtusa_m/length(V_obtusa) - summedRaster_lanRGB_P_afra_m/length(P_afra )

pdf("figures/V_obtusa_P_afra .pdf",width=7,height=5)
plotHeat(V_obtusa_P_afra , ALL_ID, plotCartoon = TRUE, refShape = 'mean', 
         outline = DSC_8331_outline, landList = ALL_lList, adjustCoords = TRUE, imageList = ALL_iList, 
         cartoonID = 'DSC_8331', cartoonFill = 'black', cartoonOrder = 'under', colpalette = colfunc, zlim = c(-1,1), normalized = TRUE)
dev.off()



#####################################
# Mask rasterLists and area calculation
#####################################

#E_astrild

DSC_0170_mask <- read.table('images/DSC_0170_mask.txt', header = FALSE)
rasterList_lanRGB_E_astrild_M <-list()
for(e in 1:length(rasterList_lanRGB_E_astrild)){
  ID <- names(rasterList_lanRGB_E_astrild)[[e]]
  rasterList_lanRGB_E_astrild_M[[ID]] <- maskOutline(rasterList_lanRGB_E_astrild[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                     refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                     landList = ALL_lList, adjustCoords = TRUE)
}

E_astrild_T <- patArea(rasterList_lanRGB_E_astrild_M, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                       outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                       imageList = ALL_iList, cartoonID = 'DSC_0170')

DSC_0170_mask <- read.table('images/DSC_0170_mask_tp.txt', header = FALSE)
rasterList_lanRGB_E_astrild_M_tp <-list()
for(e in 1:length(rasterList_lanRGB_E_astrild)){
  ID <- names(rasterList_lanRGB_E_astrild)[[e]]
  rasterList_lanRGB_E_astrild_M_tp[[ID]] <- maskOutline(rasterList_lanRGB_E_astrild[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                        refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                        landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_E_astrild_M_tp, E_astrild, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, E_astrild)

E_astrild_Tp <- patArea(rasterList_lanRGB_E_astrild_M_tp, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')

DSC_0170_mask <- read.table('images/DSC_0170_mask_S.txt', header = FALSE)
rasterList_lanRGB_E_astrild_M_S <-list()
for(e in 1:length(rasterList_lanRGB_E_astrild)){
  ID <- names(rasterList_lanRGB_E_astrild)[[e]]
  rasterList_lanRGB_E_astrild_M_S[[ID]] <- maskOutline(rasterList_lanRGB_E_astrild[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                       refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                       landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_E_astrild_M_S, E_astrild, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, E_astrild)

E_astrild_S <- patArea(rasterList_lanRGB_E_astrild_M_S, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                       outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                       imageList = ALL_iList, cartoonID = 'DSC_0170')

DSC_0170_mask <- read.table('images/DSC_0170_mask_S1.txt', header = FALSE)
rasterList_lanRGB_E_astrild_M_S1 <-list()
for(e in 1:length(rasterList_lanRGB_E_astrild)){
  ID <- names(rasterList_lanRGB_E_astrild)[[e]]
  rasterList_lanRGB_E_astrild_M_S1[[ID]] <- maskOutline(rasterList_lanRGB_E_astrild[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                       refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                       landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_E_astrild_M_S1, E_astrild, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, E_astrild)

E_astrild_S1 <- patArea(rasterList_lanRGB_E_astrild_M_S1, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                       outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                       imageList = ALL_iList, cartoonID = 'DSC_0170')

DSC_0170_mask <- read.table('images/DSC_0170_mask_S2.txt', header = FALSE)
rasterList_lanRGB_E_astrild_M_S2 <-list()
for(e in 1:length(rasterList_lanRGB_E_astrild)){
  ID <- names(rasterList_lanRGB_E_astrild)[[e]]
  rasterList_lanRGB_E_astrild_M_S2[[ID]] <- maskOutline(rasterList_lanRGB_E_astrild[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                        refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                        landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_E_astrild_M_S2, E_astrild, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, E_astrild)

E_astrild_S2 <- patArea(rasterList_lanRGB_E_astrild_M_S2, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                       outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                       imageList = ALL_iList, cartoonID = 'DSC_0170')

DSC_0170_mask <- read.table('images/DSC_0170_mask_S3.txt', header = FALSE)
rasterList_lanRGB_E_astrild_M_S3 <-list()
for(e in 1:length(rasterList_lanRGB_E_astrild)){
  ID <- names(rasterList_lanRGB_E_astrild)[[e]]
  rasterList_lanRGB_E_astrild_M_S3[[ID]] <- maskOutline(rasterList_lanRGB_E_astrild[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                        refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                        landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_E_astrild_M_S3, E_astrild, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, E_astrild)

E_astrild_S3 <- patArea(rasterList_lanRGB_E_astrild_M_S3, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')

DSC_0170_mask <- read.table('images/DSC_0170_mask_S4.txt', header = FALSE)
rasterList_lanRGB_E_astrild_M_S4 <-list()
for(e in 1:length(rasterList_lanRGB_E_astrild)){
  ID <- names(rasterList_lanRGB_E_astrild)[[e]]
  rasterList_lanRGB_E_astrild_M_S4[[ID]] <- maskOutline(rasterList_lanRGB_E_astrild[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                        refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                        landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_E_astrild_M_S4, E_astrild, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, E_astrild)

E_astrild_S4 <- patArea(rasterList_lanRGB_E_astrild_M_S4, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')

DSC_0170_mask <- read.table('images/DSC_0170_mask_S5.txt', header = FALSE)
rasterList_lanRGB_E_astrild_M_S5 <-list()
for(e in 1:length(rasterList_lanRGB_E_astrild)){
  ID <- names(rasterList_lanRGB_E_astrild)[[e]]
  rasterList_lanRGB_E_astrild_M_S5[[ID]] <- maskOutline(rasterList_lanRGB_E_astrild[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                        refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                        landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_E_astrild_M_S5, E_astrild, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, E_astrild)

E_astrild_S5 <- patArea(rasterList_lanRGB_E_astrild_M_S5, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')
###

# V_macroura

DSC_0170_mask <- read.table('images/DSC_0170_maskb.txt', header = FALSE)
rasterList_lanRGB_V_macroura_M <-list()
for(e in 1:length(rasterList_lanRGB_V_macroura)){
  ID <- names(rasterList_lanRGB_V_macroura)[[e]]
  rasterList_lanRGB_V_macroura_M[[ID]] <- maskOutline(rasterList_lanRGB_V_macroura[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                      refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                      landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_macroura_M, V_macroura, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_macroura)

V_macroura_T <- patArea(rasterList_lanRGB_V_macroura_M, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')


DSC_0170_mask <- read.table('images/DSC_0170_mask_tp.txt', header = FALSE)
rasterList_lanRGB_V_macroura_M_tp <-list()
for(e in 1:length(rasterList_lanRGB_V_macroura)){
  ID <- names(rasterList_lanRGB_V_macroura)[[e]]
  rasterList_lanRGB_V_macroura_M_tp[[ID]] <- maskOutline(rasterList_lanRGB_V_macroura[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                      refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                      landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_macroura_M_tp, V_macroura, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_macroura)

V_macroura_T <- patArea(rasterList_lanRGB_V_macroura_M_tp, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')


DSC_0170_mask <- read.table('images/DSC_0170_mask_Sb.txt', header = FALSE)
rasterList_lanRGB_V_macroura_M_S <-list()
for(e in 1:length(rasterList_lanRGB_V_macroura)){
  ID <- names(rasterList_lanRGB_V_macroura)[[e]]
  rasterList_lanRGB_V_macroura_M_S[[ID]] <- maskOutline(rasterList_lanRGB_V_macroura[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                         refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                         landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_macroura_M_S, V_macroura, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_macroura)

V_macroura_T <- patArea(rasterList_lanRGB_V_macroura_M_S, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')


DSC_0170_mask <- read.table('images/DSC_0170_mask_S1b.txt', header = FALSE)
rasterList_lanRGB_V_macroura_M_S1 <-list()
for(e in 1:length(rasterList_lanRGB_V_macroura)){
  ID <- names(rasterList_lanRGB_V_macroura)[[e]]
  rasterList_lanRGB_V_macroura_M_S1[[ID]] <- maskOutline(rasterList_lanRGB_V_macroura[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                        refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                        landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_macroura_M_S1, V_macroura, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_macroura)

V_macroura_T <- patArea(rasterList_lanRGB_V_macroura_M_S1, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')


DSC_0170_mask <- read.table('images/DSC_0170_mask_S2b.txt', header = FALSE)
rasterList_lanRGB_V_macroura_M_S2 <-list()
for(e in 1:length(rasterList_lanRGB_V_macroura)){
  ID <- names(rasterList_lanRGB_V_macroura)[[e]]
  rasterList_lanRGB_V_macroura_M_S2[[ID]] <- maskOutline(rasterList_lanRGB_V_macroura[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                         refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                         landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_macroura_M_S2, V_macroura, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_macroura)

V_macroura_T <- patArea(rasterList_lanRGB_V_macroura_M_S2, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')


DSC_0170_mask <- read.table('images/DSC_0170_mask_S3b.txt', header = FALSE)
rasterList_lanRGB_V_macroura_M_S3 <-list()
for(e in 1:length(rasterList_lanRGB_V_macroura)){
  ID <- names(rasterList_lanRGB_V_macroura)[[e]]
  rasterList_lanRGB_V_macroura_M_S3[[ID]] <- maskOutline(rasterList_lanRGB_V_macroura[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                         refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                         landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_macroura_M_S3, V_macroura, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_macroura)

V_macroura_T <- patArea(rasterList_lanRGB_V_macroura_M_S3, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')


DSC_0170_mask <- read.table('images/DSC_0170_mask_S4b.txt', header = FALSE)
rasterList_lanRGB_V_macroura_M_S4 <-list()
for(e in 1:length(rasterList_lanRGB_V_macroura)){
  ID <- names(rasterList_lanRGB_V_macroura)[[e]]
  rasterList_lanRGB_V_macroura_M_S4[[ID]] <- maskOutline(rasterList_lanRGB_V_macroura[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                         refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                         landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_macroura_M_S4, V_macroura, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_macroura)

V_macroura_T <- patArea(rasterList_lanRGB_V_macroura_M_S4, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')


DSC_0170_mask <- read.table('images/DSC_0170_mask_S5b.txt', header = FALSE)
rasterList_lanRGB_V_macroura_M_S5 <-list()
for(e in 1:length(rasterList_lanRGB_V_macroura)){
  ID <- names(rasterList_lanRGB_V_macroura)[[e]]
  rasterList_lanRGB_V_macroura_M_S5[[ID]] <- maskOutline(rasterList_lanRGB_V_macroura[[ID]], IDlist = ALL_ID, DSC_0170_mask, 
                                                         refShape = 'mean', cartoonID = 'DSC_0170', imageList = ALL_iList, 
                                                         landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_macroura_M_S5, V_macroura, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_macroura)

V_macroura_T <- patArea(rasterList_lanRGB_V_macroura_M_S5, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                        outline = DSC_0170_outline, adjustCoords = TRUE, landList = ALL_lList,
                        imageList = ALL_iList, cartoonID = 'DSC_0170')


###

# V purpurascens

DSC_0726_mask <- read.table('images/DSC_0726_mask.txt', header = FALSE)
rasterList_lanRGB_V_purpurascens_M <-list()
for(e in 1:length(rasterList_lanRGB_V_purpurascens)){
  ID <- names(rasterList_lanRGB_V_purpurascens)[[e]]
  rasterList_lanRGB_V_purpurascens_M[[ID]] <- maskOutline(rasterList_lanRGB_V_purpurascens[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                          refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                          landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_purpurascens_M, V_purpurascens, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_purpurascens)

V_purpurascens_T <- patArea(rasterList_lanRGB_V_purpurascens_M, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                            outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                            imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_tp.txt', header = FALSE)
rasterList_lanRGB_V_purpurascens_M_tp <-list()
for(e in 1:length(rasterList_lanRGB_V_purpurascens)){
  ID <- names(rasterList_lanRGB_V_purpurascens)[[e]]
  rasterList_lanRGB_V_purpurascens_M_tp[[ID]] <- maskOutline(rasterList_lanRGB_V_purpurascens[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                          refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                          landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_purpurascens_M_tp, V_purpurascens, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_purpurascens)

V_purpurascens_T <- patArea(rasterList_lanRGB_V_purpurascens_M_tp, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                            outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                            imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S.txt', header = FALSE)
rasterList_lanRGB_V_purpurascens_M_S <-list()
for(e in 1:length(rasterList_lanRGB_V_purpurascens)){
  ID <- names(rasterList_lanRGB_V_purpurascens)[[e]]
  rasterList_lanRGB_V_purpurascens_M_S[[ID]] <- maskOutline(rasterList_lanRGB_V_purpurascens[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                             refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                             landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_purpurascens_M_S, V_purpurascens, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_purpurascens)

V_purpurascens_T <- patArea(rasterList_lanRGB_V_purpurascens_M_S, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                            outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                            imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S1.txt', header = FALSE)
rasterList_lanRGB_V_purpurascens_M_S1 <-list()
for(e in 1:length(rasterList_lanRGB_V_purpurascens)){
  ID <- names(rasterList_lanRGB_V_purpurascens)[[e]]
  rasterList_lanRGB_V_purpurascens_M_S1[[ID]] <- maskOutline(rasterList_lanRGB_V_purpurascens[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                            refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                            landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_purpurascens_M_S1, V_purpurascens, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_purpurascens)

V_purpurascens_T <- patArea(rasterList_lanRGB_V_purpurascens_M_S1, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                            outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                            imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S2.txt', header = FALSE)
rasterList_lanRGB_V_purpurascens_M_S2 <-list()
for(e in 1:length(rasterList_lanRGB_V_purpurascens)){
  ID <- names(rasterList_lanRGB_V_purpurascens)[[e]]
  rasterList_lanRGB_V_purpurascens_M_S2[[ID]] <- maskOutline(rasterList_lanRGB_V_purpurascens[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                             refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                             landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_purpurascens_M_S2, V_purpurascens, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_purpurascens)

V_purpurascens_T <- patArea(rasterList_lanRGB_V_purpurascens_M_S2, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                            outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                            imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S3.txt', header = FALSE)
rasterList_lanRGB_V_purpurascens_M_S3 <-list()
for(e in 1:length(rasterList_lanRGB_V_purpurascens)){
  ID <- names(rasterList_lanRGB_V_purpurascens)[[e]]
  rasterList_lanRGB_V_purpurascens_M_S3[[ID]] <- maskOutline(rasterList_lanRGB_V_purpurascens[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                             refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                             landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_purpurascens_M_S3, V_purpurascens, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_purpurascens)

V_purpurascens_T <- patArea(rasterList_lanRGB_V_purpurascens_M_S3, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                            outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                            imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S4.txt', header = FALSE)
rasterList_lanRGB_V_purpurascens_M_S4 <-list()
for(e in 1:length(rasterList_lanRGB_V_purpurascens)){
  ID <- names(rasterList_lanRGB_V_purpurascens)[[e]]
  rasterList_lanRGB_V_purpurascens_M_S4[[ID]] <- maskOutline(rasterList_lanRGB_V_purpurascens[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                             refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                             landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_purpurascens_M_S4, V_purpurascens, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_purpurascens)

V_purpurascens_T <- patArea(rasterList_lanRGB_V_purpurascens_M_S4, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                            outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                            imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S5.txt', header = FALSE)
rasterList_lanRGB_V_purpurascens_M_S5 <-list()
for(e in 1:length(rasterList_lanRGB_V_purpurascens)){
  ID <- names(rasterList_lanRGB_V_purpurascens)[[e]]
  rasterList_lanRGB_V_purpurascens_M_S5[[ID]] <- maskOutline(rasterList_lanRGB_V_purpurascens[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                             refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                             landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_purpurascens_M_S5, V_purpurascens, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, V_purpurascens)

V_purpurascens_T <- patArea(rasterList_lanRGB_V_purpurascens_M_S5, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                            outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                            imageList = ALL_iList, cartoonID = 'DSC_1223')

###

# L rhodopareia

DSC_0726_mask <- read.table('images/DSC_0726_mask.txt', header = FALSE)
rasterList_lanRGB_L_rhodopareia_M <-list()
for(e in 1:length(rasterList_lanRGB_L_rhodopareia)){
  ID <- names(rasterList_lanRGB_L_rhodopareia)[[e]]
  rasterList_lanRGB_L_rhodopareia_M[[ID]] <- maskOutline(rasterList_lanRGB_L_rhodopareia[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                         refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                         landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_L_rhodopareia_M, L_rhodopareia, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, L_rhodopareia)

L_rhodopareia_T <- patArea(rasterList_lanRGB_L_rhodopareia_M, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_tp.txt', header = FALSE)
rasterList_lanRGB_L_rhodopareia_M_tp <-list()
for(e in 1:length(rasterList_lanRGB_L_rhodopareia)){
  ID <- names(rasterList_lanRGB_L_rhodopareia)[[e]]
  rasterList_lanRGB_L_rhodopareia_M_tp[[ID]] <- maskOutline(rasterList_lanRGB_L_rhodopareia[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                         refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                         landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_L_rhodopareia_M_tp, L_rhodopareia, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, L_rhodopareia)

L_rhodopareia_T <- patArea(rasterList_lanRGB_L_rhodopareia_M_tp, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S.txt', header = FALSE)
rasterList_lanRGB_L_rhodopareia_M_S <-list()
for(e in 1:length(rasterList_lanRGB_L_rhodopareia)){
  ID <- names(rasterList_lanRGB_L_rhodopareia)[[e]]
  rasterList_lanRGB_L_rhodopareia_M_S[[ID]] <- maskOutline(rasterList_lanRGB_L_rhodopareia[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                            refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                            landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_L_rhodopareia_M_S, L_rhodopareia, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, L_rhodopareia)

L_rhodopareia_T <- patArea(rasterList_lanRGB_L_rhodopareia_M_S, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S1.txt', header = FALSE)
rasterList_lanRGB_L_rhodopareia_M_S1 <-list()
for(e in 1:length(rasterList_lanRGB_L_rhodopareia)){
  ID <- names(rasterList_lanRGB_L_rhodopareia)[[e]]
  rasterList_lanRGB_L_rhodopareia_M_S1[[ID]] <- maskOutline(rasterList_lanRGB_L_rhodopareia[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                           refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                           landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_L_rhodopareia_M_S1, L_rhodopareia, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, L_rhodopareia)

L_rhodopareia_T <- patArea(rasterList_lanRGB_L_rhodopareia_M_S1, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S2.txt', header = FALSE)
rasterList_lanRGB_L_rhodopareia_M_S2 <-list()
for(e in 1:length(rasterList_lanRGB_L_rhodopareia)){
  ID <- names(rasterList_lanRGB_L_rhodopareia)[[e]]
  rasterList_lanRGB_L_rhodopareia_M_S2[[ID]] <- maskOutline(rasterList_lanRGB_L_rhodopareia[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                            refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                            landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_L_rhodopareia_M_S2, L_rhodopareia, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, L_rhodopareia)

L_rhodopareia_T <- patArea(rasterList_lanRGB_L_rhodopareia_M_S2, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S3.txt', header = FALSE)
rasterList_lanRGB_L_rhodopareia_M_S3 <-list()
for(e in 1:length(rasterList_lanRGB_L_rhodopareia)){
  ID <- names(rasterList_lanRGB_L_rhodopareia)[[e]]
  rasterList_lanRGB_L_rhodopareia_M_S3[[ID]] <- maskOutline(rasterList_lanRGB_L_rhodopareia[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                            refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                            landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_L_rhodopareia_M_S3, L_rhodopareia, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, L_rhodopareia)

L_rhodopareia_T <- patArea(rasterList_lanRGB_L_rhodopareia_M_S3, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S4b.txt', header = FALSE)
rasterList_lanRGB_L_rhodopareia_M_S4 <-list()
for(e in 1:length(rasterList_lanRGB_L_rhodopareia)){
  ID <- names(rasterList_lanRGB_L_rhodopareia)[[e]]
  rasterList_lanRGB_L_rhodopareia_M_S4[[ID]] <- maskOutline(rasterList_lanRGB_L_rhodopareia[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                            refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                            landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_L_rhodopareia_M_S4, L_rhodopareia, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, L_rhodopareia)

L_rhodopareia_T <- patArea(rasterList_lanRGB_L_rhodopareia_M_S4, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_1223')


DSC_0726_mask <- read.table('images/DSC_0726_mask_S5b.txt', header = FALSE)
rasterList_lanRGB_L_rhodopareia_M_S5 <-list()
for(e in 1:length(rasterList_lanRGB_L_rhodopareia)){
  ID <- names(rasterList_lanRGB_L_rhodopareia)[[e]]
  rasterList_lanRGB_L_rhodopareia_M_S5[[ID]] <- maskOutline(rasterList_lanRGB_L_rhodopareia[[ID]], IDlist = ALL_ID, DSC_0726_mask, 
                                                            refShape = 'mean', cartoonID = 'DSC_0726', imageList = ALL_iList, 
                                                            landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_L_rhodopareia_M_S5, L_rhodopareia, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, L_rhodopareia)

L_rhodopareia_T <- patArea(rasterList_lanRGB_L_rhodopareia_M_S5, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_1223_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_1223')

###

# V_obtusa

DSC_0099_mask <- read.table('images/DSC_0099_mask.txt', header = FALSE)
rasterList_lanRGB_V_obtusa_M <-list()
for(e in 1:length(rasterList_lanRGB_V_obtusa)){
  ID <- names(rasterList_lanRGB_V_obtusa)[[e]]
  rasterList_lanRGB_V_obtusa_M[[ID]] <- maskOutline(rasterList_lanRGB_V_obtusa[[ID]], IDlist = ALL_ID, DSC_0099_mask, 
                                                            refShape = 'mean', cartoonID = 'DSC_0099', imageList = ALL_iList, 
                                                            landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_V_obtusa_M, V_obtusa, type = 'RGB')
plotHeat(rasterList_lanRGB_V_obtusa_M, V_obtusa)

L_rhodopareia_T <- patArea(rasterList_lanRGB_V_obtusa_M, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_8331_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_8331')

###

# P_afra

DSC_0099_mask <- read.table('images/DSC_0099_mask.txt', header = FALSE)
rasterList_lanRGB_P_afra_M <-list()
for(e in 1:length(rasterList_lanRGB_P_afra)){
  ID <- names(rasterList_lanRGB_P_afra)[[e]]
  rasterList_lanRGB_P_afra_M[[ID]] <- maskOutline(rasterList_lanRGB_P_afra[[ID]], IDlist = ALL_ID, DSC_0099_mask, 
                                                    refShape = 'mean', cartoonID = 'DSC_0099', imageList = ALL_iList, 
                                                    landList = ALL_lList, adjustCoords = TRUE)
}

summedRaster_lanRGB_E_astrild_test <- sumRaster(rasterList_lanRGB_P_afra_M, P_afra, type = 'RGB')
plotHeat(summedRaster_lanRGB_E_astrild_test, P_afra)

L_rhodopareia_T <- patArea(rasterList_lanRGB_P_afra_M, ALL_ID, refShape = refShape$mshape, type = 'RGB', 
                           outline = DSC_8331_outline, adjustCoords = TRUE, landList = ALL_lList,
                           imageList = ALL_iList, cartoonID = 'DSC_8331')


#####################################
# PCA
#####################################

# Make population and color list
popList <- list(E_astrild, 
                V_macroura, 
                V_purpurascens, 
                L_rhodopareia)
colList <- c("green", "green", "red", "red")
symbolList <- c(17,2,2,17)

TotalList <- c(rasterList_lanRGB_E_astrild_M,
               rasterList_lanRGB_V_macroura_M,
               rasterList_lanRGB_V_purpurascens_M,
               rasterList_lanRGB_L_rhodopareia_M)

# save(rasterList_lanRGB_E_astrild_M, file="output/rasterList_lanRGB_E_astrild_M.rda")
# save(rasterList_lanRGB_V_macroura_M, file="output/rasterList_lanRGB_V_macroura_M.rda")
# save(rasterList_lanRGB_V_purpurascens_M, file="output/rasterList_lanRGB_V_purpurascens_M.rda")
# save(rasterList_lanRGB_L_rhodopareia_M, file="output/rasterList_lanRGB_L_rhodopareia_M.rda")


pdf("figures/PCA.pdf",width=7,height=5)
pcaOut <- patPCA(TotalList, popList, colList, symbolList = symbolList, plot = TRUE, plotType = 'points', 
                 plotChanges = TRUE, PCx = 1, PCy = 2, plotCartoon = TRUE, refShape = 'mean', 
                 outline = DSC_0170_outline, crop = c(1000,3800,500,2800), adjustCoords = TRUE,  
                 imageList = ALL_iList, landList = ALL_lList, cartoonID = 'DSC_0170', normalized = TRUE, 
                 cartoonFill = 'black', cartoonOrder = 'under', legendTitle = 'Predicted')
dev.off()

# Plot legend
par(mfrow=c(1,1))
plot(0,type='n',axes=FALSE,ann=FALSE, xlim = c(0,10), ylim = c(0,10))

species <- c("V macroura",
             "E astrild",
             "V purpurascens",
             "L rhodopareia")

pdf("figures/legend.pdf",width=7,height=5)
par(mfrow=c(1,1))
plot(0,type='n',axes=FALSE,ann=FALSE, xlim = c(0,10), ylim = c(0,10))
legend(4,8, species, text.font=3, col = colList, pch = symbolList, bty = 'n')
dev.off()


#####################################
# PCA
#####################################

# Make population and color list
popList <- list(E_astrild, 
                V_macroura, 
                V_purpurascens, 
                L_rhodopareia,
                V_obtusa,
                P_afra)
colList <- c("green", "green", "red", "red", "blue", "blue")
symbolList <- c(17,2,2,17,17,2)

TotalList <- c(rasterList_lanRGB_E_astrild_M,
               rasterList_lanRGB_V_macroura_M,
               rasterList_lanRGB_V_purpurascens_M,
               rasterList_lanRGB_L_rhodopareia_M,
               rasterList_lanRGB_V_obtusa_M,
               rasterList_lanRGB_P_afra_M)

# save(rasterList_lanRGB_E_astrild_M, file="output/rasterList_lanRGB_E_astrild_M.rda")
# save(rasterList_lanRGB_V_macroura_M, file="output/rasterList_lanRGB_V_macroura_M.rda")
# save(rasterList_lanRGB_V_purpurascens_M, file="output/rasterList_lanRGB_V_purpurascens_M.rda")
# save(rasterList_lanRGB_L_rhodopareia_M, file="output/rasterList_lanRGB_L_rhodopareia_M.rda")


pdf("figures/PCA_2.pdf",width=7,height=5)
pcaOut <- patPCA(TotalList, popList, colList, symbolList = symbolList, plot = TRUE, plotType = 'points', 
                 plotChanges = TRUE, PCx = 1, PCy = 2, plotCartoon = TRUE, refShape = 'mean', 
                 outline = DSC_0170_outline, crop = c(1000,3800,500,2800), adjustCoords = TRUE,  
                 imageList = ALL_iList, landList = ALL_lList, cartoonID = 'DSC_0170', normalized = TRUE, 
                 cartoonFill = 'black', cartoonOrder = 'under', legendTitle = 'Predicted')
dev.off()

# Plot legend
par(mfrow=c(1,1))
plot(0,type='n',axes=FALSE,ann=FALSE, xlim = c(0,10), ylim = c(0,10))

species <- c("V macroura",
             "E astrild",
             "V purpurascens",
             "L rhodopareia",
             "V obtusa",
             "P afra")

pdf("figures/legend_2.pdf",width=7,height=5)
par(mfrow=c(1,1))
plot(0,type='n',axes=FALSE,ann=FALSE, xlim = c(0,10), ylim = c(0,10))
legend(4,8, species, text.font=3, col = colList, pch = symbolList, bty = 'n')
dev.off()




