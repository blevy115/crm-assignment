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

    Contact.create(first_name, last_name, email, note)
  end

  def modify_existing_contact
    print "What is the contact id# of the contact you wish to change?"
    id = gets.chomp.to_i
    contact = find_by_id(id)
    contact.update

  end

  def delete_contact
    print "What is the contact id# of the contact you wish to delete?"
    id = gets.chomp.to_i
    find_by_id(id).delete
  end

  def delete_all
    Contact.delete_all
  end

  def display_all
    print Contact.all_contacts
  end

  def search_by_attribute
    print Contact.find_by
  end

  def find_by_id(chosen_id)
    all_contact = Contact.all_contacts
    all_contact.each do |contact|
      if contact.id == chosen_id.to_i
         return contact
      end
    end
  end
end

crm = CRM.new("OOP")
crm.main_menu
