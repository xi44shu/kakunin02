class PipeSize < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '150' },
    { id: 3, name: '350' },
    { id: 4, name: '500' },
    { id: 5, name: 'その他' },
  ]

  include ActiveHash::Associations
  has_many :details

end