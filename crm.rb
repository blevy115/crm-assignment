require_relative 'contact.rb'

class CRM

  def initialize(name_entered)
    @name = name_entered
    puts "Okay, this CRM has the name #{@name}"
  end

  def main_menu
    while true # repeat indefinitely
    print_main_menu
    user_selected = gets.to_i
    call_option(user_selected)
    end
  end

  def print_main_menu
    puts ""
    puts '[1] Add a new contact'
    puts '[2] Modify an existing contact'
    puts '[3] Delete a contact'
    puts '[4] Delete all the contacts'
    puts '[5] Search by attribute'
    puts '[6] Display all contacts'
    puts '[7] Exit'
    puts 'Enter a number: '
  end

  def call_option(user_selected)
    case user_selected
    when 1 then add_new_contact
    when 2 then modify_existing_contact
    when 3 then delete_contact
    when 4 then delete_all
    when 5 then search_by_attribute
    when 6 then display_all
    when 7 then abort
    end
  end

  def add_new_contact
    print "Enter First Name: "
    first_name = gets.chomp

    print "Enter Last Name: "
    last_name = gets.chomp

    print "Enter Email Address: "
    email = gets.chomp

    print "Enter a Note: "
    note = gets.chomp

    contact = Contact.create(
      first_name: first_name,
      last_name:  last_name,
      email:      email,
      note:       note
    )
   end

  def modify_existing_contact
    print "What is the contact id# of the contact you wish to change?"
    id = gets.chomp.to_i
    print "What is the key you want to update?"
    key = gets.chomp
    print "What is the value of #{key.to_s}?"
    value = gets.chomp
    contact = Contact.find(id)
    contact.update({key=>value})

  end

  def delete_contact
    print "What is the contact id# of the contact you wish to delete?"
    id = gets.chomp.to_i
    Contact.find(id).delete
  end

  def delete_all
    Contact.delete_all
  end

  def display_all
    print Contact.all.inspect
  end

  def search_by_attribute
    print "What is the key you want to search by?"
    key = gets.chomp
    print "What is the value of #{key.to_s}?"
    value = gets.chomp
    person = Contact.find_by({key=>value})
    puts person.inspect
  end

end

crm = CRM.new("OOP")
crm.main_menu

at_exit do
  ActiveRecord::Base.connection.close
end
