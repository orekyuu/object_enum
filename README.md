# ObjectEnum

Java-like Enum can be defined by include this module.  
A good solution to simplify category logic.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'object_enum'
```

And then execute:

    $ bundle install

Or install it yourself as:

    $ gem install object_enum

## Usage
For example, an Enum with a simple single value can be written as: 
```ruby
class Role
  include ObjectEnum
  attr_reader :name
  def initialize(name)
    @name = name
  end

  CUSTOMER = new("customer")
  ADMIN    = new("admin")
end

# Find by name
Role.find(name: "customer") == Role::CUSTOMER
```
If you want to switch implement on the role, you can keep your code simple by splitting the value into another class.
```ruby
class RoleBase
  def label
    raise "Not implemented!!!"
  end
end

class Customer < RoleBase
  def label
    "customer"
  end
end

class Admin < RoleBase
  def label
    "admin"
  end
end

class Role
  include ObjectEnum

  CUSTOMER = Customer.new
  ADMIN = Admin.new

  # Override enum_class method.     
  def self.enum_class
    RoleBase
  end
end

Role::ADMIN.label == "admin"
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/orekyuu/object_enum.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
