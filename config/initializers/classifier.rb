if Rails.env.rpi?

  $classifier = IO.popen(['python3', '/home/pi/Desktop/weedeater/sources/predict_plant_02.py', '/home/pi/Desktop/weedeater/models/sec_model.h5', '/home/pi/current_image.jpg'],mode='r+')

end
