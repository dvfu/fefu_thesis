$CACHE_DIR = ".latex-cache"

mkdir -Force $CACHE_DIR
cp source/fefu.ins $CACHE_DIR
cp source/fefu_base.dtx $CACHE_DIR
cp source/fefu.dtx $CACHE_DIR
cp source/fefu_presentation.dtx $CACHE_DIR
cd $CACHE_DIR

latex fefu.ins
pdflatex fefu_base.dtx
pdflatex fefu_style_default.dtx
pdflatex fefu_style_imct.dtx
pdflatex fefu.dtx
pdflatex fefu_presentation.dtx

cd ../
mkdir -Force cls
cp $CACHE_DIR/fefu_base.sty cls
cp $CACHE_DIR/fefu_style_default.sty cls
cp $CACHE_DIR/fefu_style_imct.sty cls
cp $CACHE_DIR/fefu.cls cls
cp $CACHE_DIR/fefu_presentation.cls cls

mkdir -Force doc
cp $CACHE_DIR/fefu_base.pdf doc
cp $CACHE_DIR/fefu_style_default.pdf doc
cp $CACHE_DIR/fefu_style_imct.pdf doc
cp $CACHE_DIR/fefu.pdf doc
cp $CACHE_DIR/fefu_presentation.pdf doc

cp $CACHE_DIR/fefu_base.sty example
cp $CACHE_DIR/fefu_style_default.sty example
cp $CACHE_DIR/fefu_style_imct.sty example
cp $CACHE_DIR/fefu.cls example
cp $CACHE_DIR/fefu_presentation.cls example

rm -r $CACHE_DIR
