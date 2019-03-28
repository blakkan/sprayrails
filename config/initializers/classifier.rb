if Rails.env.rpi?

  $classifier = IO.popen(['python3', '/home/pi/Desktop/weedeater/sources/predict_plant_03_server.py', '/home/pi/Desktop/weedeater/models/third_model.h5'],mode='r+')

end
