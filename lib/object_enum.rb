require "object_enum/version"
require "object_enum/enum_class_methods"

# Java-like Enum can be defined by include this module. <br>
# For example, an Enum with a simple single value can be written as:
#   class Role
#     include ObjectEnum
#     attr_reader :name
#
#     def initialize(name)
#       @name = name
#     end
#
#     CUSTOMER = new("customer")
#     ADMIN    = new("admin")
#   end
#
#   # Find by role name
#   admin = Role.find(name: "admin")
#   Role::ADMIN == admin
#
# If you want to switch implement on the role, you can keep your code simple by splitting the value into another class.
#   class RoleBase
#     def label
#       raise "Not implemented!!!"
#     end
#   end
#   class Customer < RoleBase
#     def label
#       "customer"
#     end
#   end
#   class Admin < RoleBase
#     def label
#       "admin"
#     end
#   end
#   class Role
#     include ObjectEnum
#
#     CUSTOMER = Customer.new
#     ADMIN    = Admin.new
#
#     # Override enum_class method.
#     def self.enum_class
#       RoleBase
#     end
#   end
#
#   Role::ADMIN.label == "admin"
module ObjectEnum
  def self.included(enum)
    enum.extend EnumClassMethods
    enum.private_class_method(:new)
  end
end
