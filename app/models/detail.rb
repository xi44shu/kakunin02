class Detail < ApplicationRecord
  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :pipe_type
  belongs_to :pipe_size

end
