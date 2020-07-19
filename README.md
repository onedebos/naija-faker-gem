# naija-faker

This gem helps you generate fake Nigerian data on the fly for use in your projects.

# Getting Started

**To get started, follow the instructions below**

- install the gem `gem install naija-faker`
- import it in your app using:

```
 require "naija-faker"
```

- use it!

```ruby
  NaijaFaker.fname
```

# Available methods

### Generate an array of people with first name, last name, age, bank and state

- To generate an array of people, simply pass an `amt` value to `person_list` i.e `NaijaFaker.person_list(amt: 2)`
- NB: Default `amt` is 5

```ruby

 NaijaFaker.person_list(amt: 2)
  # outputs:
  [
    {:fname=> 'abdul', :lname=>'qadr', :age=>40, :email=> 'abdul.qadr@hey.com', :state=>'ekiti' },
    {:fname=>'frank', :lname=>'edoho', :age=>23, :email=> 'frank.edoho@gmail.com', :state=>'delta' }
  ]

```

### Generate a random First name or Last name

- `NaijaFaker.fname //=> 'abraham'`
- `NaijaFaker.lname //=> 'fatai`

### Generate a random First name or Last name that starts with a letter/letters

- `NaijaFaker.fname('r') //=> 'rahman'`
- `NaijaFaker.lname('bo') //=> 'bolanle'`

### Generate a person hash map with random values for First name, Last name and Age

- **NB: Default age is between 18 - 50**

```ruby
 NaijaFaker.person
 # outputs:
  {
    :fname=>'abdul', :lname=>'qadr', :age=>20,
    :email=>'abdul.qadr@hey.com', :state=>'ekiti'
  }
```

-- To change the default `min` and `max` values for age, pass in min and max values as an object like below.

- e.g:

```ruby
  NaijaFaker.person(min:20, max:50)
  #outputs:
  {
    :fname=>'abdul', :lname=>'qadr', :age=>40,
    :email=>'abdul.qadr@hey.com', :state=>'ekiti', :bank=>'Access bank'
  }

```

### Generate an array of only names

- Simply pass `amt` to `name_list()` e.g

  **NB: Default `amt` is 5**

```
NaijaFaker.name_list(amt: 5)

```

### Generate a random Nigerian state

- Simply call `NaijaFaker.state //=> 'Ondo'`

### Generate a bank name

- Simply call `NaijaFaker.bank //=> 'Access Bank'`

### Test

- To run the test

```ruby
#install rspec:
gem install rspec

# in /lib, run
rspec naija-faker-spec.rb
```

## Authors

👤 **Adebola Adeniran**

- Github: [@githubhandle](https://github.com/onedebos)
- Twitter: [@twitterhandle](https://twitter.com/debosthefirst)
- Linkedin: [linkedin](https://www.linkedin.com/in/adebola-niran/)
- Web: [Adebola.dev](https://adebola.dev)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

## Show your support

Give a ⭐️ if you like this project!

## Acknowledgments

## 📝 License

This project is [MIT](lic.url) licensed.
