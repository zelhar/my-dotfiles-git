#!/bin/bash
if [ -z "$@" ]; then
	mydomain="yjk-thinkpad"
	echo $mydomain
else
	mydomain="$@"
	echo $mydomain
fi
#rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/CompMath1' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/AlgoDat' ~/FU_link/
#rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/AlgoDatPrak' ~/FU_link/
#rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/spanisch' ~/FU_link/
#rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/Biochemie\ 2' ~/FU_link/


#rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/CoMa2' ~/FU_link/
#rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/TheInfo' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/GTI' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/Stat2' ~/FU_link/
#rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/BC3' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/R' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/matlab' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/other' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/Berufspraktikum' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/useful_textbooks' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/AlgoBi' ~/FU_link/
#rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/genetik' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/neuro' ~/FU_link/
rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/LaTex' ~/FU_link/

rsync -vth --delete --progress  zelhar@$mydomain://'home/zelhar/FU/softpraktikum' ~/FU_link/

rsync -rvth --delete --progress  zelhar@$mydomain://'home/zelhar/HOME2.2/volume1'\
	~/storage/shared/Zelhar/HOME1.1\ \(partial\)/
