TAR=$(readlink -f $1)

mkdir $TAR
mkdir $TAR/bin $TAR/pkg $TAR/src

echo $(readlink -f $1)
