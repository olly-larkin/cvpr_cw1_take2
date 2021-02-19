for f in ImagesNew/**/*.JPG; do 	
ffmpeg -i "$f" -vf scale=1500:-1 "ImagesScaled/$f"; 
done
