$CACHE_DIR = ".latex-cache"

mkdir -Force $CACHE_DIR
cp source/fefu.ins $CACHE_DIR
cp source/fefu.dtx $CACHE_DIR
cd $CACHE_DIR
latex fefu.ins
pdflatex fefu.dtx
cd ../
mkdir -Force cls
cp $CACHE_DIR/fefu.cls cls
mkdir -Force doc
cp $CACHE_DIR/fefu.pdf doc
rm -r $CACHE_DIR
