require './data/data.rb'
class NaijaFaker
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
        DataBank.states[position].downcase
    end

    def self.bank
        min = 0
        max = DataBank.banks.length
        position = rand(min...max)
        DataBank.banks[position].downcase
    end

    # TODO: allow options for fname, lname, min, max, state
    def self.person(options=nil)
        if !options
            min = 18
            max = 50
            fname = fname()
            lname = lname()
            age = rand(min..max)
            state = state()
            bank = bank()
            data = {
                "fname": fname,
                "lname": lname,
                "age": age,
                "state": state,
                "bank": bank,
            }
            # returns a map
            data
        end
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

p NaijaFaker.state

