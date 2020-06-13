#/bin/bash
# GopakumarPB-on12-06-2020
# This script is expected to 
#create a short cut from Destop to
#run an RPU 
#Version3-html
if [ ! -d ~/tdstax/RPU ] ; then
   mkdir -p  ~/tdstax/RPU/
cp  -v  ~/Downloads/RPU* ~/tdstax/RPU.zip
cd  ~/tdstax/ 
unzip -d ~/tdstax/RPU -j  RPU
rm -rf RPU.zip
cat >~/Desktop/rpu.sh <<- "EOF"
#/bin/bash
 cd  ~/tdstax/RPU/
EOF
FILE=$(find ~/tdstax/RPU -name "TDS_RPU_*")
echo "java -jar ${FILE##*/}">> ~/Desktop/rpu.sh 
cat >~/Desktop/installed.html <<'_EOF'
<div class="header">
<body style="background-color:#003366;">
  <h1 style="color:tomato">Now you have Installed the RPU !</h1>
  <h3 style="color:tomato"><p>There is a file named rpu.sh in your Desktop.</p>
       <p> Right Click on it , go to properties, </p>
         <p>then to Permissions, put a tick mark to make it executable!</p>
         <p> close and double click on it !</p></h3>
</body>
</div>
_EOF
firefox ~/Desktop/installed.html
rm -rf ~/Desktop/installed.html; else
cat > ~/Desktop/already.html <<'_EOF'
<div class="header">
<body style="background-color: #ff6600;">
  <h1>Sorry! The RPU is already in your system !</h1>
  <h3 style="color:black"><p>If you are trying to install another version, </p>
<p>before clicking the run button, ensure the following:</p>
       <p>1.The file named "rpu.sh"  is removed from your Desktop </p>
         <p>2. The folder named "tdstax" is deleted from your /home folder</p>
         <p>3.Latest version of RPU has been downloaded to your Downloads folder!</p></h3>
</body>
</div>
_EOF
firefox ~/Desktop/already.html
rm -rf ~/Desktop/already.html
exit
fi



