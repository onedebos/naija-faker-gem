require 'simplecov'
SimpleCov.start
require 'codecov'
SimpleCov.formatter = SimpleCov::Formatter::Codecov


require './naija-faker'
require './data/data.rb'
RSpec.describe NaijaFaker do 
  describe 'fname' do
    it 'returns a string with a first name' do 
        name = NaijaFaker.fname
        expect(name).not_to be_nil
        expect(name.class).to eq(String)
        expect(name.length).to satisfy("be greater than 2") { |name| name > 2}
        expect(DataBank.first_names.include?(name)).to eq(true)
    end

    it 'returns a first name that starts with the letters passed as an argument' do
        name = NaijaFaker.fname('ra')
        expect(name.start_with?("ra")).to eq(true)
    end
  end
    
  describe 'lname' do
    it 'returns a string with a last name' do
        name = NaijaFaker.lname
        expect(name).not_to be_nil
        expect(name.class).to eq(String)
        expect(name.length).to satisfy("be greater than 2") { |name| name > 2}
        expect(DataBank.last_names.include?(name)).to eq(true)
    end

    it 'returns a last name that starts with the letters passed as an argument' do
        name = NaijaFaker.lname('ra')
        expect(name.start_with?("ra")).to eq(true)
    end
  end

  describe 'states' do
    it 'returns a string with the name of a state' do
      state = NaijaFaker.state
      expect(DataBank.states.include?(state)).to eq(true)
      expect(state.class).to eq(String)
      expect(state.length).to satisfy("be greater than 1") {|state| state > 1}
      expect(state).not_to be_nil
    end
  end

  describe 'person' do
    it "returns a hash with a person's details: fname, lname, age, email, bank and phonenumber" do
        person = NaijaFaker.person
        expect(person).to match(:age => person[:age], :bank => person[:bank], :fname => person[:fname], :lname => person[:lname], :phone_number => person[:phone_number], :state => person[:state])
    end
    
    it "returns a person between the ages of min and max passed in" do
        person = NaijaFaker.person(min:30, max:35)
        expect(person[:age]).to be_between(30,35)
    end

    it "returns a message when the key min and max are not specified" do
        person = NaijaFaker.person({max:30})
        expect(person).to eq("Did you forget to specify the key: min/max?")
    end
  end

  describe 'person_list' do
    it "returns an array of person objects of length 5 if no params are passed in" do
        person_list = NaijaFaker.person_list
        expect(person_list.length).to eq(5)
        expect(person_list.class).to eq(Array)
        expect(person_list[0].class).to eq(Hash)
    end

    it "returns an array of person objects of specified length if a params of amt is passed in" do
        person_list = NaijaFaker.person_list(amt:10)
        expect(person_list.length).to eq(10)
        expect(person_list.class).to eq(Array)
        expect(person_list[0].class).to eq(Hash)
    end

    it "returns an error message when the wrong argument name is passed in" do
        person_list = NaijaFaker.person_list(amts:10)
        expect(person_list).to eq("Did you forget to specify the key: 'amt?'")
    end
  end

  describe "name_list" do
    it "returns an array of strings with 5 names if no parameter is given" do
        name_list = NaijaFaker.name_list
        expect(name_list.length).to eq(5)
        expect(name_list.class).to eq(Array)
        expect(name_list[0].class).to eq(String)
    end

    it "returns an array of the length specified when an amt parameter is given" do
        name_list = NaijaFaker.name_list(amt:20)
        expect(name_list.length).to eq(20)
        expect(name_list.class).to eq(Array)
        expect(name_list[0].class).to eq(String)
    end

    it "returns an error message when the wrong key is passed in" do
        name_list = NaijaFaker.name_list(amts:20)
        expect(name_list).to eq("Did you forget to specify the key: 'amt?'")
    end
  end

  describe "phone_number" do
    it "returns a Nigerian phone number" do
        phone_number = NaijaFaker.phone_number
        expect(phone_number.length).to eq(17)
        expect(phone_number.class).to eq(String)
    end
  end
end 