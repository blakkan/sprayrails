require 'rubystats'
if ENV['RAILS_ENV'] =~ /rpi/
require 'rpi_gpio'
end

class DashboardController < ApplicationController

  def display_main_screen
  end

  def display_select_weed_screen
  end

  def display_statistics_screen
  end

  def display_setup_screen
  end

  def update_setup

    if params.key?("run_pump") &&
  	params[:run_pump] == "run_pump" && ENV['RAILS_ENV'] =~ /rpi/

	puts "run pump"

	RPi::GPIO.set_numbering :bcm

	RPi::GPIO.setup 23, :as => :input, :pull => :down
	RPi::GPIO.setup 24, :as => :input, :pull => :up

	RPi::GPIO.setup 21, :as => :output


        RPi::GPIO.set_high 21
        sleep 5
        RPi::GPIO.set_low 21


	RPi::GPIO.reset

    end

    Kv.find_by( key: "sn").update( value: params[:sn] )
    Kv.find_by( key: "latitude").update( value: params[:latitude] )
    Kv.find_by( key: "longitude").update( value: params[:longitude] )
    render :display_setup_screen
  end

  def update_dosage
    Dose.find_by(species: "radish").update_attribute("pump_time", (params.key?("radish_select") ? 0.6 : 0.0))
    Dose.find_by(species: "pea").update_attribute("pump_time", (params.key?("pea_select") ? 0.6 : 0.0))
    Dose.find_by(species: "marigold").update_attribute("pump_time", (params.key?("marigold_select") ? 0.6 : 0.0))
    Dose.find_by(species: "morning_glory").update_attribute("pump_time", (params.key?("morning_glory_select") ? 0.6 : 0.0))
    render :display_select_weed_screen

  end

  def transmit_and_clear_counts

    # And clear all
    [ "radish", "pea", "marigold", "morning_glory"]. each do |plant_count|
      Kv.find_by( key: plant_count).update_attribute( "value", "0")
    end
    Kv.find_by( key: "pump_time").update_attribute( "value", "0.0")
    render :display_statistics_screen
  end

end
