require './data/data.rb'

class NaijaFaker
    WRONG_KEY_MESSAGE = "Did you forget to specify the key:"

    def self.fname(start_with=nil)
        fname_or_lname(start_with, DataBank.first_names)
    end

    def self.lname(start_with=nil)
        fname_or_lname(start_with, DataBank.last_names)
    end

    def self.email(fname, lname)
      min = 0;
      max = DataBank.email_providers.length;
      position = rand(min...max);
      return "#{fname}.#{lname}@#{DataBank.email_providers[position]}"
    end

    def self.state
        min = 0
        max = DataBank.states.length
        position = rand(min...max)
        DataBank.states[position]
    end

    def self.bank
        min = 0
        max = DataBank.banks.length
        position = rand(min...max)
        DataBank.banks[position]
    end

    def self.phone_number
        min = 0
        max = DataBank.phone_numbers.length
        position = rand(min..max)
        DataBank.phone_numbers[position]
    end

    def self.person(options=nil)
        fname = fname()
        lname = lname()
        state = state()
        bank = bank()
        phone_number = phone_number()
        if !options # returns a map
            min = 18
            max = 50
            age = rand(min..max)
            data = {
                "fname": fname,
                "lname": lname,
                "age": age,
                "state": state,
                "bank": bank,
                "phone_number": phone_number
            } 
        else
            return "#{WRONG_KEY_MESSAGE} min/max?" if options[:min].nil? || options[:max].nil?
            min = options[:min]
            max = options[:max]
            age = rand(min..max)
            data = {
                "fname": fname,
                "lname": lname,
                "age": age,
                "state": state,
                "bank": bank,
                "phone_number": phone_number
            }
        end
    end

    def self.person_list(options=nil)
        persons = []
        list_count = 5
        if options
            return "#{WRONG_KEY_MESSAGE} 'amt?'" if options[:amt].nil?
            list_count = options[:amt]
        end

        (1..list_count).each do
            person = person()
            persons << person
        end
      persons  
    end

    def self.name_list(options=nil)
     list_count = 5
     name_list = []
      if options
        return "#{WRONG_KEY_MESSAGE} 'amt?'" if options[:amt].nil?
        list_count = options[:amt]
      end
      (1..list_count).each do
        name = fname()
        name_list << name
      end
      name_list
    end

    

  private
    def self.fname_or_lname(start_with, which_name)
        min = 0
        max = which_name.length
        if !start_with
            position = rand(min..max)
            which_name[position]
          else
            array_of_names_that_start_with_letter = []
            which_name.each do |name|
                if name.start_with?(start_with)
                    array_of_names_that_start_with_letter << name
                end
            end
            max = array_of_names_that_start_with_letter.length
            position = rand(min...max)
            array_of_names_that_start_with_letter[position]
        end
    end
end


