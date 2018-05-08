module House


  # my_house = House.new(75,60,80)
  # my_house.ac_on
  # my_house.toggle_heater


  # my_house = AlgosService.new.run_house
  # my_house.heater_on
  def self.run_house(args={})
    binding.pry
    @temp_now = args.fetch(:temp_now, 75)
    @min_temp = args.fetch(:min_temp, 60)
    @max_temp = args.fetch(:max_temp, 80)
    @heater_on = false
    @ac_on = false
    ac_on
  end


  def self.heater_on
    @heater_on = true
    @ac_on = false
    puts "Heater On"
    auto_temp
  end

  def self.ac_on
    @ac_on = true
    @heater_off = false
    puts "AC On"
    auto_temp
  end

  def self.toggle_heater
    if @heater_on == false
      @heater_on = true
      @ac_on = false
      puts "Status: Heater turned On"
      auto_temp
    elsif @heater_on == true
      @heater_on = false
      puts "Status: Heater turned Off"
      auto_temp
    end

    if @ac_on == false
      @ac_on = true
      @heater_on = false
      puts "Status: AC turned On"
      auto_temp
    elsif @ac_on == true
      @ac_on = false
      puts "Status: AC turned Off"
      auto_temp
    end
  end

  def self.update_temp!
    puts "Current Temp: #{@temp_now}."
    if @heater_on == true
      @temp_now = @temp_now + 1
      auto_temp
    elsif @ac_on == true
      @temp_now = @temp_now - 2
      auto_temp
    end
    puts "New Temp: #{@temp_now}."
  end

  def self.auto_temp
    if @min_temp == @temp_now
      puts "Minimum Temperature Reached!"
      toggle_heater
    elsif @max_temp == @temp_now
      puts "Maximum Temperature Reached!"
      toggle_heater
    end
  end


end
