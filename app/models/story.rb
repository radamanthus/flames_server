class Story < ActiveRecord::Base

  validates_presence_of :code, :title, :position, :body

  validates_uniqueness_of :position, :scope => :code

  class << self
    def next_position_available(code)
      max_position = Story.maximum(:position, :conditions => ["code = ?", code]) || 0
      debugger
      max_position + 1
    end
  end
end


# == Schema Information
#
# Table name: stories
#
#  id         :integer         not null, primary key
#  code       :string(255)
#  title      :string(255)
#  position   :integer
#  body       :text
#  created_at :datetime
#  updated_at :datetime
#

