class Contact

@@all_contacts = []
@@id = 1
  # This method should initialize the contact's attributes
  def initialize(first_name, last_name, email, note)
    @first_name = first_name
    @last_name = last_name
    @email = email
    @note = note
    @id = @@id
    @@id += 1

  end

  # This method should call the initializer,
  # store the newly created contact, and then return it
  def self.create(first_name, last_name, email, note)
    new_contact = Contact.new(first_name, last_name, email, note)
    @@all_contacts << new_contact
    return new_contact
  end

  # This method should return all of the existing contacts
  def self.all
     return @@all_contacts
  end

  # This method should accept an id as an argument
  # and return the contact who has that id
  def self.find(id)
    @@all_contacts.select do |contact|
      if contact.id == id
        return contact
      end
    end
  end

  # This method should allow you to specify
  # 1. which of the contact's attributes you want to update
  # 2. the new value for that attribute
  # and then make the appropriate change to the contact
  def update
    puts "What attribute would you like to update?"
    attribute = gets.chomp
    puts "What is the new value for #{attribute}?"
    attribute_new_value = gets.chomp
    self.selector_change(attribute, attribute_new_value)
  end

  # This method should work similarly to the find method above
  # but it should allow you to search for a contact using attributes other than id
  # by specifying both the name of the attribute and the value
  # eg. searching for 'first_name', 'Betty' should return the first contact named Betty
  def self.find_by
    puts "What is the attribute you wish to search by?"
    attribute = gets.chomp
    puts "What is the value for #{attribute}?"
    attribute_value = gets.chomp
    @@all_contacts.each do |contact|
      if contact.selector(attribute) == attribute_value
        return contact.inspect
      else
        puts "Not found"
      end
    end
  end

  # This method should delete all of the contacts
  def self.delete_all
    @@all_contacts.clear
  end

  def full_name
    return self.first_name + " " + self.last_name
  end

  # This method should delete the contact
  # HINT: Check the Array class docs for built-in methods that might be useful here
  def delete
    @@all_contacts.delete(self)
  end

  def first_name
    @first_name
  end

  def first_name=(first_name)
    @first_name = first_name
  end

  def last_name
    @last_name
  end

  def last_name=(last_name)
    @last_name = last_name
  end

  def email
    @email
  end

  def email=(email)
    @email = email
  end

  def note
    @note
  end

  def note=(note)
    @note = note
  end

  def id
    @id
  end

  def self.all_contacts
    @@all_contacts
  end

  def selector(attribute)
    if attribute == "first_name"
      self.first_name
    elsif attribute == "last_name"
      self.last_name
    elsif attribute == "email"
      self.email
    elsif attribute == "note"
      self.note
    end
  end

  def selector_change(attribute, new_value)
    if attribute == "first_name"
      self.first_name=(new_value)
    elsif attribute == "last_name"
      self.last_name=(new_value)
    elsif attribute == "email"
      self.email=(new_value)
    elsif attribute == "note"
      self.note=(new_value)
    end
  end
  # Feel free to add other methods here, if you need them.

end
