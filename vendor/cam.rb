#require 'numpy'
require 'opencv'

capture = OpenCV::CvCapture.open
sleep 0.01

j = capture.query()

mindim = [j.height, j.width].min
h_center = j.height/2
w_center = j.width / 2
sub = j.sub_rect((j.width - mindim)/2,
     (j.height - mindim)/2, mindim, mindim).resize( OpenCV::CvSize.new(200, 200) )
sub.save("image.jpg")
capture.close

