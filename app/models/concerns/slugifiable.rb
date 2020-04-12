module Slugifiable

  module InstanceMethods
    def slugify
      self.name.gsub(/[^\w\s]/, "").gsub(/[\s]/, "-")
    end
  end

  module ClassMethods
    def find_by_slug(slug)
      puts "Class Test"
    end
  end
end
