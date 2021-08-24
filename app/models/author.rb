class Author < ActiveRecord::Base
  has_many :books # book_ids also given
end


=begin
  Class Methods:
    :Creation Methods:
      new # unsaved
      create # saved
      find_or_create_by # either find an instance in the database or create it

    :Querying Database:
      find # will find by id, NOTE: will raise an error if not found
      find_by_attribute (ex: find_by_id) # will find by an attribute, if not found, will return nil
      find_by # is based on key / value and you can find by multiple attributes
      all # queries all of the records
      where # where clause works just like the where clause in SQL
      limit # works just like sql
      group # works just like sql
      having # works just like sql
      join # works just like sql

  Instance Methods:
    :Update Methods:
      update # updates an instance, accepts key / values
      save # will save a instance or update it in the database
=end