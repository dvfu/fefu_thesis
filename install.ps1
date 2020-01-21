$CACHE_DIR = ".latex-cache"
$INSTALL_DIR = "fefu"

mkdir -Force $CACHE_DIR
cp source/fefu.ins $CACHE_DIR
cp source/fefu.dtx $CACHE_DIR
cd $CACHE_DIR
latex fefu.ins
pdflatex fefu.dtx
cd ../
mkdir -Force $INSTALL_DIR
cp $CACHE_DIR/fefu.cls $INSTALL_DIR
cp $CACHE_DIR/fefu.pdf $INSTALL_DIR
cp source/fefu.png $INSTALL_DIR
rm -r $CACHE_DIR
